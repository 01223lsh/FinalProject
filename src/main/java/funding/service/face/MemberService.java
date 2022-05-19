package funding.service.face;

import funding.dto.Member;

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
	
}
