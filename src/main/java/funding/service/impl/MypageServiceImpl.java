package funding.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funding.dao.face.MypageDao;
import funding.dto.JoinFunding;
import funding.dto.Member;
import funding.dto.MemberSeller;
import funding.dto.Project;
import funding.service.face.MypageService;
import funding.util.Paging;
import funding.util.PagingFundingList;

@Service
public class MypageServiceImpl implements MypageService{

	private static final Logger logger = LoggerFactory.getLogger(MypageServiceImpl.class);
	
	@Autowired
	MypageDao mypageDao;
	
	@Override
	public boolean login(Member member) {

		int chk = mypageDao.selectByIdPw(member);
		
		if(chk > 0) {
			return true;
		} else {
			return false;
		}
	}
	
//	@Override
//	public String getNick(Member member) {
//		return mypageDao.selecNicktById(member);
//	}
	
//	@Override
//	public int getMemberNo(Member member) {
//		return mypageDao.seleteMemberNoById(member);
//	}
	
	
//	@Override
//	public int getGrade(Member member) {
//		return mypageDao.selectGradeById(member);
//	}
	
	@Override
	public Member info(String loginid) {

		return mypageDao.selectByLoginid(loginid);
	}
	
	@Override
	public void infoUpdate(Member member) {

		mypageDao.updateByMemberNo(member);
	}
	
	@Override
	public int nickChk(String nick) {
		
		return mypageDao.selectByNick(nick);
	}
	
	@Override
	public Member getMemberinfo(Member member) {
		return mypageDao.selectInfoById(member);
	}
	
	@Override
	public int mypwchk(Member member) {
		return mypageDao.selectCntPwchkByIdPw(member);
		
	}
	
	@Override
	public int chkSocialId(Member member) {
		return mypageDao.selectCntSocialById(member);
	}
	
	@Override
	public MemberSeller sellerinfo(int loginNo) {
		return mypageDao.selectByloginNo(loginNo);
	}
	
	
	@Override
	public void sellerinfoUpdate(MemberSeller memberSeller) {
		mypageDao.updateSellerByMemberNo(memberSeller);
	}
	

	@Override
	public PagingFundingList getjoinPaging(PagingFundingList pagingParam, int memberNo) {
		
		//전체 총 게시글 수 조회
		pagingParam.setMemberNo(memberNo);
		int totalCount = mypageDao.selectCntAll(pagingParam);
		
		//페이징 계산
		PagingFundingList paging = new PagingFundingList(totalCount, pagingParam.getCurPage() );
		
		paging.setMemberNo(pagingParam.getMemberNo());
		
		
		//검색
		paging.setSelect(pagingParam.getSelect());
		paging.setSearch(pagingParam.getSearch());
		
		logger.info("두번째 페이징 내용물 : {} " , paging);
		
		return paging;
		
		
	}
	
	@Override
	public List<JoinFunding> joinlist(PagingFundingList paging) {
		return mypageDao.selectList(paging);
	}
	
	@Override
	public List<HashMap<String, Object>> joinfundview(JoinFunding joinFunding) {
		return mypageDao.selectjoinfundBymemberNo(joinFunding);
	}
	
	@Override
	public String getseller(int projectNo) {
		return mypageDao.selectSellerNameByProjectNo(projectNo);
	}
	
	@Override
	public PagingFundingList getmakePaging(PagingFundingList pagingParam, int memberNo) {
		
		//전체 총 게시글 수 조회
		pagingParam.setMemberNo(memberNo);
		int totalCount = mypageDao.selectCntAllMake(pagingParam);
		
		//페이징 계산
		PagingFundingList paging = new PagingFundingList(totalCount, pagingParam.getCurPage() );
		
		paging.setMemberNo(pagingParam.getMemberNo());
		
		
		//검색
		paging.setSelect(pagingParam.getSelect());
		paging.setSearch(pagingParam.getSearch());
		
		logger.info("두번째 페이징 내용물 : {} " , paging);
		
		return paging;
	}
	
	@Override
	public List<JoinFunding> makelist(PagingFundingList paging) {
		return mypageDao.selectListMAke(paging);
	}
	
	@Override
		public Project makefundview(Project project) {
			return mypageDao.selectProjectBymemberNo(project);
		}
	
	@Override
	public String getcategory(Project view) {
		return mypageDao.selectCategoryByprojectNo(view);
	}
	
	@Override
	public List<HashMap<String, Object>> makefundreward(Project view) {
		return mypageDao.selectRewardByprojectNo(view);
	}
	
	@Override
	public int getTotalCnt(int memberNo) {
		return mypageDao.selectCntJoinPJ(memberNo);
	}
	
	@Override
	public int getTotalendCnt(int memberNo) {
		return mypageDao.selectCntJoinEndPJ(memberNo);
	}
	
	@Override
	public int getQnaCnt(int memberNo) {
		return mypageDao.selectCntQna(memberNo);
	}
	
	@Override
	public int getMakefund0(int memberNo) {
		return mypageDao.selectCntMake0(memberNo);
	}
	
	@Override
	public int getMakefund1(int memberNo) {
		return mypageDao.selectCntMake1(memberNo);
	}
	
	@Override
	public int getMakefund2(int memberNo) {
		return mypageDao.selectCntMake2(memberNo);

	}
	
	@Override
	public int getMakefund3(int memberNo) {
		return mypageDao.selectCntMake3(memberNo);

	}
	
	@Override
	public int getMakefund4(int memberNo) {
		return mypageDao.selectCntMake4(memberNo);

	}
	
	@Override
	public List<HashMap<String, Object>> getqnalist(int memberNo) {
		return mypageDao.selectQnaList(memberNo);
	}
	
	
}
