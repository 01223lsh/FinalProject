package funding.service.face;

import funding.dto.Member;
import funding.dto.MemberSeller;

public interface MypageService {

	/**
	 * 파라미터로 받아온 member 멤버 필드로 해당 계정 있는지 확인
	 * @param member
	 * @return
	 */
	public boolean login(Member member);

//	/**
//	 * 해당 아이디를 가진 유저의 닉네임 알아오기
//	 * @param member
//	 * @return
//	 */
//	public String getNick(Member member);
//
//	/**
//	 * 회원 유형 가져오기
//	 * @param member
//	 * @return
//	 */
//	public int getGrade(Member member);
	
	
//	/**
//	 * 해당 아디이 멤버 번호 알아오기
//	 * @param member
//	 * @return
//	 */
//	public int getMemberNo(Member member);
	
	
	/**
	 * 마이페이지에 이용할 회원 정보 알아오기
	 * @param loginid
	 * @return
	 */
	public Member info(String loginid);

	/**
	 * 마이페이지 정보 수정
	 * @param member
	 */
	public void infoUpdate(Member member);

	/**
	 * 닉네임 중복 검사
	 * @param nick
	 * @return
	 */
	public int nickChk(String nick);

	/**
	 * 로그인 아이디로 회원 정보 몽땅 가져오기
	 * @param member
	 * @return
	 */
	public Member getMemberinfo(Member member);

	/**
	 * 마이페이지 진입 위한 비밀번호 재확인
	 * @param member
	 * @return
	 */
	public int mypwchk(Member member);

	/**
	 * 소셜로그인 이용자인지 확인
	 * @param member
	 * @return
	 */
	public int chkSocialId(Member member);

	/**
	 * 셀러 개인정보 확인
	 * @param loginid
	 * @return
	 */
	public MemberSeller sellerinfo(int loginNo);

	/**
	 * 판매 정보 업데이트
	 * @param memberSeller
	 */
	public void sellerinfoUpdate(MemberSeller memberSeller);





	
	
}
