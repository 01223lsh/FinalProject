package funding.dao.face;

import java.util.HashMap;
import java.util.List;

import funding.dto.JoinFunding;
import funding.dto.Member;
import funding.dto.MemberSeller;
import funding.dto.Payment;
import funding.dto.Project;
import funding.util.Paging;
import funding.util.PagingFundingList;

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

	/**
	 * 참여중인 펀딩 페이징(총 개수)
	 * @param pagingParam
	 * @return
	 */
	public int selectCntAll(PagingFundingList pagingParam);

	/**
	 * 참여중인 펀딩 리스트
	 * @param paging
	 * @return
	 */
	public List<JoinFunding> selectList(PagingFundingList paging);

	/**
	 * 참여중인 펀드 상세정보 죄다 불러오기
	 * @param memberNo
	 * @return
	 */
	public List<HashMap<String, Object>> selectjoinfundBymemberNo(JoinFunding joinFunding);

	/**
	 * 참여중인 펀드 정보의 프로젝트 셀러 찾아오기
	 * @param sellername - 해시맵에 있던 프로젝트 번호
	 * @return
	 */
	public String selectSellerNameByProjectNo(int projectNo);
	
	/**
	 * 제작한 펀딩 페이지(총 개수)
	 * @param pagingParam
	 * @return
	 */
	public int selectCntAllMake(PagingFundingList pagingParam);

	/**
	 * 제작한 펀딩 리스트
	 * @param paging
	 * @return
	 */
	public List<JoinFunding> selectListMAke(PagingFundingList paging);

	/**
	 * 제작한 펀딩 정보 가져오기
	 * @param memberNo
	 * @return
	 */
	public Project selectProjectBymemberNo(Project project);
	
	/**
	 * 카테고리 골라오기
	 * @param view
	 * @return
	 */
	public String selectCategoryByprojectNo(Project view);

	/**
	 * 프로젝트 번호로 리워드 정보 가져오기
	 * @param project
	 * @return
	 */
	public List<HashMap<String, Object>> selectRewardByprojectNo(Project view);

	/**
	 * 참여한 프로젝트 갯수 세기(진행중인 프로젝트)
	 * @return
	 */
	public int selectCntJoinPJ(int memberNo);

	/**
	 * 참여한 프로젝트 갯수 세기(종료된 프로젝트)
	 * @return
	 */
	public int selectCntJoinEndPJ(int memberNo);
	
	/**
	 * 작성한 qna 갯수 세기
	 * @param memberNo
	 * @return
	 */
	public int selectCntQna(int memberNo);

	/**
	 * 작성중인 펀딩 갯수 가져오기
	 * @param memberNo
	 * @return
	 */
	public int selectCntMake0(int memberNo);

	/**
	 * 제작한 펀딩 갯수 가져오기
	 * @param memberNo
	 * @return
	 */
	public int selectCntMake1(int memberNo);

	public int selectCntMake2(int memberNo);
	
	public int selectCntMake3(int memberNo);
	
	public int selectCntMake4(int memberNo);
	
	public int selectCntMake5(int memberNo);
	
	/**
	 * 최신 문의사항 리스트 5개 뽑기
	 * @param memberNo
	 * @return
	 */
	public List<HashMap<String, Object>> selectQnaList(int memberNo);

	/**
	 * 주문번호따라 프로젝트 정보 가져오기
	 * @param orderNo
	 * @return
	 */
	public Payment selectProjectByorderNo(int orderNo);

	
//	/**
//	 * 네이버 소셜 확인
//	 * @param member
//	 * @return
//	 */
//	public int selectCntNSocialById(Member member);
//
//	/**
//	 * 카카오 소셜 확인
//	 * @param member
//	 * @return
//	 */
//	public int selectCntKSocialById(Member member);






	


	

	
}
