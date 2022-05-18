package funding.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

import funding.dto.Member;
import funding.service.face.MemberService;


@Controller
public class NaverLoginController {

	private static final Logger logger = LoggerFactory.getLogger(NaverLoginController.class);
	
	@Autowired
	private MemberService memberService;
	
	 /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
 
    //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "/member/login", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        
        // 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);
 
        // 생성한 인증 URL을 View로 전달 
        return "/member/login";
    }
    
 
    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/member/naver_login", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException {
        System.out.println("여기는 callback");
        
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        logger.info("oauthToken:{}", oauthToken);
        
        //토큰 받아오기
        String access_token = oauthToken.getAccessToken();
        logger.info("access_token: {}", access_token);
        
        
        //로그인 사용자 정보를 읽어온다.
        //json형식인데 Stiring으로 받아지고 실제로 쓰이는 부분은 해당 데이터의 response 내부임
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        
        //String을 json으로 받아 Map으로 변환
        ObjectMapper objectMapper =new ObjectMapper();

        //apiResult의 response만 받아 apiJson에 Map으로 저장을 한다.
        Map<String, Object> apiJson = (Map<String, Object>)
        objectMapper.readValue(apiResult, Map.class).get("response");
        
        logger.info("apiJson: {}", apiJson);
        
        
        //------- 네이버 계정 최초 로그인 확인 유무(DB처리) ----------
        String naverEmail = (String) apiJson.get("email");
        logger.info("naverEmail: {}", naverEmail);
        
        boolean naverResult = memberService.naverResult(naverEmail);
        logger.info("naverResult {}", naverResult);
        
        
        //네이버 계정 정보 담기
        JSONObject naverInfo =  new JSONObject(apiJson);
        model.addAttribute("naverInfo", naverInfo);
        logger.info("naverInfo: {}", naverInfo);
        //로그인 진행하기 위해 담은 계정 이용해서 DB에서 결과 조회
        List<Member> naverlogin  = memberService.getinfo(naverInfo);
        
        
        if(naverResult) { 
        	//	-> 행 수 1 반환 - ture -> 탈퇴하지 않은 '기존 회원' -> 세션 처리
        	logger.info("기존 회원 user");
        	
            //세션
        	session.setAttribute("id", naverlogin.get(0).getId());
        	session.setAttribute("nick", naverlogin.get(0).getNick());
        	session.setAttribute("grade", naverlogin.get(0).getGrade());
        	session.setAttribute("memberNo", naverlogin.get(0).getMemberNo());
        	session.setAttribute("access_token", access_token);
        	
        	 return "redirect:/main";
        	
 
        } else {
        	//행 수 0 반환 -> false -> 회원가입 or 탈퇴한 회원(등급 3)인지 여부 확인하여 재가입(grade 변경)
        	logger.info("회원가입 혹은 재가입해야하는 회원");
        	
        	boolean chkEmail = memberService.chkEmailbynaver(naverEmail);
        	
           	if(chkEmail) {
        		logger.info("해당 유저는 네이버 계정으로 가입한 경험이 있으나 탈퇴한 유저입니다.");

        		model.addAttribute("email", naverEmail);
            	model.addAttribute("nick", naverInfo.get("nickname"));
            	
            	return "forward:/member/naverRejoin";
        		
        	} else {
        		logger.info("해당 유저는 가입한 적이 없는 유저입니다.");
            	logger.info("회원가입 진행해야하는 user");
            	
            	model.addAttribute("email", naverEmail);
            	model.addAttribute("nick", naverInfo.get("nickname"));
            	
            	//redirect를 사용하면 값이 전달되지 않음 -> forward 사용
            	return "forward:/member/naverJoin";
        	}
         	 
    	} 
        
    } //callback end
    
    
	//GET - 네이버 유저 회원가입 
	@GetMapping(value = "/member/naverJoin")
	public void naverJoin(Model model) {
		logger.info("/member/naverJoin 접속");
	}
	
	//POST - 카카오 유저 회원가입
	@PostMapping(value = "/member/naverJoin")
	public String naverJoinProcess(Member member) {
		logger.info("회원 정보 입력 값 : {}", member);
		
		//회원가입 성공 유무 확인
		boolean joinResult = memberService.naverJoin(member);
		
		if(joinResult) {
			logger.info("회원가입 성공");
			return "redirect:/member/login";			
		} else {
			logger.info("회원가입 실패");
			return "redirect:/member/naverJoin"; 
		}
	}
	
	
	
	//네이버 로그아웃
	//mamberContoller에서 session.invalidate(); 동일하게 진행

	
	//네이버 연결끊기(탈퇴)
    
	@GetMapping("/member/naverunlink") //token = access_token임
	public String naverunlink(@RequestParam(value="access_token", required=false) String access_token,HttpSession session, HttpServletRequest request, Model model ) {
		logger.info("토큰 삭제");
		
		String token = (String)session.getAttribute("access_token");
		
		String apiUrl = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=THTxhfKEX3LBF4dT333p&client_secret=amdnQ7LyOc&access_token="+token+"&service_provider=NAVER";
			logger.info("apiUrl:{}", apiUrl);
			
			try {
				String res = requestToServer(apiUrl);
				model.addAttribute("res", res); //결과값 찍어주는용
			session.invalidate();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		    return "/main";
	}
	
	private String requestToServer(String apiURL) throws IOException {
	    return requestToServer(apiURL, null);
	  }
	
	 private String requestToServer(String apiURL, String headerStr) throws IOException {
		    URL url = new URL(apiURL);
		    HttpURLConnection con = (HttpURLConnection)url.openConnection();
		    con.setRequestMethod("GET");
		    System.out.println("header Str: " + headerStr);
		    if(headerStr != null && !headerStr.equals("") ) {
		      con.setRequestProperty("Authorization", headerStr);
		    }
		    int responseCode = con.getResponseCode();
		    BufferedReader br;
		    System.out.println("responseCode="+responseCode);
		    if(responseCode == 200) { // 정상 호출
		      br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		    } else {  // 에러 발생
		      br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		    }
		    String inputLine;
		    StringBuffer res = new StringBuffer();
		    while ((inputLine = br.readLine()) != null) {
		      res.append(inputLine);
		    }
		    br.close();
		    if(responseCode==200) {
		    	String new_res=res.toString().replaceAll("&#39;", "");
				 return new_res; 
		    } else {
		      return null;
		    }
		  }

    
    
}
