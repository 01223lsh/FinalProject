package funding.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import funding.dto.Alert;
import funding.dto.Category;
import funding.dto.Chart;
import funding.dto.Member;
import funding.dto.MemberSeller;
import funding.dto.Notice;
import funding.dto.NoticeFile;
import funding.dto.Project;
import funding.dto.Qna;
import funding.service.face.AdminService;
import funding.util.Paging;
import funding.util.ProjectPaging;

import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	@Autowired
	private ServletContext context;

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	//관리자 페이지 - 통계
	@RequestMapping(value = "/admin/main")
	public void admin() {
	}
	@RequestMapping(value = "/admin/chart" , method= {RequestMethod.GET, RequestMethod.POST})
	public void chart(Model model,Chart chart,String dayType) {
		logger.info("sssssssssssssssssssss{}",chart);
		logger.info("sssssssssssssssssssss{}",dayType);
		if("".equals(dayType) && dayType ==null) {
			
			chart.setSelectDate(7);
		}else {
			chart.setSelectDate(Integer.valueOf(dayType));
			
		}
		List<Chart> chartlist = adminService.selectByMemberDate(chart);
		logger.info("{}",chartlist);
		model.addAttribute("list",chartlist);
		model.addAttribute("chart", chart);
	}
	//qna 수정
	@RequestMapping(value = "/admin/qnaUpdate",method=RequestMethod.GET)
	public void qnaUpdate(Model model,Qna qna) {
		logger.info("aaaaaaaaaa{}",qna);
		qna = adminService.selectbyqnainfo(qna);
		model.addAttribute("qna",qna);
	}
	@RequestMapping(value = "/admin/qnaUpdate",method=RequestMethod.POST)
	public void qnaUpdateWrite(Model model,Qna qna) {
		logger.info("aaaaaaaaaa{}",qna);
		 adminService.qnaUpdate(qna);
	}
	//회원관리
	@RequestMapping(value = "/admin/member")
	public void member(Member member, Model model
			, Paging paging, String disabled
			, String category
			, String content) {
		int i = 4;
		//disabled 비활성화 회원 삭제 할것인지
		if (disabled != null && !disabled.equals("")) {
			adminService.DisabledAllDelete(3);
		}
		List<Member> list;
		
		//등급이 4가 아닐경우 다른
		if (member.getGrade() != 4) {
			i = member.getGrade();
		}
		//페이징
		paging = adminService.membergetPaging(paging, i, category, content);
		if (content != null && !"".equals(content)) {
			//검색
			list = adminService.MemberSearch(category, content, paging);
			//검색 카테고리 검색 내용 전달
			model.addAttribute("con", content);
			model.addAttribute("cat", category);
		} else if (member.getGrade() > 3) {
			//멤버 전체 조회(페이징)
			list = adminService.selectMemberAll(paging);
		} else {
			//등급별 조회(페이징)
			list = adminService.selectByGrade(member, paging);
		}
		int cnt = list.size();
		model.addAttribute("membergrade", member.getGrade());
		model.addAttribute("total", paging.getTotalCount());
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("cnt", cnt);
	}
	//프로젝트 페이지
	@RequestMapping(value = "/admin/project")
	public void project(Model model
			, ProjectPaging paging
			, Project project
			, String projectStep
			, Category category) {
		int i = 5;
		if (project.getProjectStep() < i) {
			//프로젝트 진행현황
			i = project.getProjectStep();
		}
		//프로젝트 카테고리 리스트
		List<Category> categorylist = adminService.categoryList();  
		
		//카테고리 별 or 전체 리스트 조회(페이징)
		paging = adminService.getprojectPaging(paging, i,category);
		//카테고리 별 or 전체 리스트 조회
		List<Project> list = adminService.projectList(paging, i,category);

		
		int cnt = list.size();
		//정보 전달
		model.addAttribute("categoryNo",category.getCategoryNo());
		model.addAttribute("catelist", categorylist);
		model.addAttribute("step", i);
		model.addAttribute("list", list);
		model.addAttribute("cnt", cnt);
		model.addAttribute("paging", paging);
		model.addAttribute("project", list);
	}
	//회원 정보
	@RequestMapping(value = "/admin/memberInfo", method = RequestMethod.GET)
	public void memberInfo(Member member, Model model,MemberSeller memberSeller) {
		//회원 정보 불러옴
		member = adminService.selectBymemberNo(member);
		memberSeller = adminService.selectBymemberSeller(member);
		model.addAttribute("member", member);
		model.addAttribute("memberSeller", memberSeller);
	}

	//멤버 페이지 - 페이징
	@RequestMapping(value = "/layout/paging")
	public String memberpaging(Paging paging
			, String str
			, int grade
			, Model model
			, String content
			, String category) {
		if (content != null && !"".equals(content) && str.equals("member")) {
			//회원 검색 + 등급 + 페이징
			return "redirect:/admin/member?curPage=" + paging.getCurPage()
					+ "&grade=" + grade + "&category=" + category + "&content=" + content;
		} else {
			// 회원 등급 + 페이징
			return "redirect:/admin/member?curPage=" + paging.getCurPage() +
					"&grade=" + grade;
		}
	}
	// 프로젝트 페이징
	@RequestMapping(value = "/layout/projectpaging")
	public String projectpaging(
			ProjectPaging paging
			, int projectStep
			, Model model
			, int categoryNo) {
		//프로젝트 진행 현황 + 페이징 + 카테고리
		return "redirect:/admin/project?curPage=" + paging.getCurPage() + "&projectStep=" + projectStep+"&categoryNo="+categoryNo;
	}
	
	// 페이징
	@RequestMapping(value = "/layout/paging", method = RequestMethod.GET)
	public String memberpaging(Paging paging, String str, Model model) {
		
		if (str.equals("approveProject")) {
			//프로젝트 승인 페이징
			return "redirect:/admin/approveProject?curPage=" + paging.getCurPage();
		} else {
			// 공지사항 페이징
			return "redirect:/admin/notice?curPage=" + paging.getCurPage();
		} 

	}

	//회원 등급 수정
	@RequestMapping(value = "/admin/memberInfo", method = RequestMethod.POST)
	public void memberUpdate(Member member) {
		//회원 등급 수정
		adminService.gradeUpdate(member);
	}

	//공지사항
	@RequestMapping(value = "/admin/notice")
	public void notice(Notice notice, Paging paging, Model model) {
		//공지사항 페이징
		paging = adminService.getnoticePaging(paging);
		//공지사항 정보 리스트
		List<Notice> list = adminService.noticeAll(paging);
		int cnt = list.size();
		model.addAttribute("list", list);
		model.addAttribute("cnt", cnt);
		model.addAttribute("paging", paging);

	}

	//공지사항 내용
	@RequestMapping(value = "/admin/noticeView")
	public void noticeView(Notice notice, Model model, NoticeFile noticeFile) {
		//공지사항 내용
		notice = adminService.selectByNotice(notice);
		//공지사항 이미지 정보
		List<NoticeFile> listfile = adminService.selectBtNoticeFile(notice);
//		noticeFile= adminService.selectByNoticeFile(noticeFile);
		model.addAttribute("upload", context.getRealPath("upload"));
		model.addAttribute("listfile", listfile);
		model.addAttribute("notice", notice);
	}

	//공지사항 작성
	@RequestMapping(value = "/admin/noticeWrite", method = RequestMethod.GET)
	public void noticeWrite() {	}
	//공지사항 작성
	@RequestMapping(value = "/admin/noticeWrite", method = RequestMethod.POST)
	public void noticeWriteResult(Notice notice, MultipartHttpServletRequest mtfRequest) {
		List<MultipartFile> filelist;
		if (mtfRequest.getFile("file").getSize() > 0) {
			filelist = mtfRequest.getFiles("file");
		} else {
			filelist = new ArrayList<MultipartFile>();
		}
		//공지사항 정보 추가
		adminService.noticeWrite(notice, filelist);
	}

	//다운로드 ***삭제예정
	@RequestMapping(value = "/download")
	public String download(Notice notice, Model model) {
		//파일정보 불러오기
		notice = adminService.getFile(notice);
		model.addAttribute("downFile", notice);

		return "down";
	}
	
	//공지사항 수정 GET
	@RequestMapping(value = "/admin/noticeUpdate", method = RequestMethod.GET)
	public void noticeUpdate(Notice notice
			, Model model
			, @ModelAttribute(value = "NoticeFile") NoticeFile noticefile) {
		logger.info("{}", noticefile);

		//공지사항 내용
		notice = adminService.selectByNotice(notice);
		//공지사항 정보로 파일 정보
		List<NoticeFile> noticeFile = adminService.selectByNoticeFile(notice);
		model.addAttribute("noticeFile", noticeFile);
		model.addAttribute("notice", notice);
	}

	//공지사항 수정 POST
	@RequestMapping(value = "/admin/noticeUpdate", method = RequestMethod.POST)
	public void noticeUpdateresult(Notice notice, MultipartHttpServletRequest mtfRequest
			, @RequestParam("fileNolist") List<Integer> fileNolist) {
		logger.info("{}", fileNolist);
		List<MultipartFile> filelist;
		if (mtfRequest.getFile("file").getSize() > 0) {
			filelist = mtfRequest.getFiles("file");
		} else {
			filelist = new ArrayList<MultipartFile>();
		}
		//공지사항 내용 수정
		adminService.noticeUpdate(notice, filelist, fileNolist);
	}

	//공지사항 삭제
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
	public Map approveProject(Project project, Alert alert, Model model) {
		logger.info("[/admin/approveProject][POST]");
		logger.info("파라미터: projectNo: {}", project.getProjectNo());
		logger.info("파라미터: memberNo: {}", project.getMemberNo());
		logger.info("파라미터: projectStep: {}", project.getProjectStep());
		logger.info("파라미터: message: {}", alert);

		// 프로젝트 심사 처리
		int result = adminService.updateProjectStep(project, alert);
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
		
		//문의게시판 목록 조회
		List<Qna> list = adminService.Qnalist(paging,complete);
		
		
		model.addAttribute("complete", complete);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	//문의게시판 페이징
	@RequestMapping(value="/layout/qnapaging")
	public String qnaPaging(String complete, Paging paging) {
		return "redirect:/admin/qna?curPage=" + paging.getCurPage()+"&complete="+complete;
	}
	//문의게시판 상세보기
	@RequestMapping(value="/admin/qnaView")
	public void view(Qna viewqna, Model model) {
		logger.info("/qna/view [GET]");
		//상세보기(게시글-Board)
		viewqna = adminService.qnaview(viewqna);
		//문의사항 답변 확인
		List<Qna> list = adminService.Qnalist();
		model.addAttribute("qna", viewqna);
		model.addAttribute("list", list);
	}
	//문의게시판  답변 삭제
	@RequestMapping(value="/admin/qnaDelete")
	public String qnaDelete(Qna qna) {
		logger.info("컨트롤러로 받아온 삭제용 게시글 번호 : {}", qna.getQnaNo());
		//문의게시판 답변 삭제
		adminService.qnaDelete(qna);
		return "/admin/qna";
		
	}
	//문의사항 답변 작성 GET
	@GetMapping("/admin/qnarewrite")
	public void qnarewrite() {}
	//문의사항 답변 작성 POST
	@PostMapping("/admin/qnarewrite")
	public void qnarewriteProc(Qna qna) {
		logger.info("[write reqna] : {}", qna);
		adminService.qnarewrite(qna);
	}

	
}

