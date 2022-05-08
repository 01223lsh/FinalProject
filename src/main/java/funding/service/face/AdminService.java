package funding.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import funding.dto.Category;
import funding.dto.Member;
import funding.dto.Notice;
import funding.dto.NoticeFile;
import funding.dto.Project;
import funding.dto.Qna;
import funding.util.Paging;

public interface AdminService {

	public List<Member> selectMemberAll(Paging paging);

	public Member selectBymemberNo(Member member);

	public Paging membergetPaging(Paging paging,int i, String category, String content);

	public List<Member> selectByGrade(Member member, Paging paging);

	public void gradeUpdate(Member member);

	public List<Member> MemberSearch(String category, String content, Paging paging);

	public void DisabledAllDelete(int i);

	public List<Notice> noticeAll(Paging paging);

	public Paging getnoticePaging(Paging paging);

	public Notice selectByNotice(Notice notice);

	public void noticeWrite(Notice notice, List<MultipartFile> filelist);

	public Notice getFile(Notice notice);

	public void noticeUpdate(Notice notice, List<MultipartFile> filelist, List<Integer> fileNolist);

	public void noticeDelete(Notice notice);

	public List<NoticeFile> selectBtNoticeFile(Notice notice);

	public List<Project> projectList(Paging paging, int i, Category category);

	public Paging getprojectPaging(Paging paging, int i, Category category);

	public List<NoticeFile> selectByNoticeFile(Notice notice);

	// create by young
	// project_step = 1, 심사 대기중인 프로젝트만 가져오는 메소드
    public List<Project> getWaitingProject(Paging paging);

	// create by young
	// 프로젝트 심사 처리
	public int updateProjectStep(Project project, String message);

	// create by young
	// 프로젝트 상세 내용 가져오기
	public Project getProject(Project project);

	public List<Category> categoryList();

	public Paging getapproveProjectpaging(Paging paging);

	public Paging getQnaPaging(Paging paging, String complete);

	public List<Qna> Qnalist(Paging paging, String complete);

	public Qna qnaview(Qna viewqna);

	public void qnaDelete(Qna qna);

	public void qnarewrite(Qna qna);

	public List<Qna> Qnalist();



}
