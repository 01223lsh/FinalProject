package funding.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import funding.dto.Reward;
import funding.service.face.AlertService;

@Controller
@RequestMapping(value = "/alert")
public class AlertController {
	
	@Autowired
	private AlertService alertService;
	
	private static final Logger logger = LoggerFactory.getLogger(AlertController.class);
	
	//안읽은 알림 보여주기
	@RequestMapping(value="/list")
	public void alertList(HttpSession session, Model model) {

		logger.info("/ [GET]");
		
		int memberNo = (Integer)session.getAttribute("memberNo");

		// 알림 정보 불러옴
		List<Reward> alertList = alertService.alertSelect(memberNo);
		
		System.out.println(alertList);
		
		//모델값 저장
		
		model.addAttribute("alertList", alertList);
		
	}
	
	//알림 읽음표시(삭제)
	
	
	
	//안읽은 메시지 수
	
	
	
	
	
}
