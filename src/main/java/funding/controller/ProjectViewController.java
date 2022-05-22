package funding.controller;


import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import funding.dto.Member;
import funding.dto.Payment;
import funding.dto.Project;
import funding.dto.ProjectComment;
import funding.dto.ProjectNews;
import funding.dto.Reward;
import funding.service.face.ProjectViewService;

@Controller
public class ProjectViewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectViewController.class);
	
	@Autowired
	private ProjectViewService projectViewService;

	@RequestMapping(value = "/project/view")
	public String projectView(Project project, Model model, Member seller) {
		logger.info("/projectView/view");
		
		if( project.getProjectNo() < 1 ) {
			return "redirect:/main";
		}
		
		
		
		project = projectViewService.getProject(project);
		
		
		int contributors = projectViewService.getContributors(project.getProjectNo());
		
		seller = projectViewService.getSeller(project);
		
		logger.info("seller 정보 {}",seller);
		
		model.addAttribute("project", project);
		model.addAttribute("seller", seller);
		model.addAttribute("contributors", contributors);
		
		if(project.getProjectStep() == 3) {
		List<Reward> rewardList = projectViewService.getReward(project);
		
		model.addAttribute("rewardList", rewardList);
		}
		
		//남은 일 계산
		Calendar today = Calendar.getInstance();
		Calendar dday = Calendar.getInstance();
		
		dday.setTime(project.getCloseDate());
		
		long day = dday.getTimeInMillis()/86400000;
		long tday = today.getTimeInMillis()/86400000;
		
		
		long count = day - tday; //오늘날짜에 day날짜를 빼준다
		
		
        model.addAttribute("d", (int)count+1);
		
        return null;
        
	}
	
	@RequestMapping(value = "/project/plan")
	public String projectPlan(Project project, Model model) {
		
		project = projectViewService.getPlan(project);
		
		model.addAttribute("plan", project);
		
		return "project/plan";
	}
	
	
	@RequestMapping(value = "/project/news/list")
	public String projectNewsList(Project project, Model model) {
		
		List<ProjectNews> newsList = projectViewService.getNewsList(project.getProjectNo());
		
		project = projectViewService.getStep(project.getProjectNo());
		
		model.addAttribute("newsList", newsList);
		model.addAttribute("project", project);
		
		return "project/newsList";
		
	}
	
	@RequestMapping(value = "/project/comment/list")
	public String projectCommentList(Project project, Model model) {
		
		List<ProjectComment> commentList = projectViewService.getCommentList(project.getProjectNo());
		project = projectViewService.getStep(project.getProjectNo());
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("project", project);
		logger.info("comment List {}", project);
		
		return "project/commentList";
	}
	
	
	@RequestMapping(value = "/project/content")
	public String projectContent(int projectNo,Model model) {
		
		Project p = projectViewService.getContent(projectNo);
		model.addAttribute("p",p);
		return "project/content";
	}
	
	@RequestMapping(value = "/project/news/view")
	public String projectNewsView(ProjectNews news, Model model,Project project) {
		
		news = projectViewService.getNewsView(news);
		project = projectViewService.getStep(news.getProjectNo());
		
		model.addAttribute("news", news);
		model.addAttribute("project", project);
		
		logger.info("news view {}", project);
		return "project/newsView";
	}
	
	
	@GetMapping("/project/news/write")
	public String write(int projectNo,Model model) {
		logger.info("{}",projectNo);
		model.addAttribute("projectNo", projectNo);
		return "project/newsWrite";
	}
	
	@PostMapping("/project/news/write")
	public String writeProcess(ProjectNews news,Model model, Project project) {
		logger.info("/news/write");
		logger.info("{}",news);
		
		
		projectViewService.writeNews(news);
		project = projectViewService.getStep(news.getProjectNo());
		
		List<ProjectNews> newsList = projectViewService.getNewsList(news.getProjectNo());
		
		model.addAttribute("newsList", newsList);
		model.addAttribute("project", project);
		return "project/newsList";
		
	}
	
	@RequestMapping(value = "/project/news/delete")
	public String projectNewsDelete(Model model, ProjectNews news,Project project) {
		
		logger.info("{}",news);
		projectViewService.deleteNews(news);
		
		List<ProjectNews> newsList = projectViewService.getNewsList(news.getProjectNo());
		project = projectViewService.getStep(news.getProjectNo());
		
		model.addAttribute("newsList", newsList);
		model.addAttribute("projectNo", news.getProjectNo());
		model.addAttribute("project", project);
		return "project/newsList";
	}
	
	
	@RequestMapping(value = "/project/comment/write")
	public String projectCommentWrite(Model model, ProjectComment comment, Project project) {
		
		logger.info("/project/comment/write");
		logger.info("전달받은 댓글 입력 값 : {}",comment);
		
		projectViewService.writeComment(comment);
		
		List<ProjectComment> commentList = projectViewService.getCommentList(comment.getProjectNo());
		project = projectViewService.getStep(comment.getProjectNo());
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("projectNo", comment.getProjectNo());
		model.addAttribute("project", project);
		
		return "project/commentList";
	}
	
	
	@RequestMapping(value = "/project/comment/delete")
	public String projectCommentDelete(Model model, ProjectComment comment, Project project) {
		
		projectViewService.deleteComment(comment);
		
		List<ProjectComment> commentList = projectViewService.getCommentList(comment.getProjectNo());
		project = projectViewService.getStep(comment.getProjectNo());
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("projectNo", comment.getProjectNo());
		model.addAttribute("project", project);
		return "project/commentList";
	}
	
	@RequestMapping(value = "/project/ck/upload", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ckUpload(
	HttpServletRequest req
	, HttpServletResponse resp
	, @RequestParam("upload") MultipartFile file) {
	Map<String, Object> json = new HashMap<>();
	
	
	// 파일은 컨텍스트 루트의 '/img' 에 저장되도록 설정
	// 저장된 파일이름을 반환
	String fileName = projectViewService.fileUpload(file);
	// servlet-context.xml 에 <resources> url로 설정
	String fileUrl = "/ckImg/" + fileName;
	// ckEditor 4.9.0 버전 이후에는 JSON 형태로 리턴하도록 ckEditor document 에서 정의
	json.put("uploaded", 1);
	json.put("fileName", fileName);
	json.put("url", fileUrl);
	
	logger.info("json: {}", json);
	
	return json;
	}
	
	
	@RequestMapping(value = "/project/talktime")
	public String projectTalktimeUpdate(Project project) {
		
		projectViewService.updateTalktime(project);
		logger.info("{}",project.getProjectNo());
		return "redirect:/project/view?projectNo="+project.getProjectNo();
	}
	
	@RequestMapping(value = "/project/contributors")
	public String projectContributorsList(Payment payment,Model model ) {
		
		List<Payment> coList = projectViewService.getContributorsList(payment);
		int contributors = projectViewService.getContributors(payment.getProjectNo());
		
		
		model.addAttribute("coList", coList);
		model.addAttribute("contributors", contributors);
		
		return "project/contributorsList";
	}
	
	
	
}
