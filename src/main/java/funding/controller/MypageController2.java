package funding.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import funding.dto.Member;
import funding.service.face.MypageService;

@Controller
public class MypageController2 {

	private static final Logger logger = LoggerFactory.getLogger(MypageController2.class);
	
	@Autowired
	MypageService mypageService;
	
	
	
	//실험용 테스트 로그인
	//----------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/mypage/login", method = RequestMethod.GET)
	public void login() {
		logger.info("/mypage/login [GET]");
	}
	
	@RequestMapping(value = "/mypage/login", method = RequestMethod.POST)
	public String loginProc(Member member, HttpSession session) {
		logger.info("/member/loginProc : {}" , member);

		//로그인 인증
		boolean loginResult = mypageService.login(member);
		
		if(loginResult) {
			
			//로그인 성공
			logger.info("로그인 성공");
			
			session.setAttribute("loginResult", loginResult);
			session.setAttribute("id", member.getId());
			session.setAttribute("nick", mypageService.getNick(member));
			session.setAttribute("member_no", mypageService.getMember_no(member));
			
			logger.info("세션에 저장한 member : {}", session.getAttribute("member_no"));
			System.out.println("세션 확인 : " + session.getAttribute("id"));
			System.out.println("세션 확인 : " + session.getAttribute("nick"));
			System.out.println("세션 확인 : " + session.getAttribute("member_no"));
			
			return "redirect:/mypage/main";
			
		} else {
			//로그인 실패
			logger.info("로그인 실패");
			
			session.invalidate();
			return "redirect:/mypage/login";
		}	
	}
	
	
	@RequestMapping("/mypage/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/mypage/main";
	}
	//----------------------------------------------------------------------------------------------------------------------
	
	//전체 메인
	@GetMapping("/mypage/main")
	public void main() { }
	
	
	//마이페이지 메인
	@GetMapping("/mypage/mypagemain")
	public String mypageMain(HttpSession session, Model model) {
		
		
		String result = String.valueOf((boolean) session.getAttribute("loginResult"));
		logger.info("result : {}", result);
		
		if((boolean) session.getAttribute("loginResult")) { }
			return "/mypage/mypagemain";
//		}
//		else {
//			return "redirect:/mypage/main";
//
//		}
	
	}	
	
		
		

	
	
	@GetMapping("/mypage/infoview")
	public void infoview(HttpSession session, Model model) {
		
		logger.info("/member/infoview [GET]" );
		
		String loginid = (String) session.getAttribute("id");
		logger.info("mypage[loginid] = {}", loginid);
		
		//로그인 된 사용자 정보 조회
		Member info = mypageService.info(loginid);
		logger.info("mypage [info] : {}" , info);
		
		model.addAttribute("info", info);
	}
	
	
	@GetMapping("/mypage/infoupdate")
	public void infoupdate(HttpSession session, Model model) {
		
		String loginid = (String) session.getAttribute("id");
		logger.info("mypage[loginid] = {}", loginid);
		
		//로그인 된 사용자 정보 조회
		Member info = mypageService.info(loginid);
		logger.info("mypage [info] : {}" , info);
		
		model.addAttribute("info", info);
		
	}
	
	@PostMapping("/mypage/infoupdate")
	public String infoupdateProc(Member member) {
		
		logger.info("들어온 값 확인 : {}", member);
		
		mypageService.infoUpdate(member);
		
		return "redirect:/mypage/infoview";
	}
	
	@ResponseBody
	@GetMapping("/mypage/nickChk")
	public int nickChk(@RequestParam("nick") String nick) {
		
		int result = mypageService.nickChk(nick);
		
		return result;
	}
	
	
	
	
	
}
