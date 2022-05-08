package funding.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import funding.dto.Category;
import funding.dto.Member;
import funding.dto.Notice;
import funding.dto.NoticeFile;
import funding.dto.Project;
import funding.dto.Qna;
import funding.service.face.AdminService;
import funding.util.Paging;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	@Autowired
	private ServletContext context;

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@RequestMapping(value = "/admin/admin")
	public void admin() {
	}

	@RequestMapping(value = "/admin/member")
	public void member(Member member, Model model
			, Paging paging, String disabled
			, String category
			, String content) {
		int i = 4;

		if (disabled != null && !disabled.equals("")) {
			adminService.DisabledAllDelete(3);
		}
		List<Member> list;
		if (member.getGrade() != 4) {
			i = member.getGrade();
		}
		paging = adminService.membergetPaging(paging, i, category, content);
		if (content != null && !"".equals(content)) {
			list = adminService.MemberSearch(category, content, paging);
			model.addAttribute("con", content);
			model.addAttribute("cat", category);
		} else if (member.getGrade() > 3) {
			list = adminService.selectMemberAll(paging);
		} else {
			list = adminService.selectByGrade(member, paging);
		}
		int cnt = list.size();
		model.addAttribute("membergrade", member.getGrade());
		model.addAttribute("total", paging.getTotalCount());
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("cnt", cnt);
	}

	@RequestMapping(value = "/admin/project")
	public void project(Model model
			, Paging paging
			, Project project
			, String projectStep
			, Category category) {
		int i = 5;
		if (project.getProjectStep() < i) {
			i = project.getProjectStep();
		}
		List<Category> categorylist = adminService.categoryList();  
		
		paging = adminService.getprojectPaging(paging, i,category);
		List<Project> list = adminService.projectList(paging, i,category);

		
		int cnt = list.size();
		model.addAttribute("categoryNo",category.getCategoryNo());
		model.addAttribute("catelist", categorylist);
		model.addAttribute("step", i);
		model.addAttribute("list", list);
		model.addAttribute("cnt", cnt);
		model.addAttribute("paging", paging);
		model.addAttribute("project", list);
	}

	@RequestMapping(value = "/admin/memberInfo", method = RequestMethod.GET)
	public void memberInfo(Member member, Model model) {
		member = adminService.selectBymemberNo(member);
		model.addAttribute("member", member);
	}

	@RequestMapping(value = "/layout/memberpaging")
	public String memberpaging(Paging paging
			, String str
			, int grade
			, Model model
			, String content
			, String category) {
		if (content != null && !"".equals(content) && str.equals("member")) {
			return "redirect:/admin/member?curPage=" + paging.getCurPage()
					+ "&grade=" + grade + "&category=" + category + "&content=" + content;
		} else {
			return "redirect:/admin/member?curPage=" + paging.getCurPage() +
					"&grade=" + grade;
		}
	}

	@RequestMapping(value = "/layout/projectpaging")
	public String projectpaging(
			Paging paging
			, int projectStep
			, Model model
			, int categoryNo) {
		return "redirect:/admin/project?curPage=" + paging.getCurPage() + "&projectStep=" + projectStep+"&categoryNo="+categoryNo;

	}

	@RequestMapping(value = "/layout/paging", method = RequestMethod.GET)
	public String memberpaging(Paging paging, String str, Model model) {
		if (str.equals("approveProject")) {
			return "redirect:/admin/approveProject?curPage=" + paging.getCurPage();
		} else if (str.equals("notice")) {
			return "redirect:/admin/notice?curPage=" + paging.getCurPage();
		} else {
			return "redirect:/admin/order?curPage=" + paging.getCurPage();
		}

	}

	@RequestMapping(value = "/admin/memberInfo", method = RequestMethod.POST)
	public void memberUpdate(Member member) {
		logger.info("{}", member);
		adminService.gradeUpdate(member);
	}

	@RequestMapping(value = "/admin/notice")
	public void notice(Notice notice, Paging paging, Model model) {
		paging = adminService.getnoticePaging(paging);
		List<Notice> list = adminService.noticeAll(paging);
		int cnt = list.size();
		model.addAttribute("list", list);
		model.addAttribute("cnt", cnt);
		model.addAttribute("paging", paging);

	}

	@RequestMapping(value = "/admin/noticeView")
	public void noticeView(Notice notice, Model model, NoticeFile noticeFile) {
		notice = adminService.selectByNotice(notice);
		List<NoticeFile> listfile = adminService.selectBtNoticeFile(notice);
//		noticeFile= adminService.selectByNoticeFile(noticeFile);
		model.addAttribute("upload", context.getRealPath("upload"));
		model.addAttribute("listfile", listfile);
		model.addAttribute("notice", notice);
	}

	@RequestMapping(value = "/admin/noticeWrite", method = RequestMethod.GET)
	public void noticeWrite() {	}

	@RequestMapping(value = "/admin/noticeWrite", method = RequestMethod.POST)
	public void noticeWriteResult(Notice notice, MultipartHttpServletRequest mtfRequest) {
		List<MultipartFile> filelist;
		if (mtfRequest.getFile("file").getSize() > 0) {
			filelist = mtfRequest.getFiles("file");
		} else {
			filelist = new ArrayList<MultipartFile>();
		}
		adminService.noticeWrite(notice, filelist);
	}

	@RequestMapping(value = "/download")
	public String download(Notice notice, Model model) {
		notice = adminService.getFile(notice);
		model.addAttribute("downFile", notice);

		return "down";
	}

	@RequestMapping(value = "/admin/noticeUpdate", method = RequestMethod.GET)
	public void noticeUpdate(Notice notice
			, Model model
			, @ModelAttribute(value = "NoticeFile") NoticeFile noticefile) {
		logger.info("{}", noticefile);

		notice = adminService.selectByNotice(notice);
		List<NoticeFile> noticeFile = adminService.selectByNoticeFile(notice);
		model.addAttribute("noticeFile", noticeFile);
		model.addAttribute("notice", notice);
	}

	@RequestMapping(value = "/admin/noticeUpdate", method = RequestMethod.POST)
	public void noticeUpdateresult(Notice notice, MultipartHttpServletRequest mtfRequest
			, @RequestParam("fileNolist") List<Integer> fileNolist) {
		logger.info("{}", fileNolist);
		List<MultipartFile> filelist;
		if (mtfRequest.getFile("file").getSize() > 0) {
			logger.info("ddddddddd{}", mtfRequest.getFile("file").getSize());
			filelist = mtfRequest.getFiles("file");
		} else {
			filelist = new ArrayList<MultipartFile>();
		}
		adminService.noticeUpdate(notice, filelist, fileNolist);
	}

	@RequestMapping(value = "/admin/noticeDelete")
	public String noticeDelete(Notice notice) {
		adminService.noticeDelete(notice);
		return "/admin/notice";
	}


	// create by young
	// 심사 대기중인 프로젝트 페이지
	@RequestMapping("/admin/approveProject")
	public ModelAndView approveProjectPage(Paging paging) {
		logger.info("[/admin/approveProject][GET]");
		paging = adminService.getapproveProjectpaging(paging);
		ModelAndView mav = new ModelAndView("admin/approveProject");
		Map<String, Object> model = mav.getModel();
		logger.info("{}",mav);
		List<Project> list = adminService.getWaitingProject(paging);
		int cnt = list.size();
		model.put("list", list);
		model.put("paging",paging);
		model.put("cnt",cnt);
		
		return mav;
	}

	// create by young
	// 프로젝트 심사 처리
	@RequestMapping(value = "/admin/approveProject", method = RequestMethod.POST)
	@ResponseBody
	public Map approveProject(Project project, @RequestParam(required = false) String message, Model model) {
		logger.info("[/admin/approveProject][POST]");
		logger.info("파라미터: projectNo: {}", project.getProjectNo());
		logger.info("파라미터: memberNo: {}", project.getMemberNo());
		logger.info("파라미터: projectStep: {}", project.getProjectStep());
		logger.info("파라미터: message: {}", message);

		// 프로젝트 심사 처리
		int result = adminService.updateProjectStep(project, message);
		logger.info("프로젝트 심사처리 결과: {}", result);

		// View 전달 데이터 (JSON)
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		if (project.getProjectStep() == 3 && result == 1) {
			jsonMap.put("msg", "프로젝트 승인에 성공하였습니다.");
		} else if (project.getProjectStep() == 3 && result == -1) {
			jsonMap.put("msg", "프로젝트 승인에 실패했습니다.");
		} else if (project.getProjectStep() == 2 && result == 1) {
			jsonMap.put("msg", "프로젝트 승인을 거절했습니다.");
		} else if (project.getProjectStep() == 2 && result == -1) {
			jsonMap.put("msg", "프로젝트 승인을 거절에 실패했습니다.");
		}
		logger.info("json 결과: {}", jsonMap);
		return jsonMap;
	}

	// create by young
	// 프로젝트 심사 처리
	@RequestMapping("/admin/projectDetail")
	public ModelAndView getProject(Project project) {
		logger.info("[/admin/projectDetail][GET]");
		logger.info("파라미터: projectNo - {}", project.getProjectNo());
		ModelAndView mav = new ModelAndView("admin/projectDetail");
		Map<String, Object> model = mav.getModel();

		// 개별 프로젝트 상세내용 조회
		Project result = adminService.getProject(project);
		logger.info("조회된 프로젝트: {}", result);

		// View 전달 데이터
		model.put("project", result);
		return mav;
	}
	
	//은지님 코드 (ajax)수정
	@RequestMapping(value="/admin/qna")
	public void list(Paging pagingParam, Model model,@Param("complete") String complete) {
		
		logger.info("ccccc{}",complete);
		//페이징 계산
		Paging paging = adminService.getQnaPaging(pagingParam,complete);
		
		//게시글 목록 조회
		List<Qna> list = adminService.Qnalist(paging,complete);
		
		
		model.addAttribute("complete", complete);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/layout/qnapaging")
	public String qnaPaging(String complete, Paging paging) {
		
		return "redirect:/admin/qna?curPage=" + paging.getCurPage()+"&complete="+complete;
		
	}
	@RequestMapping(value="/admin/qnaView")
	public void view(Qna viewqna, Model model) {
		logger.info("/qna/view [GET]");
		//상세보기(게시글-Board)
		viewqna = adminService.qnaview(viewqna);
		List<Qna> list = adminService.Qnalist();
		model.addAttribute("qna", viewqna);
		model.addAttribute("list", list);
	}
	@RequestMapping(value="/admin/qnaDelete")
	public String qnaDelete(Qna qna) {
		logger.info("컨트롤러로 받아온 삭제용 게시글 번호 : {}", qna.getQnaNo());
		adminService.qnaDelete(qna);
		return "/admin/qna";
		
	}
	@GetMapping("/admin/qnarewrite")
	public void qnarewrite() {}
	
	@PostMapping("/admin/qnarewrite")
	public void qnarewriteProc(Qna qna) {
		logger.info("[write reqna] : {}", qna);
		adminService.qnarewrite(qna);
	}

	
}

