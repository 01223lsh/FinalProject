package funding.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import funding.dto.Alert;
import funding.service.face.AlertService;

@Controller
@RequestMapping(value = "/alert")
public class AlertController {
	
	@Autowired
	private AlertService alertService;
	
	private static final Logger logger = LoggerFactory.getLogger(AlertController.class);
	
	//안읽은 알림 보여주기
	@RequestMapping(value="/list", method = RequestMethod.POST)
	public String alertList(HttpSession session, Model model) {

		logger.info("/alert/list [GET]");
		
		int memberNo = (Integer)session.getAttribute("memberNo");

		// 알림 정보 불러옴
		List<Alert> alertList = alertService.alertSelect(memberNo);
		
//		System.out.println(alertList);
		
		//모델값 저장
		model.addAttribute("alertList", alertList);
		
		//포워딩
		return "/alert/list";
	}
	
	//알림 읽음표시(삭제)
	@RequestMapping(value="/delete" , method = RequestMethod.POST)
	public String alertDelete(HttpSession session, Model model, @RequestBody Alert alert) {
		logger.info("/alert/delete [POST]");
		
//		System.out.println(alert);
		
		int alertNo = alert.getAlertNo(); 
		
		//알림 삭제 
		alertService.alertRead(alertNo);
		
		return "/alert/list";
		
	}

	//알림 읽음표시(삭제)
	@RequestMapping(value="/deleteAll" , method = RequestMethod.POST)
	public String alertDeleteAll(HttpSession session, Model model) {
		logger.info("/alert/deleteAll [POST]");
		
		int memberNo = (Integer)session.getAttribute("memberNo");
		
		//모든 알림 읽기
		alertService.alertReadAll(memberNo);
		
		return "/alert/list";
		
	}
	
	//안읽은 메시지 수
	@RequestMapping(value="/unread", method = RequestMethod.POST)
	public String alertUnread(HttpSession session, Model model) {

		logger.info("/alert/unread [GET]");
		
		
		if(session.getAttribute("memberNo") == null) {
			return "/alert/list";
		}
		int memberNo = (Integer)session.getAttribute("memberNo");

		// 알림 정보 불러옴
		int alertUnread = alertService.alertUnread(memberNo);
		
//		System.out.println(alertUnread);
		
		//모델값 저장
		model.addAttribute("alertUnread", alertUnread);
		
		//포워딩
		return "/alert/list";
	}
	
	
	
	
}
