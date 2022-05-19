package funding.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import funding.dto.Order;
import funding.dto.Project;
import funding.dto.Reward;
import funding.service.face.PaymentService;

@Controller
public class PaymentController {
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	PaymentService paymentService;
	
	@GetMapping(value = "/payment/chooseReward")
	public void chooseReward(HttpSession session, Model model, Reward reward, int projectNo) {
		
		logger.info("/payment/chooseReward [GET]");
		
		logger.info("projectNo : {}", projectNo);
		
		//리워드 선택지 불러오기 
		List<Reward> rewardList = paymentService.rewardListByProjectNo(projectNo);
//		for (Reward r : rewardList) {
//			logger.info("RewardList : {}", r);
//		}
		
		//전달받은 rewardNo 확인
		logger.info("전송된 RewardNo : {}", reward.getRewardNo());
		
		//로그인 되어 있는 세션 정보 불러오기
		int memberNo = (int) session.getAttribute("memberNo");
		
		//세션정보 확인
//		logger.info("세션 memberNo : {}", memberNo);
		
		//모델값 전송
		model.addAttribute("rewardNo", reward.getRewardNo());
		model.addAttribute("rewardList", rewardList);
		model.addAttribute("projectNo", projectNo);
		model.addAttribute("memberNo", memberNo);
	}
	
	@PostMapping(value = "/payment/chooseReward")
	public String chooseRewardProc(Model model
			, @RequestParam("rewardNo") int[] rewardNoArr
			, @RequestParam("rewardCount") int[] rewardCountArr
			, Order order
			, int projectNo) {
		logger.info("/payment/chooseRewardProc [POST]");
		
		logger.info("전달 받은 projectNo : {}", projectNo);
		logger.info("전달 받은 rewardNoArr : {}", rewardNoArr);
		logger.info("전달 받은 rewardCountArr : {}", rewardCountArr);
		logger.info("order 의 정보 : {}", order);
		
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
		
		//주문정보 추가 
		paymentService.addOrder(order, rewardNoArr, rewardCountArr);
		
		return "redirect:/payment/order?orderNo=" + order.getOrderNo() + "&projectNo=" + projectNo;
	}
	
	@GetMapping(value = "/payment/order")
	public void paymentOrder(HttpSession session, Model model, Order order, Project project) {
		
		logger.info("/payment/order [GET]");
		
		logger.info("project 정보 : {}", project);
		
		logger.info("order 정보 : {}", order);
		
		//주문 리워드에 대한 개수
		List<Order> rewardOrderList = paymentService.detailRewardOrder(order);
		
//		for (Order o : rewardOrderList) {
//			logger.info("{}", o);
//		}
		
		//orderNo를 통하여 총금액 추가금액 조회한다. 
		order = paymentService.detailOrder(order);
		logger.info("detailOrder 메소드 이후 order : {}", order);
		
		//프로젝트 번호를 받아 프로젝트 이름 조회 
		project = paymentService.checkProjectTitle(project);
		logger.info("checkProjectTitle 메소드 이후 project : {}", project);
		
		//추가금, 총금액 모델값 전송
		model.addAttribute("order", order);
		model.addAttribute("rewardOrderList", rewardOrderList);
		model.addAttribute("project", project);
	}
	
	
	@PostMapping(value = "/payment/order")
	public void paymentOrderProc(@RequestBody HashMap<String, String> map) {
		logger.info("/payment/order [POST]");
		
		logger.info("map 정보 : {}", map);
		
		paymentService.addPayment(map);
		paymentService.addDelivery(map);
		
		//재고 주문한 갯수만큼 감소
		paymentService.decreaseAmount(Integer.parseInt(map.get("orderNo")));
		
		//주문 결제 완료 상태로 변경 
		paymentService.changeStatus(Integer.parseInt(map.get("orderNo")));
		
		//결제 완료 후 어떤 URL (주문번호와 프로젝트 번호 전달)이동할 지 importPayment.jsp에서 볼 수 있다.
		//location.href="/payment/result?orderNo=" + orderNo + "&projectNo=" + projectNo;
	}
	
	@RequestMapping(value = "/payment/result")
	public void result(Order order, Model model, int projectNo) {
		logger.info("/payment/result [Connection]");
		
		logger.info("projectNo 정보: {}", projectNo);
		
		logger.info("order 정보 : {} ", order);
	}
}
