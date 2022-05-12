package funding.service.face;

import funding.dto.Member;

public interface MemberService {
	

	/**
	 * 로그인 창에서 id와 비밀번호를 체크한다. 성공시 메인페이지로 리다이렉트한다. 실패시 재확인하라는 메시지를 띄운다.
	 * 
	 * @param userid 유저 아이디
	 * @param userpw 유저 패스워드
	 * @return 결과
	 */
	public int idpwCheck(String id, String pw);

	/**
	 * 유저 정보를 불러온다. DB에 저장된 row 1행 전체를 불러온다
	 * 
	 * @param userid 유저아이디
	 * @return 유저 DTO
	 */
	public Member loadUserInfo(String id);
}
