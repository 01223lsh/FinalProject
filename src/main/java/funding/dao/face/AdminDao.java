package funding.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import funding.dto.Member;
import funding.dto.Notice;
import funding.dto.NoticeFile;
import funding.util.Paging;

public interface AdminDao {

	public List<Member> selectMemberAll(Paging paging);

	public Member selectBymemberNo(int i);

	public int selectCntMember();

	public int selectCntMemberGrade(int i);

	public List<Member> selectByGrade(@Param("grade")int grade,@Param("paging") Paging paging);

	public void gradeUpdate(Member member);

	public List<Member> MemberSearch(@Param("category")String category, @Param("content")String content,@Param("paging") Paging paging);

	public int selectCntMemberSearch(@Param("category")String category,@Param("content") String content);

	public void DisabledAllDelete(int i);

	public int selectCntNotice();

	public List<Notice> noticeAll(Paging paging);

	public Notice selectByNotice(Notice notice);

	public int selectBynoticeno();

	public void noticeWrite(Notice notice);

	public void insertNoticeFile(NoticeFile noticeFile);

//	public NoticeFile selectByNoticeFile(NoticeFile noticeFile);

	public NoticeFile selectNoticeFileByFileNo(NoticeFile noticeFile);

}
