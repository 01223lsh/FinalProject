package funding.controller;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String projectView(Project project, Model model) {
		logger.info("/projectView/view");
		
		if( project.getProjectNo() < 1 ) {
			return "redirect:/";
		}
		
		project = projectViewService.getProject(project);
		
		model.addAttribute("project", project);
		
		List<Reward> rewardList = projectViewService.getReward(project);
		
		model.addAttribute("rewardList", rewardList);
		
		
		//남은 일 계산
		int d = 0;
        
        Date date1= project.getCloseDate();
        Date date2 = new Date(System.currentTimeMillis());
         
        long calDateDays = 0;
        Date FirstDate = date1;
        Date SecondDate = date2;
           
        long calDate = SecondDate.getTime()-FirstDate.getTime(); 
           
        // Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환 
        // 24*60*60*1000을 나눠주면 일수 나옴
        calDateDays = calDate / ( 24*60*60*1000); 
   
        calDateDays = Math.abs(calDateDays);
           
        d = (int)calDateDays;
        
        model.addAttribute("d", d);
		
        return null;
        
	}
	
	@RequestMapping(value = "/project/plan")
	public String projectPlan(Project project, Model model) {
		
		project = projectViewService.getPlan(project);
		
		model.addAttribute("plan", project);
		
		return "project/plan";
	}
	
	
	@RequestMapping(value = "/project/news/list")
	public String projectNewsList(int projectNo, Model model) {
		
		List<ProjectNews> newsList = projectViewService.getNewsList(projectNo);
		
		model.addAttribute("newsList", newsList);
		model.addAttribute("projectNo", projectNo);
		
		return "project/newsList";
		
	}
	
	@RequestMapping(value = "/project/comment/list")
	public String projectCommentList(int projectNo, Model model) {
		
		List<ProjectComment> commentList = projectViewService.getCommentList(projectNo);
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("projectNo", projectNo);
		
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
	public String writeProcess(ProjectNews news,Model model) {
		logger.info("/news/write");
		logger.info("{}",news);
		
		
		projectViewService.writeNews(news);
		
		List<ProjectNews> newsList = projectViewService.getNewsList(news.getProjectNo());
		
		model.addAttribute("newsList", newsList);
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
	public String projectCommentWrite(Model model, ProjectComment comment) {
		
		logger.info("/project/comment/write");
		logger.info("{}",comment);
		
		projectViewService.writeComment(comment);
		
		List<ProjectComment> commentList = projectViewService.getCommentList(comment.getProjectNo());
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("projectNo", comment.getProjectNo());
		
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
