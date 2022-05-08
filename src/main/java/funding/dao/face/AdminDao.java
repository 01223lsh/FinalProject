package funding.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import funding.dto.Category;
import funding.dto.Member;
import funding.dto.Notice;
import funding.dto.NoticeFile;
import funding.dto.Project;
import funding.dto.Qna;
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


//	public NoticeFile selectByNoticeFile(NoticeFile noticeFile);

	public Notice selectNoticeFileByFileNo(Notice notice);

	public void noticeUpdate(Notice notice);

	public void updateNoticeFile(Notice notice);

	public void insertNoticeFile(Notice notice);

	public void noticeDelete(Notice notice);

	public void noticeFileDelete(Notice notice);

	public List<NoticeFile> selectByNoticeFile(Notice notice);

	public void fileNoByDelete(@Param("notice")Notice notice,@Param("fileNolist") List<Integer> fileNolist);

	public List<Project> projectList(@Param("paging") Paging paging, @Param("step")int step,@Param("categoryNo") int categoryNo);

	public int selectCntProject(@Param("step")int step,@Param("categoryNo") int categoryNo);

	// create by young
	// DB 에서 심사대기중인 프로젝트 가져오기
    List<Project> findAllWaitingProject(Paging paging);

	// create by young
	// 프로젝트 상태 업데이트
	int updateProjectStep(Project project);

	// create by young
	// 프로젝트 상세 내용 조회
	Project findByNo(Project project);

	public List<Category> categoryList();

	public int selectCntapproveProject(Paging paging);

	public int selectCntQna(String complete);

	public List<Qna> qnaAll(Paging paging);

	public List<Qna> selectQnaList(@Param("paging")Paging paging, @Param("complete")String complete);

	public Qna selectByQnaNo(Qna viewqna);

	public void deleteQna(Qna qna);

	public void updateQnaAll(Qna qna);

	public void insertQnare(Qna qna);

	public List<Qna> selectQnaListStep();


}
