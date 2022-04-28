package funding.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import funding.dto.Category;
import funding.dto.Project;
import funding.dto.Reward;
import funding.service.face.ApplyService;


@Controller
@RequestMapping(value = "/apply")
public class ApplyController {
	
	//서비스 객체
	@Autowired
	private ApplyService applyService;
	
	private static final Logger logger = LoggerFactory.getLogger(ApplyController.class);
	
	//프로젝트 생성
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public void category() {
		logger.info("/apply/category [GET]");
	}

	@RequestMapping(value = "/category", method = RequestMethod.POST)
	public void categoryInsert(Category category) {
		logger.info("/apply/category [POST]");
		
		//프로젝트와 카테고리 값을 받고 session으로 memberNo를 받아서 insert
		//카테고리 하나의 트랜잭션으로 reward에도 데이터 생성 
		
	}
	
	//제품 입력 페이지 이동
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(Project project, Model model) {
		logger.info("/apply/product [GET]");
		
		//제품 정보 불러옴
		return "apply/product";
		
	}
	
	//제품정보 입력
	@RequestMapping(value = "/product", method = RequestMethod.POST)
	public void productInput(Project project) {
		logger.info("/apply/product [POST]");
		
	}
	
	//펀딩계획 페이지 이동
	@RequestMapping(value = "/plan", method = RequestMethod.GET)
	public String plan(Project project, Model model) {
		logger.info("/apply/plan [GET]");
		
		//펀딩계획정보 불러옴
		return "apply/plan";
	}
	
	//펀딩계획 입력
	@RequestMapping(value = "/plan", method = RequestMethod.POST)
	public void planInput(Project project) {
		logger.info("/apply/plan [POST]");
	}
	
	//프로젝트 소개 페이지 이동
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String content(Project project, Model model) {
		logger.info("/apply/content [GET]");
		
		return "apply/content";
	}
	
	//프로젝트 소개 입력
	@RequestMapping(value = "/content", method = RequestMethod.POST)
	public void contentInput(Project project) { // 사진 dto 추가
		logger.info("/apply/content [POST]");
	}
	
	//리워드 입력 페이지 이동 
	@RequestMapping(value = "/reward", method = RequestMethod.GET)
	public String reward(Reward reward, Model model) {
		logger.info("/apply/reward [GET]");
		
		return "apply/reward";
	}
	
	//리워드 입력
	@RequestMapping(value = "/reward", method = RequestMethod.POST)
	public void rewardInsert(Reward reward) {
		logger.info("/apply/reward [POST]");
	}
	
	//선택한 리워드 삭제
	@RequestMapping(value = "/rewardDelete")
	public String rewardDelete(Reward reward) {
		logger.info("/apply/rewardDelete");
		
		// rewardNo를 가져와서 일치하는 데이터 삭제 
		
		
		return "redirect:/apply/reward";
	}
	
	//프로젝트 최종 신청
	@RequestMapping(value = "/applyFinal")
	public String apply(Project project) {
		logger.info("/applyFinal");
		
		// projectStep 값 1로 update
		
		//메인 페이지로 redirect
		return "redirect:/";
	}
	
	
	
}
