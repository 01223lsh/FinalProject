package funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funding.dao.face.MemberDao;
import funding.dto.Member;
import funding.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;
	
	@Override
	public boolean login(Member member) {
		int loginChk = memberDao.selectCntMember(member);

		if (loginChk > 0)
			return true;
		return false;
	}

	@Override
	public String getNick(Member member) {
		return memberDao.selectNickByMember(member);
	}

	@Override
	public int getGrade(Member member) {
		return memberDao.selectGradeByMember(member);
	}

	@Override
	public int getMemberNo(Member member) {
		return memberDao.selectMemberNoByMember(member);
	}

}
