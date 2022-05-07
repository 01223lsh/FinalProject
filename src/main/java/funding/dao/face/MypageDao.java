package funding.dao.face;

import funding.dto.Member;
import funding.dto.MemberSeller;

public interface MypageDao {

	/**
	 * 파라미터로 받은 id, pw로 계정유무 확인
	 * @param member
	 * @return
	 */
	public int selectByIdPw(Member member);

//	/**
//	 * 해당 계정의 닉네임 조회하기
//	 * @param member
//	 * @return
//	 */
//	public String selecNicktById(Member member);
	
//	/**
//	 * 
//	 * @param member
//	 * @return
//	 */
//	public int seleteMemberNoById(Member member);
	
	/**
	 * 로그인한 아이디를 통해 회원 정보 가져오기
	 * @param loginid
	 * @return
	 */
	public Member selectByLoginid(String loginid);

	/**
	 * 회원 번호로 해당 회원 정보 수정하기
	 * @param member
	 * @return
	 */
	public void updateByMemberNo(Member member);

	/**
	 * 닉네임 중복검사
	 * @param nick
	 * @return
	 */
	public int selectByNick(String nick);

//	/**
//	 * 회원 유형 가져오기
//	 * @param member
//	 * @return
//	 */
//	public int selectGradeById(Member member);

	/**
	 * 회원 정보 몽땅 가져오기
	 * @param member
	 * @return
	 */
	public Member selectInfoById(Member member);

	/**
	 * 비밀번호 일치 확인
	 * @param member
	 * @return
	 */
	public int selectCntPwchkByIdPw(Member member);

	/**
	 * 소셜로그인 계정 확인
	 * @param member
	 * @return 0 : 소셜로그인 / 1: 소셜로그인 아님(일반회원)
	 */
	public int selectCntSocialById(Member member);

	/**
	 * 판매자 판매 정보 불러오기
	 * @param loginid
	 * @return
	 */
	public MemberSeller selectByloginNo(int loginNo);

	/**
	 * 판매 정보 수정하기
	 * @param memberSeller
	 */
	public void updateSellerByMemberNo(MemberSeller memberSeller);

	
}
