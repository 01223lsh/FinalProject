package funding.service.face;

import java.util.HashMap;
import java.util.List;

import funding.dto.JoinFunding;
import funding.dto.Member;
import funding.dto.MemberSeller;
import funding.dto.Payment;
import funding.dto.Project;
import funding.util.Paging;
import funding.util.PagingFundingList;

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

	/**
	 * 참여중인 편딩 페이징
	 * @param pagingParam
	 * @return
	 */
	public PagingFundingList getjoinPaging(PagingFundingList pagingParam, int memberNo);

	/**
	 * 참여중인 펀딩 리스트
	 * @param paging
	 * @return
	 */
	public List<JoinFunding> joinlist(PagingFundingList paging);

	/**
	 * 참여중인 펀드 상세정보
	 * @param memberNo
	 * @return
	 */
	public List<HashMap<String, Object>> joinfundview(JoinFunding joinFunding);

	/**
	 * 참여중인 펀드 상세정보 - 판매자 이름 가져오기
	 * @param sellername
	 * @return
	 */
	public String getseller(int projectNo);
	
	/**
	 * 제작한 펀딩 페이징
	 * @param pagingParam
	 * @param memberNo
	 * @return
	 */
	public PagingFundingList getmakePaging(PagingFundingList pagingParam, int memberNo);
	
	/**
	 * 제작한 펀딩 리스트
	 * @param paging
	 * @return
	 */
	public List<JoinFunding> makelist(PagingFundingList paging);

	/**
	 * 멤버 번호 따라 제작한 펀드 정보 가져오기
	 * @param memberNo
	 * @return
	 */
	public Project makefundview(Project project);
	
	/**
	 * 카테고리 이름 가져오기
	 * @param view
	 * @return
	 */
	public String getcategory(Project view);

	/**
	 * 프로젝트 번호로 해당 프젝의 리워드 가져오기
	 * @param project
	 * @return
	 */
	public List<HashMap<String, Object>> makefundreward(Project view);

	/**
	 * 참여한 모든 프로젝트 갯수 알아오기
	 * @return
	 */
	public int getTotalCnt(int memberNo);

	/**
	 * 참여한 프로젝트 갯수(프로젝트 종료)
	 * @param memberNo
	 * @return
	 */
	public int getTotalendCnt(int memberNo);
	
	/**
	 * 작성한 qna 갯수 가져오기
	 * @param memberNo
	 * @return
	 */
	public int getQnaCnt(int memberNo);

	/**
	 * 작성중인 펀딩 갯수 가져오기
	 * @param memberNo
	 * @return
	 */
	public int getMakefund0(int memberNo);

	/**
	 * 제작한 펀딩 갯수 가져오기
	 * @param memberNo
	 * @return
	 */
	public int getMakefund1(int memberNo);

	public int getMakefund2(int memberNo);
	
	public int getMakefund3(int memberNo);
	
	public int getMakefund4(int memberNo);
	
	public int getMakefund5(int memberNo);

	/**
	 * 최신 qna 리스트 가져오기
	 * @param memberNo
	 * @return
	 */
	public List<HashMap<String, Object>> getqnalist(int memberNo);

	/**
	 * 결제수단 가져오기
	 * @param projectNo
	 * @param orderNo
	 * @return
	 */
	public Payment getPaymentInfo(int orderNo);

//	/**
//	 * 소셜 - 로그인 네이버 확인
//	 * @param member
//	 * @return
//	 */
//	public int naverchk(Member member);
//
//	/**
//	 * 소셜 - 로그인 카카오 확인
//	 * @param member
//	 * @return
//	 */
//	public int kakaochk(Member member);








	









	
	
}
