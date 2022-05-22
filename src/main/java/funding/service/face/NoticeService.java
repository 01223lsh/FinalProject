package funding.service.face;

import java.util.List;

import funding.dto.Notice;
import funding.dto.NoticeFile;
import funding.util.Paging;

public interface NoticeService {

	public List<Notice> noticeAll(Paging paging);

	public Paging getnoticePaging(Paging paging);

	public Notice selectByNotice(Notice notice);

//	public void noticeWrite(Notice notice, List<MultipartFile> filelist);

	public List<NoticeFile> selectBtNoticeFile(Notice notice);
	
//	public Notice getFile(Notice notice);

//	public void noticeUpdate(Notice notice, List<MultipartFile> filelist, List<Integer> fileNolist);

//	public void noticeDelete(Notice notice);

//	public List<NoticeFile> selectBtNoticeFile(Notice notice);

}
