package funding.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import funding.dto.Delivery;
import funding.dto.Order;
import funding.dto.Reward;
import funding.service.face.PaymentService;

@Controller
public class PaymentController {
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	PaymentService paymentService;
	
	@RequestMapping(value = "/payment/temporary")
	public void projectView(Model model) {
		logger.info("/payment/temporary");
		
		//리워드 선택지 불러오기 
		List<Reward> rewardList = paymentService.rewardList();
//		for (Reward r : rewardList) {
//			logger.info("RewardList : {}", r);
//		}
		
		//모델값 전송
		model.addAttribute("rewardList", rewardList);
	}
	
	@RequestMapping(value = "/payment/chooseReward")
	public void chooseReward(Model model, Reward reward) {
		
		logger.info("/payment/chooseReward");
		
		//리워드 선택지 불러오기 
		List<Reward> rewardList = paymentService.rewardList();
//		for (Reward r : rewardList) {
//			logger.info("RewardList : {}", r);
//		}
		
		//전달받은 rewardNo 확인
		logger.info("전송된 RewardNo : {}", reward.getRewardNo());
		
		//모델값 전송
		model.addAttribute("rewardNo", reward.getRewardNo());
		model.addAttribute("rewardList", rewardList);
	}
	
	@GetMapping(value = "/payment/order")
	public void orderFirst(Model model
			, @RequestParam("rewardNo") int[] rewardNoArr
			, @RequestParam("rewardCount") int[] rewardCountArr
			, int additionalFunding
			, int totalPrice) {
		logger.info("/payment/order [GET]");
		
		logger.info("전달 받은 rewardNoArr : {}", rewardNoArr);
		logger.info("전달 받은 rewardCountArr : {}", rewardCountArr);
		
		//전달받은 rewardNo의 배열을 반복문을 통하여 상세정보를 저장하고 
		//List객체에 추가
		List<Reward> rewardList = new ArrayList<>();
		for (int i=0; i<rewardNoArr.length; i++) {
			Reward rewardNo = new Reward();
			rewardNo.setRewardNo(rewardNoArr[i]);
			Reward reward = paymentService.detailReward(rewardNo);
			logger.info("들어갈 reward 정보 : {}", reward);
			rewardList.add(reward);
		}
		//list에 저장된 정보 확인
		for (Reward reward : rewardList) {
			logger.info("reward : {}", reward);
		}
		
		logger.info("추가 펀딩금 : {}", additionalFunding);
		logger.info("총 금액 : {}", totalPrice);
		
		//조회된 reward정보 리스트 모델값 전송
		model.addAttribute("rewardList", rewardList);
		model.addAttribute("rewardCountArr", rewardCountArr);
		//추가 펀딩금, 총금액 모델값 전송
		model.addAttribute("additionalFunding", additionalFunding);
		model.addAttribute("totalPrice", totalPrice);
	}
	
	@PostMapping(value = "/payment/order")
	public String paymentResult(Model model
			, Delivery delivery
			, Order order
			, @RequestParam("rewardNo") int[] rewardNoArr
			, @RequestParam("rewardCount") int[] rewardCountArr) {
		logger.info("/payment/order [POST]");
		
		//전달 받은 파라미터 확인
		logger.info("rewardNo : {}", rewardNoArr);
		logger.info("rewardCount : {}", rewardCountArr);
		logger.info("delivery : {}", delivery);
		
		//전달 받은 파라미터 DTO객체에 들어 갔는지 확인
		logger.info("Order : {} ", order);
		
		//주문정보 추가 
		paymentService.addOrder(order, delivery, rewardNoArr, rewardCountArr);
		
		return "redirect:/payment/paymentResult";
	}
	
}
