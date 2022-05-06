package funding.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import funding.dto.Member;
import funding.service.face.MemberService;


@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//서비스 객체
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/main")
	public void main() {
		logger.info("/member/main");
	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET )
	public void login() {
		logger.info("/member/login [GET]");
		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member member, HttpSession session) {
		
		// 요청 객체로부터 전달된 파라미터 받아오기
		String id = member.getId();
		String pw = member.getPw();

		// 유저 정보 DB로부터 로드 (닉네임, 프사 등)
//		String nickname = memberService.loadUserInfo(userid).getNickname();
		Member memberInfo = memberService.loadUserInfo(id);


//		// 뷰 지정: 성공시 메인페이지로 리다이렉트, 실패시 실패 안내
		if(id == null || id.equals("") || pw == null || pw.equals("")) {
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "모든 내용을 입력해주세요.");
			return "redirect:/member/login";
			
		}
		
		//로그인 결과값
		int result = memberService.idpwCheck(id, pw);
		
		if(result == 1) {
			session.setAttribute("login", true);
			session.setAttribute("Id", memberInfo.getId());
			session.setAttribute("name", memberInfo.getName());
			session.setAttribute("nick", memberInfo.getNick());
			session.setAttribute("memberNo", memberInfo.getMemberNo());
			session.setAttribute("phone", memberInfo.getPhone());
			session.setAttribute("grade", memberInfo.getGrade());
			session.setAttribute("messageType", "성공메시지");
			session.setAttribute("messageContent", "로그인에 성공했습니다.");
			return "redirect:/member/main";
		} 
		else if(result == 2) {
			session.setAttribute("messageType", "오류메시지");
			session.setAttribute("messageContent", "비밀번호를 다시 확인하세요.");
			return "redirect:/member/login";
		}
		else if(result == 3) {
			session.setAttribute("messageType", "오류메시지");
			session.setAttribute("messageContent", "탈퇴한 회원 입니다.");
			return "redirect:/member/login";
		}
		else if(result == 0) {
			session.setAttribute("messageType", "오류메시지");
			session.setAttribute("messageContent", "아이디가 존재하지 않습니다.");
			return "redirect:/member/login";			
		}
		else {
			session.setAttribute("messageType", "오류메시지");
			session.setAttribute("messageContent", "데이터베이스 오류가 발생했습니다.");
			return "redirect:/member/login";			
		}

	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/member/main";

	}
}
