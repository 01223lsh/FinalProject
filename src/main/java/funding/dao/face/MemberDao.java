package funding.dao.face;

import funding.dto.Member;

public interface MemberDao {	
	
	/**
	 * id/pw가 일치하는 사용자 수를 반환한다 -> 로그인 인증에 활용한다
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
	
}
