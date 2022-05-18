package funding.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import funding.commons.Pagination;
import funding.dto.Category;
import funding.dto.Project;
import funding.service.face.ProjectService;

@Controller
public class ProjectController {

	private static final Logger log = LoggerFactory.getLogger(ProjectController.class);

	@Autowired
	private ProjectService projectService;

	@RequestMapping(value = "/member/main", method = RequestMethod.GET)
	public String main(Pagination pagination, Model model) {
		log.info("[/member/main][GET]");

		List<Project> list = projectService.getPageList(pagination);

		List<Category> cList = projectService.getCategoryList();

		model.addAttribute("cList", cList);
		log.info("카테고리 조회결과: {}", cList);
		model.addAttribute("list", list);
		log.info("조회결과: {}", list);
		model.addAttribute("pagination", pagination);
		log.info("pagination: {}", pagination);

		return "member/main";
	}

	@RequestMapping(value = "/project/list", method = RequestMethod.GET)
	public String list(Pagination pagination, Model model) {
		log.info("[/project/list][GET]");

		List<Project> list = projectService.getPageList(pagination);
		log.info("조회결과: {}", list);

		List<Category> cList = projectService.getCategoryList();
		log.info("카테고리 조회결과: {}", cList);

		model.addAttribute("cList", cList);
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
		log.info("pagination: {}", pagination);

		return "project/list";
	}

//	  @RequestMapping("/search/view") public String view(Project viewProject, Model
//	  model, HttpSession session) { log.info("/project/view - {}", viewProject);
//	  
//	 // 잘못된 게시글 번호 처리 if (viewProject.getProjectNo() < 1) { return
//	  "redirect:/project/list"; }
//	  
//	  // 게시글 조회 viewProject = projectService.view(viewProject);
//	  log.info("조회된 게시글 {}", viewProject);
//	  
//	  // 모델값 전달 - 게시글 model.addAttribute("viewProject", viewProject);
//	  
//	  return "project/view"; }

	@PostMapping(value = "/member/main")
	public String searchByMain(Pagination pagination, Pagination paramData, Model model) {

		log.info("[/member/main][POST]");

		List<Project> list = projectService.getPageList(pagination);

		List<Category> cList = projectService.getCategoryList();

		model.addAttribute("cList", cList);
		log.info("카테고리 조회결과: {}", cList);
		model.addAttribute("list", list);
		log.info("조회결과: {}", list);
		model.addAttribute("pagination", pagination);
		log.info("pagination: {}", pagination);

		model.addAttribute("paramData", paramData);
		log.info("paramData : {} ", paramData);

		return "project/listsearch";

	}

}
