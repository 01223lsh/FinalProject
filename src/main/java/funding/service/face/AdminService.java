package funding.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import funding.dto.Member;
import funding.dto.Notice;
import funding.dto.NoticeFile;
import funding.dto.Project;
import funding.util.Paging;

public interface AdminService {

	public List<Member> selectMemberAll(Paging paging);

	public Member selectBymemberNo(Member member);

	public Paging getPaging(Paging paging,int i, String category, String content);

	public List<Member> selectByGrade(Member member, Paging paging);

	public void gradeUpdate(Member member);

	public List<Member> MemberSearch(String category, String content, Paging paging);

	public void DisabledAllDelete(int i);

	public List<Notice> noticeAll(Paging paging);

	public Paging getnoticePaging(Paging paging);

	public Notice selectByNotice(Notice notice);

	public void noticeWrite(Notice notice, List<MultipartFile> filelist);

//	public NoticeFile selectByNoticeFile(NoticeFile noticeFile);

	public Notice getFile(Notice notice);

	public void noticeUpdate(Notice notice, List<MultipartFile> filelist, List<Integer> fileNolist);

	public void noticeDelete(Notice notice);

	public List<NoticeFile> selectBtNoticeFile(Notice notice);

	public List<Project> projectList(Paging paging, int i);

	public Paging getprojectPaging(Paging paging, int i);

	public List<NoticeFile> selectByNoticeFile(Notice notice);

	// create by young
	// project_step = 1, 심사 대기중인 프로젝트만 가져오는 메소드
    List<Project> getWaitingProject();

	// create by young
	// 프로젝트 심사 처리
	int updateProjectStep(Project project, String message);

	// create by young
	// 프로젝트 상세 내용 가져오기
	Project getProject(Project project);
}
