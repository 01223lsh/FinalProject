package funding.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import funding.dto.Member;
import funding.dto.MemberSeller;
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
			return "redirect:/";
		}
		
		project = projectViewService.getProject(project);
		seller = projectViewService.getSeller(project);
		
		model.addAttribute("project", project);
		model.addAttribute("seller", seller);
		
		List<Reward> rewardList = projectViewService.getReward(project);
		
		model.addAttribute("rewardList", rewardList);
		
		
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
		
		project = projectViewService.getStep(project);
		
		model.addAttribute("newsList", newsList);
		model.addAttribute("project", project);
		
		return "project/newsList";
		
	}
	
	@RequestMapping(value = "/project/comment/list")
	public String projectCommentList(Project project, Model model) {
		
		List<ProjectComment> commentList = projectViewService.getCommentList(project.getProjectNo());
		project = projectViewService.getStep(project);
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("project", project);
		
		return "project/commentList";
	}
	
	
	@RequestMapping(value = "/project/content")
	public String projectContent(int projectNo,Model model) {
		
		Project p = projectViewService.getContent(projectNo);
		model.addAttribute("p",p);
		return "project/content";
	}
	
	@RequestMapping(value = "/project/news/view")
	public String projectNewsView(ProjectNews news, Model model) {
		
		news = projectViewService.getNewsView(news);
		
		model.addAttribute("news", news);
		
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
		project = projectViewService.getStep(project);
		
		List<ProjectNews> newsList = projectViewService.getNewsList(news.getProjectNo());
		
		model.addAttribute("newsList", newsList);
		model.addAttribute("project", project);
		return "project/newsList";
		
	}
	
	@RequestMapping(value = "/project/news/delete")
	public String projectNewsDelete(Model model, ProjectNews news) {
		
		logger.info("{}",news);
		projectViewService.deleteNews(news);
		
		List<ProjectNews> newsList = projectViewService.getNewsList(news.getProjectNo());
		
		model.addAttribute("newsList", newsList);
		model.addAttribute("projectNo", news.getProjectNo());
		return "project/newsList";
	}
	
	
	@RequestMapping(value = "/project/comment/write")
	public String projectCommentWrite(Model model, ProjectComment comment, Project project) {
		
		logger.info("/project/comment/write");
		logger.info("{}",comment);
		
		projectViewService.writeComment(comment);
		
		List<ProjectComment> commentList = projectViewService.getCommentList(comment.getProjectNo());
		project = projectViewService.getStep(project);
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("projectNo", comment.getProjectNo());
		model.addAttribute("project", project);
		
		return "project/commentList";
	}
	
	
	@RequestMapping(value = "/project/comment/delete")
	public String projectCommentDelete(Model model, ProjectComment comment) {
		
		projectViewService.deleteComment(comment);
		
		List<ProjectComment> commentList = projectViewService.getCommentList(comment.getProjectNo());
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("projectNo", comment.getProjectNo());
		
		return "project/commentList";
	}
	
}
