package funding.dao.face;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;

import funding.dto.Member;
import funding.dto.MemberSeller;

public interface MemberDao {


	/**
	 * id/pw가 일치하는 사용자 수를 반환한다
	 * 	-> 로그인 인증에 활용한다
	 * 
	 * @param member - 조회할 id/pw를 가진 객체
	 * @return 조회된 행 수
	 */
	public int selectCntMember(Member member);

	/**
	 * id을 이용하여 nick을 조회한다
	 * 
	 * @param member - 조회하려는 회원의 id를 가진 객체
	 * @return 조회된 nick
	 */
	public String selectNickByMember(Member member);

	/**
	 * 회원 id가 존재하는 값인지 확인한다
	 * 중복된 id인지 확인
	 * 
	 * @param member - 조회하려는 회원의 id를 가진 객체
	 * @return 존재 여부 (0 - 없음, 1 - 있음)
	 */
	public int selectCntById(Member member);

	/**
	 * 신규 Consumer 회원의 정보를 새롭게 삽입한다
	 * 
	 * @param member - 신규 Consumer 회원 정보
	 */
	public void insert(Member member);
	
	/**
	 * 회원 id가 존재하는 값인지 확인한다
	 * 중복된 id인지 확인
	 * 
	 * @param seller - 조회하려는 seller 회원의 id를 가진 객체
	 * @return 존재 여부 (0 - 없음, 1 - 있음)
	 */
	public int selectCntById2(MemberSeller seller);

	/**
	 * 신규 seller 회원의 정보를 새롭게 삽입한다
	 * 
	 * @param seller - 신규 Consumer 회원 정보
	 */
	public void insert2(MemberSeller seller);
	
	/**
	 * 신규 seller 회원의 정보를 새롭게 삽입한다
	 * 
	 * @param seller - 신규 Consumer 회원 정보
	 */
	public void insert3(MemberSeller seller);

	/**
	 * 카카오 최초 로그인 여부 확인
	 * @param kakaoEmail - 카카오 계정에 저장된 이메일
	 * @return 행 수로 반환
	 */
	public int selectCntKakao(String kakaoEmail);

	/**
	 * 카카오 계정 회원가입 - Email 중복 여부 확인
	 * @param member - 카카오 계정(Email)을 담은 DTO
	 * @return 존재 여부 (0 - 없음, 1 - 있음)
	 */
	public int selectByKakaoEmail(Member member);

	/**
	 * 카카오 계정 신규 회원 가입
	 * @param member - 카카오 계정 및 추가 정보를 담은 DTO
	 */
	public void KakaoUserinsert(Member member);

	/**
	 * DB에 등록된 카카오 정보 불러오기 (email로 조회)
	 * @param kakaoInfo - 카카오 계정의 email이 담긴 정보
	 * @return DB에 등록된 해당 유저의 정보
	 */
	public List<Member> selectKakaoInfo(JSONObject kakaoInfo);

	/**
	 * 계정 탈퇴
	 * 계정 grade 변경하여 관리
	 * 
	 * @param attribute - 세션에 등록된 카카오 계정의 memberNo
	 */
	public void updateKakaoUser(int memberNo);


	/** 중복된 Email 인지 확인
	 * 
	 * @param kakaoinfo - Email이 담긴 카카오 계정 정보
	 * @return 행 수로 반환
	 */
	public int selectByEmail(String kakaoEmail);

	/**
	 * 탈퇴한 회원이 카카오 계정을 통해 재가입
	 * @param member - 카카오 계정 및 추가 정보를 담은 DTO
	 */
	public void KakaoUserUpdate(Member member);

	/**
	 * 회원가입 시 아이디 중복 확인
	 * @param id - 입력받은 아이디
	 * @return 행 수 반환
	 */
	public int idCheck(String id);

	/**
	 * 회원가입 시 닉네임 중복 확인
	 * @param id - 입력받은 닉네임
	 * @return 행 수 반환
	 */
	public int nickCheck(String nick);

	/**
	 * id을 이용하여 grade을 조회한다
	 * 
	 * @param member - 조회하려는 회원의 id를 가진 객체
	 * @return 조회된 등급(grade)
	 */
	public int selectGradeByMember(Member member);

	/**
	 * id을 이용하여 memberNo을 조회한다
	 * 
	 * @param member - 조회하려는 회원의 id를 가진 객체
	 * @return 조회된 회원 번호(membern_no)
	 */
	public int selectMemberNoByMember(Member member);

	/**
	 * 아이디 찾기 
	 * @param member - 아이디 찾기위해 입력받은 email, name
	 * @return 
	 */
//	public List<Member> findId(Member member);
	public String findIdByMember(Member member);

	/** 
	 * 비밀번호 변경
	 * @param member
	 */
	public int updatePw(Member member);

	/**
	 * 
	 * @param member
	 * @return
	 */
	public Member readMember(Member member);

	/**
	 * 회원 탈퇴 - 입력받은 비밀번호와 db 비밀번호 대조
	 * @param pw - 입력받은 비밀번호(pw)
	 * @param id - 세션에 등록된 아이디(id)
	 * @return 행 수로 반환
	 */
	public int comparePw(@Param("pw")String pw, @Param("id")String id);
	
	/**
	 * 회원 탈퇴 - 생성된 프로젝트 있는지 확인
	 * @param memberNo - 회원번호
	 * @return 행 조회해서 0보다 크면 프로젝트가 존재하는 것이라서 회원 탈퇴 안됌
	 */
	public int selectCntByProject(int memberNo);

	/**
	 * 네이버 계정 최초 로그인 확인 유무
	 * @param naverEmail - 네이버 계정 
	 * @return 행 수로 반환
	 */
	public int selectCntNaver(String naverEmail);

	/**
	 * 네이버 계정 회원가입 - Email 중복 여부 확인
	 * @param member - 네이버 계정(Email)을 담은 DTO
	 * @return 존재 여부 (0 - 없음, 1 - 있음)
	 */
	public int selectByNaverEmail(Member member);

	/**
	 * 네이버 계정 신규 회원 가입
	 * @param member - 네이버 계정 및 추가 정보를 담은 DTO
	 */
	public void naverUserinsert(Member member);

	/**
	 * DB에 등록된 네이버 정보 불러오기 (email로 조회)
	 * @param kakaoInfo - 네이버 계정의 email이 담긴 정보
	 * @return DB에 등록된 해당 유저의 정보
	 */
	public List<Member> selectNaverInfo(JSONObject naverInfo);






	
	




}
