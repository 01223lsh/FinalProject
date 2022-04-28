package funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funding.dao.face.MemberDao;
import funding.dto.Member;
import funding.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public int idpwCheck(String id, String pw) {

		System.out.println("idpwCheck()");
		System.out.println("id, pw 데이터베이스와 대조");
		Member memberInfo = new Member();
		
		memberInfo.setId(id);
		
		memberInfo = memberDao.loadUserInfo(memberInfo);
		
		//패스워드 비교
		if(memberInfo.getId() != null) {
			if( memberInfo.getPw().equals(pw) ) {
				//로그인성공
				return 1;
			} else {
				//비밀번호가 틀림
				return 2;
			}
		} else {
			//사용자가 존재하지 않음
			return 0;
		}
		
	}

	@Override
	public Member loadUserInfo(String id) {
		
		Member member = new Member();
		
		member.setId(id);
		
		member = memberDao.loadUserInfo(member);
//		MemberDto member =loginDao.loadUserInfo(conn, "dmswk108");
		System.out.println("[LoginServiceImpl] loadUserInfo() - memberDto 정보 : " + member.toString());

		return member;	
	}

}
