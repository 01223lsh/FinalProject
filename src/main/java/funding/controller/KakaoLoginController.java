package funding.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import funding.dto.Member;
import funding.service.face.MemberService;

@Controller
public class KakaoLoginController {

private static final Logger logger = LoggerFactory.getLogger(KakaoLoginController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/login/getKakaoAuthUrl")
	public @ResponseBody String getKakaoAuthUrl(
			HttpServletRequest request) throws Exception {
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=432ba254a50611bbeb7703c27555c83e"
				+ "&redirect_uri=http://localhost:8088/member/kakao_oauth"
				+ "&response_type=code";
		
		return reqUrl;
	}
	
	// 카카오 연동정보 조회
	@RequestMapping(value = "/member/kakao_oauth")
	public String oauthKakao(
			@RequestParam(value = "code", required = false) String code
			, Model model, HttpSession session) throws Exception {

		System.out.println("#########code: " + code);
        String access_Token = memberService.getAccessToken(code);
        System.out.println("###access_Token#### : " + access_Token);
        
        
        HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###userInfo#### : " + userInfo.get("email"));
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
        session.setAttribute("login", access_Token);
        
        String kakaoEmail = (String) userInfo.get("email");
        
        JSONObject kakaoInfo =  new JSONObject(userInfo);
        model.addAttribute("kakaoInfo", kakaoInfo);
        
        logger.info("kakaoinfo: {}", kakaoInfo);
        
        
        
        //카카오 계정 최초 로그인 확인 유무
        boolean kakaoResult = memberService.kakaoResult(kakaoEmail);
        
        List<Member> kakaoinfo = memberService.getList(kakaoInfo);
        
        //등급(grade)이 0(일반유저)이고 카카오 계정(Email)이 DB에 저장되었는지 확인
        if(kakaoResult) { 
        	//	-> 행 수 1 반환 - ture -> 탈퇴하지 않은 '기존 회원' -> 세션 처리
        	logger.info("기존 회원 user");
        	
        	logger.info("kakaoinfo : {}", kakaoinfo);
        	logger.info("@@@@memberNo : {}", kakaoinfo.get(0).getMemberNo());
        	
            //세션
        	session.setAttribute("nick", kakaoinfo.get(0).getNick());
        	session.setAttribute("grade", kakaoinfo.get(0).getGrade());
        	session.setAttribute("memberNo", kakaoinfo.get(0).getMemberNo());
        	
          	return "redirect:/member/main";
 
        } else { //행 수 0 반환 -> false -> 회원가입 or 탈퇴한 회원(등급 3)인지 여부 확인하여 재가입(grade 변경)
        	
        	
        	boolean chkEmail = memberService.chkEmailbykakao(kakaoEmail);
        	
           	if(chkEmail) {
        		logger.info("해당 유저는 카카오 계정으로 가입한 경험이 있으나 탈퇴한 유저입니다.");

        		model.addAttribute("email", kakaoEmail);
            	model.addAttribute("nick", userInfo.get("nickname"));
            	model.addAttribute("kakaoInfo", kakaoInfo);
            	model.addAttribute("access_token", access_Token);
            	
            	return "forward:/member/kakaoRejoin";
        		
        	} else {
        		logger.info("해당 유저는 가입한 적이 없는 유저입니다.");
            	logger.info("회원가입 진행해야하는 user");
            	
            	model.addAttribute("email", kakaoEmail);
            	model.addAttribute("nick", userInfo.get("nickname"));
            	model.addAttribute("kakaoInfo", kakaoInfo);
            	model.addAttribute("login", access_Token);
            	
            	//redirect를 사용하면 값이 전달되지 않음 -> forward 사용
            	return "forward:/member/kakaoJoin";
        	}
        	
        	}
        	
	}
	
	//GET - 카카오 유저 회원가입 
	@GetMapping(value = "/member/kakaoJoin")
	public void kakaoJoin(Model model) {
		logger.info("/member/kakaoJoin 접속");
	}
	
	//POST - 카카오 유저 회원가입
	@PostMapping(value = "/member/kakaoJoin")
	public String kakaoJoin_Process(Member member) {
		logger.info("회원 정보 입력 값 : {}", member);
		
		//회원가입 성공 유무 확인
		boolean joinResult = memberService.kakaoJoin(member);
		
		if(joinResult) {
			logger.info("회원가입 성공");
			return "redirect:/member/main";			
		} else {
			logger.info("회원가입 실패");
			return "redirect:/member/kakaoJoin"; 
		}
	}
	
	//GET - 카카오 유저 재회원가입(Rejoin) 
	@GetMapping(value = "/member/kakaoRejoin")
	public void kakaoRejoin(Model model) {
		logger.info("/member/kakaoRejoin 접속");
	}
	
	//POST - 카카오 유저 재회원가입(Rejoin) 
	@PostMapping(value = "/member/kakaoRejoin")
	public String kakaoRejoin_Process(Member member) {
		logger.info("회원 정보 입력 값 : {}", member);
		
		//회원가입 성공 유무 확인
		boolean RejoinResult = memberService.kakaoRejoin(member);
		
		if(RejoinResult) {
			logger.info("회원가입 성공");
			return "redirect:/member/login";			
		} else {
			logger.info("회원가입 실패");
			return "redirect:/member/kakaoJoin"; 
		}
	}
	
		
	//카카오 로그아웃
	@RequestMapping(value="/member/kakaologout") 
	public String logout(HttpSession session) { 
		memberService.logout((String)session.getAttribute("access_token"));
		
		//토큰값 확인
		logger.info("access_token: {}", (String)session.getAttribute("access_token"));
		
		session.invalidate(); 
		
		return "redirect:/member/login"; 
	}
	
	//카카오 연결끊기(탈퇴)
	@RequestMapping(value="/member/kakaounlink") 
	public String unlink(HttpSession session) { 
		
		memberService.unlink((String)session.getAttribute("access_token")); 
		logger.info("session값 꺼내오기: {} ", (String)session.getAttribute("nick"));
		logger.info("memberNo값 꺼내오기: {} ", (Integer)session.getAttribute("memberNo"));
		
		//계정 탈퇴 -> grade(회원등급) 변경
		int memberNo = (Integer)session.getAttribute("memberNo");
		boolean result = memberService.delete(memberNo);
     	
		if(result == true) {
			
			session.invalidate(); 
			return "redirect:/member/main";
			
		} else { //생성된 프로젝트 있음
			
			logger.info("생성된 프로젝트 있음, 탈퇴 안됨");
			//탈퇴 안된다는 메세지 띄어주기

			return "/member/main";

			
		}
	}
	

	
} //class end	