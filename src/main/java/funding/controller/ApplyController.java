package funding.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	public @ResponseBody String categoryInsert(@RequestBody Project project, HttpSession session, Model model) {
		logger.info("/apply/category [POST]");
		
		//프로젝트와 카테고리 값을 받고 session으로 memberNo를 받아서 insert
		//카테고리 하나의 트랜잭션으로 reward에도 데이터 생성 
		System.out.println("ProjectDto 정보 : " + project.toString());
		
		System.out.println(session.getAttribute("memberNo"));
		project.setMemberNo((Integer)session.getAttribute("memberNo"));
		applyService.categoryInsert(project);
		
		//모델값 전달
		model.addAttribute("projectInfo", project);
		int projectNo = project.getProjectNo();
		
		System.out.println(projectNo);
		
		return projectNo + "";
		
	}
	
	//제품 입력 페이지 이동
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(int projectNo, Model model) {
		logger.info("/apply/product [GET]");
		
		
		//제품 정보 불러옴
		Project projectInfo = applyService.projectSelect(projectNo);
		
		//모델값 저장
		model.addAttribute("projectInfo", projectInfo);
		System.out.println(model.getAttribute("projectInfo"));
		
		return "apply/product";
		
	}
	
	//제품정보 입력
//	@RequestMapping(value = "/product", method = RequestMethod.POST)
//	public void productInput(@RequestBody Project project, Model model) {
//		logger.info("/apply/product [POST]");
//		
//		System.out.println("controller: " + project);
//
//		
//		
//		//제품 정보 입력 
//		applyService.productUpdate(project);
//		
//		//모델값 전달
//		model.addAttribute("projectInfo", project);
////		int projectNo = project.getProjectNo();
//		
////		System.out.println(projectNo);
//		
////		return projectNo + "";
//		
//	}
	
	@RequestMapping(value = "/product", method = RequestMethod.POST)
	public void productInput(
			@RequestPart(value = "projectUpdate") Project project, Model model,
			@RequestPart(value = "file", required = false) MultipartFile file
			) throws Exception {
		logger.info("/apply/product [POST]");
		
		System.out.println(project);
		System.out.println("controller 파일 값: " + file);
		
		//제품 정보 입력 
		applyService.productUpdate(project, file);
		
		Project projectInfo = applyService.projectSelect(project.getProjectNo());
		
		
		//모델값 전달
		model.addAttribute("projectInfo", projectInfo);
//		int projectNo = project.getProjectNo();
		
//		System.out.println(projectNo);
		
//		return projectNo + "";
		
	}
	
	//펀딩계획 페이지 이동
	@RequestMapping(value = "/plan", method = RequestMethod.GET)
	public String plan(int projectNo, Model model) {
		logger.info("/apply/plan [GET]");
		
		//펀딩계획정보 불러옴
		Project projectInfo = applyService.projectSelect(projectNo);
		
		//모델값 저장
		model.addAttribute("projectInfo", projectInfo);

		return "apply/plan";
	}
	
	//펀딩계획 입력
	@RequestMapping(value = "/plan", method = RequestMethod.POST)
	public void planInput(@RequestBody Project project, Model model) {
		logger.info("/apply/plan [POST]");
		
		
		System.out.println(project);
		
		//계획 정보 입력 
		applyService.planUpdate(project);
		
		Project projectInfo = applyService.projectSelect(project.getProjectNo());
		
		
		//모델값 전달
		model.addAttribute("projectInfo", projectInfo);

		
		
	}
	
	//프로젝트 소개 페이지 이동
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String content(int projectNo, Model model) {
		logger.info("/apply/content [GET]");
		
		//프로젝트 소개 정보 불러옴
		Project projectInfo = applyService.projectSelect(projectNo);
		
		//모델값 저장
		model.addAttribute("projectInfo", projectInfo);
		
		return "apply/content";
	}
	
	//프로젝트 소개 입력
	@RequestMapping(value = "/content", method = RequestMethod.POST)
	public void contentInput(Project project) { // 사진 dto 추가
		logger.info("/apply/content [POST]");
	}
	
	//리워드 입력 페이지 이동 
	@RequestMapping(value = "/reward", method = RequestMethod.GET)
	public String reward(int projectNo, Model model) {
		logger.info("/apply/reward [GET]");
		
		//프로젝트 소개 정보 불러옴
		Project projectInfo = applyService.projectSelect(projectNo);
		
		//리워드 정보 불러옴
		List<Reward> rewardList = applyService.rewardSelect(projectNo);
		
		//모델값 저장
		model.addAttribute("projectInfo", projectInfo);
		
		model.addAttribute("rewardList", rewardList);
		
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
