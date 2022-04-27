package funding.service.face;

import java.util.List;

import funding.dto.Member;
import funding.util.Paging;

public interface AdminService {

	public List<Member> selectMemberAll(Paging paging);

	public Member selectBymemberNo(Member member);

	public Paging getPaging(Paging paging,int i, String category, String content);

	public List<Member> selectByGrade(Member member, Paging paging);

	public void gradeUpdate(Member member);

	public List<Member> MemberSearch(String category, String content, Paging paging);

}
