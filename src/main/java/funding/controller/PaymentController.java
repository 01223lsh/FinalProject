package funding.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value = "/payment/chooseReward", method=RequestMethod.GET)
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
	
	@RequestMapping(value = "/paymetn/order")
	public void order() {
		logger.info("/payment/order");
	}
}
