package funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funding.dao.face.AdminDao;
import funding.dto.Member;
import funding.service.face.AdminService;
import funding.util.Paging;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired AdminDao adminDao;
	
	@Override
	public List<Member> selectMemberAll(Paging paging) {
		return adminDao.selectMemberAll(paging);
	}
	
	@Override
	public Member selectBymemberNo(Member member) {
		return adminDao.selectBymemberNo(member.getMemberNo());
	}
	@Override
	public Paging getPaging(Paging paging,int i,String category,String content) {
		int totalCount ;
		int curPage = paging.getCurPage();
		if(i==4 && content==null && !"".equals(content)) {
			totalCount = adminDao.selectCntAll();
		}else if(content!=null &&!"".equals(content)){
			totalCount=adminDao.selectCntSearch(category,content);
		}else{
			totalCount= adminDao.selectCntGrade(i);
		}
		
		paging = new Paging(totalCount,curPage);
		return paging;
	}
	@Override
	public List<Member> selectByGrade(Member member, Paging paging) {
		return adminDao.selectByGrade(member.getGrade(),paging);
	}
	@Override
	public void gradeUpdate(Member member) {
		adminDao.gradeUpdate(member);
		
	}
	@Override
	public List<Member> MemberSearch(String category, String content,Paging paging) {
		return adminDao.MemberSearch(category,content,paging);
	}
}
