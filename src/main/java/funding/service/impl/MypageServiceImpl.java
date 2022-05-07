package funding.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funding.dao.face.MypageDao;
import funding.dto.Member;
import funding.dto.MemberSeller;
import funding.service.face.MypageService;

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
}
