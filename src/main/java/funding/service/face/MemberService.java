package funding.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import funding.dto.Member;
import funding.dto.MemberSeller;

public interface MemberService {

	/**
	 * 로그인 인증 처리
	 * 
	 * @param member - 입력한 ID/PW 정보
	 * @return 로그인 인증 결과
	 */
	public boolean login(Member member);

	/**
	 * 회원의 닉네임 조회
	 * 
	 * @param member - 닉네임을 조회하려는 사용자의 정보
	 * @return 사용자의 닉네임
	 */
	public String getNick(Member member);

	/**
	 * 신규 Consumer 회원 가입
	 * 
	 * @param member - 신규 Consumer 회원의 정보
	 * @return 회원가입 결과
	 */
	public boolean consumerJoin(Member member);

	/**
	 * 신규 seller 회원 가입
	 * 
	 * @param member - 신규 seller 회원의 정보
	 * @return 회원가입 결과
	 */
	public boolean sellerJoin(MemberSeller seller);
	
	/** 
	 * 카카오톡 로그인 api 사용을 위한 AccesssToken 받아오기
	 * 
	 * @param authorize_code - 승인 코드 
	 * @return
	 */
	public String getAccessToken(String code);

	/**
	 * 카카오톡 로그인 - accessToken 이용해 사용자 정보 얻기
	 * @param access_Token
	 * @return
	 */
	public HashMap<String, Object> getUserInfo(String access_Token);

	//카카오 로그아웃
	public void logout(String access_Token);

	//카카오 연결끊기(탈퇴)
	public void unlink(String attribute);
	
	//카카오 연결끊기(탈퇴->회원정보(Grade) 변경)
	public boolean delete(int memberNo);

	/**
	 * 카카오 계정 최초 로그인 확인 여부
	 * @param kakaoEmail - 카카오 계정에 저장된 이메일
	 * @return 로그인 한 적이 있으면 Ture, 최초 로그인이면 False 반환
	 */
	public boolean kakaoResult(String kakaoEmail);

	/**
	 * 카카오 계정으로 최초 로그인 시 회원 가입
	 * @param member - 카카오 계정 및 추가 정보를 담은 DTO
	 * @return 회원가입 성공 여부
	 */
	public boolean kakaoJoin(Member member);

	/**
	 * 카카오 계정으로 등록된 정보 확인
	 * 로그인 진행하기 위해 담은 계정 이용해서 DB에서 결과 조회 -> 세션 등록
	 * @param kakaoInfo - 네이버 계정 정보
	 * @return DB에 등록된 계정 정보
	 */
	public List<Member> getList(JSONObject kakaoInfo);


	/**
	 * 카카오 회원가입 - 회원가입했던 계정인지 아닌지 grade 통해 확인
	 * @param kakaoinfo - 회원 grade를 확인하기 위한 
	 * @return
	 */
	public boolean chkEmailbykakao(String kakaoEmail);

	/**
	 * 탈퇴했던 카카오 유저의 재회원가입
	 * @param member - 카카오 계정 및 추가 정보를 담은 DTO
	 * @return - 회원 가입 성공 여부
	 */
	public boolean kakaoRejoin(Member member);

	/**
	 * 회원가입 - 아이디 중복 확인
	 * @param id - 입력받은 아이디 
	 * @return 행 수로 반환
	 */
	public int idcheck(String id);

	/**
	 * 회원가입 - 닉네임 중복 확인
	 * @param id - 입력받은 닉네임 
	 * @return 행 수로 반환
	 */
	public int nickcheck(String nick);

	/**
	 * 회원 등급 조회
	 * 
	 * @param member - 등급 조회하려는 사용자의 정보
	 * @return 사용자의 등급
	 */
	public int getGrade(Member member);

	/**
	 * 회원번호(member_no) 조회
	 * 
	 * @param member - 회원번호 조회하려는 사용자의 정보
	 * @return 사용자의 회원번호
	 */
	public int getMemberNo(Member member);

	/**
	 * 아이디 찾기 
	 * @param member - 아이디 찾기위해 입력받은 email, name
	 * @return - 사용자의 id
	 */
	public String findId(Member member);
//	public ArrayList<String> findId(Member member);


	/**
	 * 임시비밀번호 생성하기 위한 정보 조회
	 * @param response 
	 * @param member - 비밀번호 찾기 위해 입력받은 email, id
	 * @throws Exception 
	 */
	public void findPw(HttpServletResponse response, Member member) throws Exception;

	/**	
	 * 임시비밀번호 이메일 전송
	 * @param member - 비밀번호 찾기 위해 입력받은 email
	 * @param content - 임시비밀번호 메일 내용
	 * @throws Exception
	 */
	void sendEmail(Member member, String content) throws Exception;

	/**
	 * 회원 탈퇴하기 위해 비밀번호 인증(대조)
	 * @param pw - 입력받은 비밀번호
	 * @param id - 세션에 등록된 id
	 * @return
	 */
	public Boolean withdrawPw(String pw, String id);

	/**
	 * 네이버 계정 최초 로그인 확인 유무 (grade == 0)
	 * @param naverEmail - 네이버 계정 이메일
	 * @return DB에 해당 이메일 등록되었는지 T/F 로 반환
	 */
	public boolean naverResult(String naverEmail);

	/**
	 * 비활성화된 계정인지 최초 로그인인지 확인
	 * @param naverEmail - 네이버 계정 이메일
	 * @return DB에 해당 이메일 등록되었는지 T/F 로 반환에 
	 */
	public boolean chkEmailbynaver(String naverEmail);

	/**
	 * 네이버 계정으로 최초 로그인 시 회원 가입
	 * @param member - 네이버 계정 및 추가 정보를 담은 DTO
	 * @return 회원가입 성공 여부
	 */
	public boolean naverJoin(Member member);

	/**
	 * 네이버 계정으로 등록된 정보 확인
	 * 로그인 진행하기 위해 담은 계정 이용해서 DB에서 결과 조회 -> 세션 등록
	 * @param naverInfo - 네이버 계정 정보
	 * @return DB에 등록된 계정 정보
	 */
	public List<Member> getinfo(JSONObject naverInfo);

	

	
	











	








}
