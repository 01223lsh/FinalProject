package funding.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import funding.dto.Member;
import funding.service.face.MemberService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	
	//로그인 페이지 이동 임시로 생성
	@RequestMapping(value = "/login")
	public String loginPage() {
		logger.info("임시 로그인 페이지로 이동");
		
		return "member/login";
	}
	
	@RequestMapping(value = "/member/login")
	public void login() {
		logger.info("/member/login 접속 완료");
	}

	@PostMapping("/member/loginform")
	public String loginProcess(Member member, HttpSession session, Model model) {
		logger.info("/member/login [POST]");
		logger.info("{}", member);
		// -> jsp쪽에서 name을 적지 않으면 받아오지 못해서 null값 나온다

		// 로그인 인증
		boolean loginResult = memberService.login(member);

		if (loginResult) {
			logger.info("로그인 성공");

			// 로그인 성공하면 session 객체 사용해서 세션 저장
			session.setAttribute("login", loginResult);
			session.setAttribute("id", member.getId());
			session.setAttribute("grade", memberService.getGrade(member));
			session.setAttribute("nick", memberService.getNick(member));
			session.setAttribute("memberNo", memberService.getMemberNo(member));

//			return "redirect:/member/main";
			
			//병합 전 로그인 인터셉터 추가를 위한 임시 수정
			return "redirect:/project/list";

		} else {
			logger.info("로그인 실패");
//			session.invalidate();

			return "/member/login";
		}
	}
}
