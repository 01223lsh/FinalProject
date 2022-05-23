package funding.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import funding.dto.Qna;
import funding.service.face.QnaService;
import funding.util.Paging;

@Controller
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Autowired
	QnaService qnaService;

	@GetMapping("/qna/list")
	public void list(Paging pagingParam, Model model) {

//		logger.info("/board/list [GET]");

		// 페이징 계산
		Paging paging = qnaService.getPaging(pagingParam);

//		logger.info("페이징내용물: {}", pagingParam);

		// 게시글 목록 조회
		List<Qna> list = qnaService.list(paging);

		for (Qna q : list) {
//			logger.info("foreach : {}", q);
		}

		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}

	@GetMapping("/qna/view")
	public void view(Qna viewqna, Model model) {

//		logger.info("/qna/view [GET]");
//		logger.info("viewqna의 값을 찾자 : {}", viewqna);

		// 상세보기(게시글-Board)
		Qna qnaview = qnaService.qnaview(viewqna);

//		logger.info("상세보기 게시글 확인하기 : {}", qnaview);

		// refer >2 일 경우, 답글 작성 불가하게 "답글 작성" 버튼 숨기기
		int reCnt = qnaService.qnaReCnt(viewqna);

		// 답글 같이 보여주기
		Qna qnareview = qnaService.qnareview(qnaview);
//		logger.info("상세보기 답글 게시글 확인하기 : {}", qnareview);

		model.addAttribute("qna", qnaview);
		model.addAttribute("reCnt", reCnt);
		model.addAttribute("qnare", qnareview);

	}

	@GetMapping("/qna/qnawrite")
	public String qnawrite(HttpSession session) {

//		logger.info("/qna/qnawrite [GET]");

//		logger.info("현재 로그인한 상태 : {}", session.getAttribute("loginResult"));

		if (session.getAttribute("login") != null && ((Boolean) session.getAttribute("login"))) {
			return "/qna/qnawrite";
		} else {
			return "redirect:/member/login";
		}
	}

	@PostMapping("/qna/qnawrite")
	public String qnawriteProc(HttpSession session, Qna qna) {

//		logger.info("[write] board 확인 : {}", qna);

		qnaService.qnawrite(qna);

		return "redirect:/qna/view?qnaNo=" + qna.getQnaNo();
	}

	@GetMapping("/qna/qnarewrite")
	public String qnarewrite(HttpSession session) {

//		logger.info("/qna/qnarewrite [GET]");

//		logger.info("현재 로그인한 상태 : {}", session.getAttribute("loginResult"));

//		if (((String) session.getAttribute("login")) != null && ((String) session.getAttribute("login")).equals("true")
//				&& Integer.valueOf((String) session.getAttribute("grade")) == 2) {
//			return "/qna/qnarewrite";
//		} else {
//			return "redirect:/member/login";
//		}

		int grade = (Integer) session.getAttribute("grade");
//		logger.info("하하하핳하 : {}", grade);
		
		String login = String.valueOf( session.getAttribute("login"));
//		logger.info("하하하핳하 : {}", login);
		
		if (login != null && login.equals("true")
				&& grade == 2) {
			return "/qna/qnarewrite";
		} else {
			return "redirect:/member/login";
		}
	}

	@PostMapping("/qna/qnarewrite")
	public String qnarewriteProc(HttpSession session, Qna qna) {

//		logger.info("[write reqna] : {}", qna);

		qnaService.qnarewrite(qna);

		return "redirect:/qna/list";
	}

	@GetMapping("/qna/qnaupdate")
	public void qnaupdate(Qna qna, Model model) {

		// 상세보기(게시글-Board)
		Qna qnaview = qnaService.qnaview(qna);

		model.addAttribute("qna", qnaview);

	}

	@PostMapping("/qna/qnaupdate")
	public String qnaupdateProc(HttpSession session, Qna qna) {

//		logger.info("컨트롤러로 받아온 게시글 번호 : {}", qna.getQnaNo());

		qnaService.qnaupdate(qna);

		return "redirect:/qna/view?qnaNo=" + qna.getQnaNo();
	}

	@RequestMapping(value = "/qna/qnadelete")
	public String delete(Qna qna) {

//		logger.info("컨트롤러로 받아온 삭제용 게시글 번호 : {}", qna.getQnaNo());

		qnaService.delete(qna);

		return "redirect:/qna/list";

	}

	@RequestMapping(value = "/qna/qnadeleteAd")
	public String deleteAd(Qna qna) {

//		logger.info("컨트롤러로 받아온 삭제용 게시글 번호 : {}", qna.getQnaNo());

		qnaService.deleteAd(qna);

		return "redirect:/qna/list";

	}

}
