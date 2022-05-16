package funding.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import funding.dto.Project;
import funding.service.face.SearchService;
import funding.util.Paging;

@Controller
@RequestMapping(value = "/search")
public class SearchController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@Autowired
	private SearchService searchService;

	@RequestMapping(value = "/list")
	public String list(Paging paramData, Model model) {
		logger.info("/project/list");

		// 페이징 계산
		Paging paging = searchService.getPaging(paramData);
		logger.info("{}", paging);

		// 게시글 목록 조회
		List<Project> list = searchService.list(paging);
		for (Project p : list) {
			logger.info("{}", p);
		}

		model.addAttribute("paging", paging);
		model.addAttribute("list", list);

		return "project/list";
	}

	@RequestMapping("/view")
	public String view(Project viewProject, Model model, HttpSession session) {
		logger.info("/project/view - {}", viewProject);

		// 잘못된 게시글 번호 처리
		if (viewProject.getProjectNo() < 1) {
			return "redirect:/project/list";
		}

		// 게시글 조회
		viewProject = searchService.view(viewProject);
		logger.info("조회된 게시글 {}", viewProject);

		// 모델값 전달 - 게시글
		model.addAttribute("viewProject", viewProject);

		return "project/view";
	}

}
