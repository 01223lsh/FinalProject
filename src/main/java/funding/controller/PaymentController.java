package funding.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import funding.dto.Delivery;
import funding.dto.Order;
import funding.dto.Payment;
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
	
	@GetMapping(value = "/payment/chooseReward")
	public void chooseReward(Model model, Reward reward) {
		
		logger.info("/payment/chooseReward [GET]");
		
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
	
	@PostMapping(value = "/payment/chooseReward")
	public String chooseRewardProc(Model model
			, @RequestParam("rewardNo") int[] rewardNoArr
			, @RequestParam("rewardCount") int[] rewardCountArr
			, Order order
			, int additionalFunding
			, int totalPrice) {
		logger.info("/payment/choseeRewardProc [POST]");
		
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
		
		//주문정보 추가 
		paymentService.addOrder(order, rewardNoArr, rewardCountArr);
		
		//조회된 reward정보 리스트 모델값 전송
		model.addAttribute("rewardList", rewardList);
		model.addAttribute("rewardCountArr", rewardCountArr);
		
		//추가 펀딩금, 총금액 모델값 전송
		model.addAttribute("additionalFunding", additionalFunding);
		model.addAttribute("totalPrice", totalPrice);
		
		return "redirect:/payment/order?orderNo=" + order.getOrderNo();
	}
	
	@GetMapping(value = "/payment/order")
	public void paymentOrder(Model model, Order order) {
		
		logger.info("/payment/order [GET]");
		
		logger.info("order 정보 : {}", order);
		
		List<Order> rewardOrderList = paymentService.detailRewardOrder(order);
		
//		for (Order o : rewardOrderList) {
//			logger.info("{}", o);
//		}
		
		//추가금, 총금액 모델값 전송
		model.addAttribute("orderFunding", order);
		model.addAttribute("rewardOrderList", rewardOrderList);
	}
	
	
	@PostMapping(value = "/payment/order")
	public void paymentOrderProc(@RequestBody HashMap<String, String> map) {
		logger.info("/payment/order [POST]");
		
		logger.info("map 정보 : {}", map);
		
		logger.info("key값이 orderNo : {}", map.get("orderNo"));
		
		paymentService.addPayment(map);
		paymentService.addDelivery(map);
		
		//재고 주문한 갯수만큼 감소
		paymentService.decreaseAmount(Integer.parseInt(map.get("orderNo")));
		
		//주문 결제 완료 상태로 변경 
		paymentService.changeStatus(Integer.parseInt(map.get("orderNo")));
		
		//결제 완료 후 어떤 URL로 이동할 지 importPayment.jsp에서 볼 수 있다.
		//location.href="/payment/result?orderNo=" + orderNo
	}
	
	@RequestMapping(value = "/payment/result")
	public void result(Order order, Model model) {
		logger.info("/payment/result [Connection]");
		
		logger.info("order 정보 : {} ", order);
	}
}
