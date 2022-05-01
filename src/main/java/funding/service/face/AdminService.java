package funding.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import funding.dto.Member;
import funding.dto.Notice;
import funding.dto.NoticeFile;
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

	public void noticeWrite(Notice notice, MultipartFile file);

//	public NoticeFile selectByNoticeFile(NoticeFile noticeFile);

	public Notice getFile(Notice notice);

	public void noticeUpdate(Notice notice, MultipartFile file);

	public void noticeDelete(Notice notice);

}
