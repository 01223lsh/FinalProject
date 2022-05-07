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
import funding.dto.MemberSeller;
import funding.service.face.MypageService;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
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
			
			Member memberinfo = mypageService.getMemberinfo(member);
			
//			session.setAttribute(name, value);
			
//			session.setAttribute("nick", mypageService.getNick(member));
//			session.setAttribute("memberNo", mypageService.getMemberNo(member));
//			session.setAttribute("grade", mypageService.getGrade(member));
			
			
			session.setAttribute("nick", memberinfo.getNick());
			session.setAttribute("memberNo", memberinfo.getMemberNo());
			session.setAttribute("grade", memberinfo.getGrade());
//			session.setAttribute("", memberinfo.get);
			
			
			
			logger.info("세션에 저장한 member : {}", session.getAttribute("memberNo"));
			System.out.println("세션 확인 : " + session.getAttribute("id"));
			System.out.println("세션 확인 : " + session.getAttribute("nick"));
			System.out.println("세션 확인 : " + session.getAttribute("memberNo"));
			System.out.println("세션 확인 : " + session.getAttribute("grade"));
		
			
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
	public String mypageMain(HttpSession session, Model model, Member member) {
		
		
		//여기서 소셜 구분을 해야할듯
		String loginid = (String) session.getAttribute("id");
		member.setId(loginid);
		
		int chk = mypageService.chkSocialId(member);
		
		//세션에 chk 저장하자(0: 소셜 / 1 : 일반회원)
		session.setAttribute("socialchk", chk);
		
		String result = String.valueOf((boolean) session.getAttribute("loginResult"));
		logger.info("result : {}", result);
		
		if((boolean) session.getAttribute("loginResult")) {
			
			return "/mypage/mypagemain";
		} else {
			return "redirect:/mypage/login";
		}
			
	}	
	
		
	@GetMapping("/mypage/mypagepwchk")
	public String mypagepw(HttpSession session, Member member) {
		
		//여기서 소셜 구분을 해야할듯
		String loginid = (String) session.getAttribute("id");
		member.setId(loginid);
		
		int chk = mypageService.chkSocialId(member);
		
		
		
		//세션에 chk 저장하자(0: 소셜 / 1 : 일반회원)
		session.setAttribute("socialchk", chk);
		
		if((boolean) session.getAttribute("loginResult")) {
			
			return "/mypage/mypagepwchk";
		} else {
			return "redirect:/mypage/login";
		}

		
	}

	
	@PostMapping("/mypage/mypagepwchk")
	public String mypagepwProc(HttpSession session, Member member) {
		
		String loginid = (String) session.getAttribute("id");
		member.setId(loginid);
		
		int grade = (int) session.getAttribute("grade");
		int pwchk = mypageService.mypwchk(member);
		
		logger.info("pwchk의 결과는? : {}", pwchk);
		
//		if(pwchk>0 && grade == 0) {
//			return "redirect:/mypage/infoview";
//		} else if (pwchk >0 && grade ==2){
//			return "redirect:/mypage/infoview";
//		} else if (pwchk >0 && grade ==1) {
//			return "redirect:/mypage/sellerinfo";
//		} else {
//			return "redirect:/mypage/mypagepwchk";
//		}
		
		return "redirect:/mypage/infoview";
		
	}
	
	
	@GetMapping("/mypage/mypagepwchkseller")
	public String mypaagepwsekker(HttpSession session, Member member) {
		
		String loginid = (String) session.getAttribute("id");
		member.setId(loginid);
		
		int grade = (int) session.getAttribute("grade");
		int pwchk = mypageService.mypwchk(member);
		
		logger.info("pwchk의 결과는? : {}", pwchk);
		
		if((boolean) session.getAttribute("loginResult")) {
			
			return "/mypage/mypagepwchkseller";
		} else {
			return "redirect:/mypage/login";
		}
		
		
	}
	
	
	@PostMapping("/mypage/mypagepwchkseller")
	public String mypagepwsellerProc(HttpSession session, Member member) {
		
		String loginid = (String) session.getAttribute("id");
		member.setId(loginid);
		
		int grade = (int) session.getAttribute("grade");
		int pwchk = mypageService.mypwchk(member);
		
		logger.info("pwchk의 결과는? : {}", pwchk);
		
		if(pwchk >0 && grade ==1) {
			return "redirect:/mypage/sellerinfo";
		} else {
			return "redirect:/mypage/mypagepwchkseller";
		}
		
		
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
	
	
	@GetMapping("/mypage/sellerinfo")
	public void sellerinfo(HttpSession session, Model model) {
		
		int loginNo = (int) session.getAttribute("memberNo");
		logger.info("mypage[memberNo] = {}", loginNo);
		
		
		MemberSeller sellerinfo = mypageService.sellerinfo(loginNo);
		logger.info("mypage [sellerinfo] : {}" , sellerinfo);
		
		model.addAttribute("sellerinfo", sellerinfo);
	}
	
	
	@GetMapping("/mypage/sellerinfoupdate")
	public void sellerinfoupdate(HttpSession session, Model model) {
		
		int loginNo = (int) session.getAttribute("memberNo");
		logger.info("mypage[memberNo] = {}", loginNo);
		
		
		MemberSeller sellerinfo = mypageService.sellerinfo(loginNo);
		logger.info("mypage [sellerinfo] : {}" , sellerinfo);
		
		model.addAttribute("sellerinfo", sellerinfo);
	}
	
	@PostMapping("/mypage/sellerinfoupdate")
	public String sellerinfoupdateProc(MemberSeller memberSeller ) {
		
		logger.info("들어온 값 확인 : {}", memberSeller);
		
		mypageService.sellerinfoUpdate(memberSeller);
		
		return "redirect:/mypage/sellerinfo";
	}
	
	
	
	
	@ResponseBody
	@GetMapping("/mypage/nickChk")
	public int nickChk(@RequestParam("nick") String nick) {
		
		int result = mypageService.nickChk(nick);
		
		return result;
	}
	

	
	
}
