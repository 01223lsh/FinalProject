package funding.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

}
