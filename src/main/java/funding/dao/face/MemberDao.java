package funding.dao.face;

import funding.dto.Member;

public interface MemberDao {
	
	/**
	 * 요청받은 아이디와 비밀번호에 해당하는 DB를 불러와서 빈 DTO객체에 저장한다.
	 *
	 * @param conn   DB연결객체
	 * @param userid 유저 아이디
	 * @return 정보가 담긴 DTO객체
	 */
	public Member loadUserInfo(Member member);



}
