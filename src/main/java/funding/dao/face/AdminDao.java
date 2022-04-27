package funding.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import funding.dto.Member;
import funding.util.Paging;

public interface AdminDao {

	public List<Member> selectMemberAll(Paging paging);

	public Member selectBymemberNo(int i);

	public int selectCntAll();

	public int selectCntGrade(int i);

	public List<Member> selectByGrade(@Param("grade")int grade,@Param("paging") Paging paging);

	public void gradeUpdate(Member member);

	public List<Member> MemberSearch(@Param("category")String category, @Param("content")String content,@Param("paging") Paging paging);

	public int selectCntSearch(@Param("category")String category,@Param("content") String content);

}
