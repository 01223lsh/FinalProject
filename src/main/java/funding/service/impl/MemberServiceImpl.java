
package funding.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import funding.dao.face.MemberDao;
import funding.dto.Member;
import funding.dto.MemberSeller;
import funding.service.face.MemberService;
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired 	MemberDao memberDao;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	

	@Override
	public boolean login(Member member) {
		int loginChk = memberDao.selectCntMember(member);
		
		if( loginChk > 0 )	return true;
		return false;
	}
	
	@Override
	public String getNick(Member member) {
		return memberDao.selectNickByMember(member);
	}
	
	@Override
	public int getGrade(Member member) {
		return memberDao.selectGradeByMember(member);
	}
	
	@Override
	public int getMemberNo(Member member) {
		return memberDao.selectMemberNoByMember(member);
	}
	
	
	@Override
	public boolean consumerJoin(Member member) {
		
		//중복된 ID인지 확인
		if( memberDao.selectCntById(member) > 0 ) {
			return false;
		}
		
		//회원 가입(삽입)
		memberDao.insert(member);
		
		//회원가입 결과 확인
		if( memberDao.selectCntById(member) > 0 ) {
			return true;
		}
		
		return false;
	}
	
	@Override
	public boolean sellerJoin(MemberSeller seller) {
		//중복된 ID인지 확인
		if( memberDao.selectCntById2(seller) > 0 ) {
			return false;
		}
		
		//회원 가입(삽입)
		memberDao.insert2(seller);
		memberDao.insert3(seller);
		
		//회원가입 결과 확인
		if( memberDao.selectCntById2(seller) > 0 ) {
			return true;
		}
		
		return false;
	}
	
	//회원가입 - 아이디 중복 확인
	@Override
	public int idcheck(String id) {
		return memberDao.idCheck(id);
	}
	
	//회원가입 - 닉네임 중복 확인
	@Override
	public int nickcheck(String nick) {
		return memberDao.nickCheck(nick);
	}
	

	
	//---------------------카카오 로그인-------------------------
	@Override
	public String getAccessToken (String code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=432ba254a50611bbeb7703c27555c83e");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8088/member/kakao_oauth");     // 본인이 설정해 놓은 경로
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return access_Token;
    }
	
	
	//카카오 유저 정보 받아오기
	@Override
	  public HashMap<String, Object> getUserInfo (String access_Token) {

        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            
            userInfo.put("accessToken", access_Token);
            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
            

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return userInfo;
    }
	
	//카카오 로그아웃
	@Override
	public void logout(String access_Token) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout"; 
		try { URL url = new URL(reqURL); 
		HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
		logger.info("access_Token : {}", access_Token);
		
		conn.setRequestMethod("POST"); 
		conn.setRequestProperty("Authorization", "Bearer " + access_Token); 
		
		int responseCode = conn.getResponseCode(); 
		System.out.println("responseCode : " + responseCode); 
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream())); 
		
		String result = ""; 
		String line = ""; 
		while ((line = br.readLine()) != null) { 
			result += line; 
			} 
		System.out.println(result); 
		} catch (IOException e) { 
			e.printStackTrace();
	} 
		}
	
	//카카오 연결끊기(탈퇴)
	@Override
	public void unlink(String access_Token) {
		String reqURL = "https://kapi.kakao.com/v1/user/unlink"; 
		try { URL url = new URL(reqURL); 
		HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
		logger.info("access_Token : {}", access_Token);
		
		conn.setRequestMethod("POST"); 
		conn.setRequestProperty("Authorization", "Bearer " + access_Token); 
		
		int responseCode = conn.getResponseCode(); 
		System.out.println("responseCode : " + responseCode); 
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream())); 
		
		String result = ""; 
		String line = ""; 
		while ((line = br.readLine()) != null) { 
			result += line; 
			} 
		System.out.println(result); 
		} catch (IOException e) { 
			e.printStackTrace();
	} 
		}
	
	//카카오 탈퇴하기
	/*
	@Override
	public boolean delete(int memberNo) {
		logger.info("memberNo : {}", memberNo);
		
		if( memberDao.selectCntByProject(memberNo) > 0 ) {
			logger.info("주문 이력 있음 -> 탈퇴 불가");
			return false;
			
		} else {
		
		memberDao.updateKakaoUser(memberNo);
//		logger.info("출력이 안되어야한다"); 
		return true;
		}
	}
	*/
	
	@Override
	public boolean delete(int memberNo) {
		logger.info("memberNo : {}", memberNo);
		
		if( memberDao.selectCntByOrder(memberNo) > 0 ) {
			logger.info("주문 이력 있음 -> 탈퇴 불가");
			return false;
			
		} else if(memberDao.selectCntByProject(memberNo) > 0) {
			logger.info("프로젝트 이력 있음 -> 탈퇴불가");
			return false;
		} else {
			memberDao.updateKakaoUser(memberNo);
			return true;
		}
	}
	
	
	
	
	
	
	//카카오 계정 최초 로그인 확인 유무
	@Override
	public boolean kakaoResult(String kakaoEmail) {
		logger.info("kakaoEmail : {}", kakaoEmail);
			int loginChk = memberDao.selectCntKakao(kakaoEmail);
			
			if( loginChk > 0 )	return true;
			return false;
	}
	
	//카카오 계정 회원가입
	@Override
	public boolean kakaoJoin(Member member) {
		logger.info("@@@@@ kakaoJoin - member @@@@@@ : {} ", member);
		
		
		//중복된 email인지 확인
		if( memberDao.selectByKakaoEmail(member) > 0 ) {
			return false;
		}
		
		//회원 가입(삽입)
		memberDao.KakaoUserinsert(member);
		
		//회원가입 결과 확인
		if( memberDao.selectByKakaoEmail(member) > 0 ) {
			return true;
		}
		
		return false;
	}
		
	//카카오 로그인에 필요한 정보 가져오기
	@Override
	public List<Member> getList(JSONObject kakaoInfo) {
		return memberDao.selectKakaoInfo(kakaoInfo);
	}
	
	//최초 가입인지 가입한 이력이 있는지 확인
	@Override
	public boolean chkEmailbykakao(String kakaoEmail) {
		
		//중복된 Email 인지 확인
		int emailChk = memberDao.selectByEmail(kakaoEmail);
		logger.info("kakaoEmail : {}", kakaoEmail);
		
		
		if( emailChk > 0 )	return true;
		return false;
		}
		

	//카카오 유저 재회원가입
	@Override
	public boolean kakaoRejoin(Member member) {
		logger.info("@@@@@ kakaoReJoin - member @@@@@@ : {} ", member);
		
		
		//중복된 email인지 확인
		if( memberDao.selectByKakaoEmail(member) == 0 ) {
			return false;
		}
		
		//회원 가입(삽입)
		memberDao.KakaoUserUpdate(member);
		
		//회원가입 결과 확인
//		if( memberDao.selectByKakaoEmail(member) == 0 ) {
//			return true;
//		}
		
		return true;
	}

	//---------------------아이디 찾기-------------------------

	@Override
//	public ArrayList<String> findId(Member member) {
	public String findId(Member member) {

		logger.info("이메일 찾기 service 진입");
		
		/* 배열로 값을 받아올 경우
		List<Member> list = memberDao.findId(member);
		ArrayList<String> findId = new ArrayList<String>();  
		for(int i =0; i <list.size(); i ++) {
			String id = list.get(i).getId();
			findId.add(id);
		*/
		
		String findid = memberDao.findIdByMember(member);
		
		logger.info("@@@@findid : {}", findid);
		
		return findid;
	}
	
	//---------------------임시비밀번호 생성-------------------------
	@Override
	public void findPw(HttpServletResponse response, Member member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
//		Member ck = memberDao.readMember(member.getId());
		Member ck = memberDao.readMember(member);
		
		logger.info("2. 임시비밀번호 발급 받기 ck : {}", ck); 
		
		PrintWriter out = response.getWriter();
		
		// 가입된 아이디가 없으면
//		if(memberDao.idCheck(member.getId()) == null ) { - 에러남
		if(memberDao.idCheck(member.getId()) == 0) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}	// 가입된 이메일이 아니면
		else if(!member.getEmail().equals(ck.getEmail())) {
			out.print("등록되지 않은 이메일입니다."); //에러남
			out.close();
		}

		else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			member.setPw(pw);
			// 비밀번호 변경
			memberDao.updatePw(member);
			// 비밀번호 변경 메일 발송
			sendEmail(member, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
		
	}
	
	@Override
	public void sendEmail(Member member, String content) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "finaltest2221@gmail.com";
		String hostSMTPpwd = "final2221@@";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "finaltest2221@gmail.com";
		String fromName = "cloud funding";
		String subject = "";
		String msg = "";

		if(content.equals("findpw")) {
			subject = "클라우드 펀딩 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += member.getPw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = member.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
		
	}
	
	//--------------------- 회원 탈퇴 -------------------------

	@Override
	public Boolean withdrawPw(String pw, String id) {
		
		logger.info("@@@pw : {}", pw);
		logger.info("@@@id : {}", id);
		
		int pwChk = memberDao.comparePw(pw, id);
		
		if( pwChk > 0 )	return true;
		return false;
	}
	
	//---------------------네이버 로그인-------------------------
	//네이버 계정 최초 로그인 확인 유무
	@Override
	public boolean naverResult(String naverEmail) {
		logger.info("naverEmail 확인 : {}", naverEmail);
			int loginChk = memberDao.selectCntNaver(naverEmail);
			
			if( loginChk > 0 )	return true; //로그인 한 적이 있다
			return false; //첫로그인이다
	}
	
	//최초 가입인지 가입한 이력이 있는지 확인
	@Override
	public boolean chkEmailbynaver(String naverEmail) {
		
		//중복된 Email 인지 확인
		int emailChk = memberDao.chkNaverEmail(naverEmail);
		
		if( emailChk > 0 )	return true;
		return false;
	}
	
	@Override
	public boolean naverJoin(Member member) {
		logger.info("@@@@@ naverJoin - member @@@@@@ : {} ", member);
		
		
		//중복된 email인지 확인
		if( memberDao.selectByNaverEmail(member) > 0 ) {
			return false;
		}
		
		//회원 가입(삽입)
		memberDao.naverUserinsert(member);
		
		//회원가입 결과 확인
		if( memberDao.selectByNaverEmail(member) > 0 ) {
			return true;
		}
		
		return false;
	}
	
	//네이버 로그인에 필요한 정보 가져오기
	@Override
	public List<Member> getinfo(JSONObject naverInfo) {
		return memberDao.selectNaverInfo(naverInfo);
	}
	
	
	//멤버번호를 통해서 멤버정보 조회 From 정영재 
	@Override
	public Member getUserInfoByMemberNo(int memberNo) {
		return memberDao.selectByMemberNo(memberNo);
	}
	
	//네이버 계정 유무 확인
	@Override
	public boolean login(int memberNo) {
		int loginChk = memberDao.selectCntNaverUser(memberNo);
		
		if( loginChk > 0 )	return true;
		return false;
	}

} // service end
