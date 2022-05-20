package funding.dao.face;

import java.util.List;

import funding.dto.Notice;
import funding.dto.NoticeFile;
import funding.util.Paging;

public interface NoticeDao {
	
	public int selectCntNotice();
	
	public List<Notice> noticeAll(Paging paging);
	
	public Notice selectByNotice(Notice notice);
	
	public List<NoticeFile> selectByNoticeFile(Notice notice);
	
}
