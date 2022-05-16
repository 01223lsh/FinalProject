package funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import funding.dao.face.NoticeDao;
import funding.dto.Notice;
import funding.dto.NoticeFile;
import funding.service.face.NoticeService;
import funding.util.Paging;

public class NoticeServiceImpl implements NoticeService {
	
	@Autowired NoticeDao noticeDao;
	
	@Override
	public List<Notice> noticeAll(Paging paging) {
		
		return noticeDao.noticeAll(paging);
	}
	
	@Override
	public Paging getnoticePaging(Paging paging) {
		int totalCount = noticeDao.selectCntNotice();
		int curPage = paging.getCurPage();
		
		paging =new Paging(totalCount,curPage);
		return paging;
	}
	
	@Override
	public Notice selectByNotice(Notice notice) {
		
		return noticeDao.selectByNotice(notice);
	}
	
	@Override
	public List<NoticeFile> selectBtNoticeFile(Notice notice) {
		return noticeDao.selectByNoticeFile(notice);
	}
	
}
