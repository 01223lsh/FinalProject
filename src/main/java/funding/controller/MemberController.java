package funding.controller;

import java.io.IOException;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.mail.javamail.JavaMailSender;

import funding.dto.Member;
import funding.dto.MemberSeller;
import funding.service.face.MemberService;

@Controller
public class MemberController {
	
private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	
	
	//--------------------------- 회원가입 -----------------------------------
	
	@RequestMapping(value = "/member/join_step1")
	public void join_step1() {
		logger.info("/member/join 접속 완료");
	}
	
	//------- 사업자 -------
	@GetMapping(value = "/member/join_step2_seller")
	public void join_step2_seller() {
		logger.info("/member/join_step2_seller 접속 완료");
	}
	
	@GetMapping(value = "/member/join_step3_seller")
	public void join_step3_seller() {
		logger.info("/member/join_step3_seller 접속 완료");
	}
	
	@PostMapping(value = "/member/join_step3_seller")
	public String seller_joinProcess(MemberSeller seller) {
		logger.info("cunsumer의 회원 정보 입력 값 : {}", seller);
		
		boolean joinResult = memberService.sellerJoin(seller);
		
		if(joinResult) {
			logger.info("회원가입 성공");
			return "redirect:/member/login";			
		} else {
			logger.info("회원가입 실패");
			return "redirect:/member/join_step3_seller"; 
		}
		
	}
		
	//------- 일반회원 -------
	@GetMapping(value = "/member/join_step2_consumer")
	public void join_step2_consumer() {
		logger.info("/member/join_step2_consumer 접속 완료");
	}
	
	
	@GetMapping(value = "/member/join_step3_consumer")
	public void join_step3_consumer() {
		logger.info("/member/join_step3_seller 접속 완료");
	}
	
	@PostMapping("/member/join_step3_consumer")
	public String cousumer_joinProcess(Member member) {
		logger.info("cunsumer의 회원 정보 입력 값 : {}", member);
		
		boolean joinResult = memberService.consumerJoin(member);
		
		if(joinResult) {
			logger.info("회원가입 성공");
			return "redirect:/member/login";			
		} else {
			logger.info("회원가입 실패");
			return "redirect:/member/join_step3_consumer"; 
		}
	}
	
	
	
	//------- 회원가입시 이메일 인증 -------

	//mailSender 의존성 주입
	@Autowired
	private JavaMailSender mailSender;

	//ResponseBody - AJAX 값 리턴받기 위해 작성
	@RequestMapping(value = "/member/mailCheck", method = RequestMethod.GET) 
	@ResponseBody 
	public String mailCheck(@RequestParam("email") String email) throws Exception{ 
		logger.info("전송 이메일 : {} ", email);
		
		int checkNum = (int)((Math.random()* (99999 - 10000 + 1)) + 10000); 
		
		String from = "abcd@company.com";//보내는 이 메일주소
		String to = email;
		String title = "클라우드 펀딩 회원가입 인증 메일입니다."; 
		String content = "홈페이지를 방문해주셔서 감사합니다 <br/> [인증번호] "+ checkNum +"<br/> 해당 인증번호를 인증번호 확인란에 기입해주십시오."; 
		String num = ""; 
		
		try {
	            MimeMessage mail = mailSender.createMimeMessage();
	            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
	            // true는 멀티파트 메세지를 사용하겠다는 의미
	            
	            /*
	             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
	             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
	             */
	            
	            mailHelper.setFrom(from);
	            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
	            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
	            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
	            mailHelper.setSubject(title);
	            mailHelper.setTo(to);
	            mailHelper.setText(content, true); // true는 html을 사용하겠다는 의미입니다.
	            
	            /*
	             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
	             */
	            
	            mailSender.send(mail);
	            num = Integer.toString(checkNum);
	            
	        } catch(Exception e) {
	            num = "error";
	        }
			
			return num;
	        
	    }
	
	//------- 회원가입시 아이디 중복 확인 -------
	@PostMapping("/member/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		logger.info("/idCheck 접속");
		return memberService.idcheck(id);
	}
	
	//------- 회원가입시 닉네임 중복 확인 -------
	@PostMapping("/member/nickCheck")
	@ResponseBody
	public int nickCheck(@RequestParam("nick") String nick) {
		logger.info("/nickCheck 접속");
		return memberService.nickcheck(nick);
	}
	
	
	
	//--------------------------- 로그인 -----------------------------------
	@RequestMapping(value = "/member/login")
	public void login() {
		logger.info("/member/login 접속 완료");
	}
	
	
	@PostMapping("/member/loginform")
	public String loginProcess(Member member, HttpSession session, Model model) {
		logger.info("/member/login [POST]");
		logger.info("{}", member);
		//	-> jsp쪽에서 name을 적지 않으면 받아오지 못해서 null값 나온다
		
		//로그인 인증
		boolean loginResult = memberService.login(member);
		
		if( loginResult ) {
			logger.info("로그인 성공");
			
			//로그인 성공하면 session 객체 사용해서 세션 저장
			session.setAttribute("login", loginResult) ; 
			session.setAttribute("id", member.getId());
			session.setAttribute("grade", memberService.getGrade(member));
			session.setAttribute("nick", memberService.getNick(member));
			session.setAttribute("memberNo", memberService.getMemberNo(member));
			
			return "redirect:/member/main";
			
		} else {
			logger.info("로그인 실패");
//			session.invalidate();
			
			return "/member/login";
		}
		
	}
	
	
    //--------------------------- 로그아웃 -----------------------------------
    @RequestMapping(value = "/member/logout", method = { RequestMethod.GET, RequestMethod.POST })
    public String logout(HttpSession session)throws IOException {

    	session.invalidate();
    	
    return "/member/main";
    }
    

    
    //--------------------------- 아이디 찾기 -----------------------------------
    @GetMapping(value = "/member/findID")
	public void findID() {
		logger.info("/member/findID 접속 완료");
	}
    
    
    @RequestMapping(value = "/member/findID" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    public @ResponseBody String findIdProcess(@ModelAttribute Member member, Model model , HttpServletResponse response)throws Exception {

    	logger.info(member.toString());


//    	ArrayList<String> idList = memberService.findId(member);
    	String id = memberService.findId(member);
    	
//    	logger.info("1. id 테스트 값: {}", idList.toString());
//    	logger.info("2. id 테스트 값: {}", idList);
//    	logger.info("2. id 테스트 값: {}", idList.get(0));
    	
    	String findId = "{\"id\":\""+id+"\"}";

    	logger.info("3. id 테스트 값: {}", findId);

    	return findId;
    }
    
    
    //--------------------------- 임시비밀번호 발급 받기 -----------------------------------
   
    @RequestMapping(value = "/member/findPW", method=RequestMethod.GET )
	public void findPW() {
		logger.info("/member/findPW 접속 완료");
	}
    
    @RequestMapping(value = "/member/findPW", method=RequestMethod.POST )
    public void findPW_Process(@ModelAttribute Member member, HttpServletResponse response) throws Exception{
    	logger.info("/member/findPW [POST]");
    	logger.info("1. 임시비밀번호 발급 받기 Member : {}", member);  //입력받은 id와 email 출력됨

    	memberService.findPw(response, member);
    	

    }

    //--------------------------- 회원 탈퇴 -----------------------------------
	
    //비밀번호 인증 확인
    @PostMapping("/member/withdrawPw")
	@ResponseBody
	public Boolean withdrawPw(@RequestParam("pw") String pw, HttpSession session) {
    	logger.info("회원탈퇴 입력받은 pw 값: {}", pw);
    	
    	String id = (String) session.getAttribute("id");
    	logger.info("세션에 등록된 id : {}", id);
    	
    	return memberService.withdrawPw(pw, id);
	}
    
    @RequestMapping("/member/quit")
 	public String quit(HttpSession session, Model model) {
     	logger.info("/member/quit 접속 완료");
     	
		//계정 탈퇴 -> grade(회원등급) 변경
     	//카카오 유저 탈퇴할때 만든 메소드 사용
		int memberNo = (Integer)session.getAttribute("memberNo");
		boolean result = memberService.delete(memberNo);
     	
		if(result == true) {
			
			session.invalidate(); 
			model.addAttribute("msg", "탈퇴되었습니다. 이용해주셔서 감사합니다.");
			
		} else { 
			
			logger.info("주문 이력 있음, 탈퇴 안됨");
			model.addAttribute("msg", "주문 이력 혹은 프로젝트에 참여한 이력이 확인됩니다. 확인 후 다시 진행해주시길 바랍니다.");
			
		}    	
     	
		model.addAttribute("redirectUrl", "/member/main");
		
		return "member/alertJsp";
     	
 	}
    

    
    

    
	
} //class end
