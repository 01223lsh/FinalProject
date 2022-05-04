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
import org.springframework.web.multipart.MultipartFile;

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
		
		
		logger.info("/board/list [GET]");
		
		//페이징 계산
		Paging paging = qnaService.getPaging(pagingParam);
		
		//게시글 목록 조회
		List<Qna> list = qnaService.list(paging);
		
		for(Qna q : list) {
			logger.info("foreach : {}", q);
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
	@GetMapping("/qna/view")
	public void view(Qna viewqna, Model model) {
		
		logger.info("/qna/view [GET]");

		
		//상세보기(게시글-Board)
		Qna qnaview = qnaService.qnaview(viewqna);

		
		model.addAttribute("qna", qnaview);
		
		
	}
	
	@GetMapping("/qna/qnawrite")
	public String qnawrite(HttpSession session) {
		
		logger.info("/qna/qnawrite [GET]");
		
		logger.info("현재 로그인한 상태 : {}", session.getAttribute("loginResult"));
		
		if(session.getAttribute("loginResult") != null && (boolean)session.getAttribute("loginResult")) {
			return "/qna/qnawrite";
		}else {
			return "redirect:/mypage/login";
		}
	}
	
	@PostMapping("/qna/qnawrite")
	public String qnawriteProc(HttpSession session, Qna qna) {
		
		logger.info("[write] board 확인 : {}", qna);
		
		qnaService.qnawrite(qna);
		
		return "redirect:/qna/view?qnaNo=" + qna.getQnaNo();
	}
	
	@GetMapping("/qna/qnarewrite")
	public String qnarewrite(HttpSession session) {
		
		logger.info("/qna/qnarewrite [GET]");
		
		logger.info("현재 로그인한 상태 : {}", session.getAttribute("loginResult"));
		
		if(session.getAttribute("loginResult") != null && (boolean)session.getAttribute("loginResult") && (int)session.getAttribute("grade")==2) {
			return "/qna/qnarewrite";
		}else {
			return "redirect:/mypage/login";
		}
		
	}
	
	@PostMapping("/qna/qnarewrite")
	public String qnarewriteProc(HttpSession session, Qna qna) {
		
		logger.info("[write reqna] : {}", qna);
		
		qnaService.qnarewrite(qna);
		
		return "redirect:/qna/list";
	}
	
	
	
	@GetMapping("/qna/qnaupdate")
	public void qnaupdate(Qna qna, Model model) { 
		
		//상세보기(게시글-Board)
		Qna qnaview = qnaService.qnaview(qna);

		
		model.addAttribute("qna", qnaview);
		
	}

	
	@PostMapping("/qna/qnaupdate")
	public String qnaupdateProc(HttpSession session, Qna qna) {
		
		logger.info("컨트롤러로 받아온 게시글 번호 : {}", qna.getQnaNo());
		
		qnaService.qnaupdate(qna);
		
		return "redirect:/qna/view?qnaNo=" + qna.getQnaNo();
	}
	
	
	@RequestMapping(value = "/qna/qnadelete")
	public String delete(Qna qna) {
		
		logger.info("컨트롤러로 받아온 삭제용 게시글 번호 : {}", qna.getQnaNo());
		
		
		qnaService.delete(qna);
		
		
		return "redirect:/qna/list";
		
	}
	
	
}
