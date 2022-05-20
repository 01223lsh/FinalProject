package funding.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public void contentInput(@RequestBody Project project, Model model) {
		logger.info("/apply/content [POST]");
		
		System.out.println(project);
		
		//제품 정보 입력 
		applyService.contentUpdate(project);
		
		Project projectInfo = applyService.projectSelect(project.getProjectNo());
		
		//모델값 전달
		model.addAttribute("projectInfo", projectInfo);
		
	}
	
	//ck에디터 - 파일안에 사진파일 저장
	@RequestMapping(value = "/ck/upload", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ckUpload(
	HttpServletRequest req
	, HttpServletResponse resp
	, @RequestParam("upload") MultipartFile file) {
	Map<String, Object> json = new HashMap<>();
	//resp.setCharacterEncoding("UTF-8"); // 없어도 되는거 같은데 참고할 땐 있어서 일단 놔둠
	//resp.setContentType("text/html; charset=UTF-8"); // 이것도 마찬가지
	// 파일은 컨텍스트 루트의 '/img' 에 저장되도록 설정
	// 저장된 파일이름을 반환
	String fileName = applyService.fileUpload(file);
	// servlet-context.xml 에 <resources> url로 설정
	String fileUrl = "/projectPhoto/" + fileName;
	// ckEditor 4.9.0 버전 이후에는 JSON 형태로 리턴하도록 ckEditor document 에서 정의
	json.put("uploaded", 1);
	json.put("fileName", fileName);
	json.put("url", fileUrl);
	
	logger.info("json: {}", json);
	
	return json;
	}
	
	
	//리워드 입력 페이지 이동 
	@RequestMapping(value = "/reward", method = RequestMethod.GET)
	public String reward(int projectNo, Model model) {
		logger.info("/apply/reward [GET]");
		
		//프로젝트 소개 정보 불러옴
		Project projectInfo = applyService.projectSelect(projectNo);
		
		//리워드 정보 불러옴
		List<Reward> rewardList = applyService.rewardSelect(projectNo);
		
		System.out.println(rewardList);
		
		//모델값 저장
		model.addAttribute("projectInfo", projectInfo);
		
		model.addAttribute("rewardList", rewardList);
		
		return "apply/reward";
	}
	
	//리워드 입력
	@RequestMapping(value = "/reward", method = RequestMethod.POST)
	public void rewardInsert(@RequestBody Reward reward, Model model) {
		logger.info("/apply/reward [POST]");
		
		System.out.println(reward);
		
		//계획 정보 입력 
		applyService.rewardInsert(reward);
		
//		List<Reward> rewardList = applyService.rewardSelect(projectNo);
		
		//모델값 전달
//		model.addAttribute("rewardInfo", rewardInfo);
	}
	
	//선택한 리워드 삭제
	@RequestMapping(value = "/rewardDelete" )
	public String rewardDelete(int rewardNo) {
		logger.info("/apply/rewardDelete");
	
		System.out.println(rewardNo);

		// rewardNo를 가져와서 일치하는 데이터 삭제 
		applyService.rewardDelete(rewardNo);
		
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
