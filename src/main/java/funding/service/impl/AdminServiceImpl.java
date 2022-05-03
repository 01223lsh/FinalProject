package funding.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import funding.dao.face.AdminDao;
import funding.dto.Member;
import funding.dto.Notice;
import funding.dto.NoticeFile;
import funding.dto.Project;
import funding.service.face.AdminService;
import funding.util.Paging;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired AdminDao adminDao;
	
	@Autowired ServletContext context;
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Override
	public List<Member> selectMemberAll(Paging paging) {
		return adminDao.selectMemberAll(paging);
	}
	
	@Override
	public Member selectBymemberNo(Member member) {
		return adminDao.selectBymemberNo(member.getMemberNo());
	}
	@Override
	public Paging getPaging(Paging paging,int i,String category,String content) {
		int totalCount ;
		int curPage = paging.getCurPage();
		if(i==4 && content==null && !"".equals(content)) {
			totalCount = adminDao.selectCntMember();
		}else if(content!=null &&!"".equals(content)){
			totalCount=adminDao.selectCntMemberSearch(category,content);
		}else{
			totalCount= adminDao.selectCntMemberGrade(i);
		}
		
		paging = new Paging(totalCount,curPage);
		return paging;
	}
	@Override
	public List<Member> selectByGrade(Member member, Paging paging) {
		return adminDao.selectByGrade(member.getGrade(),paging);
	}
	@Override
	public void gradeUpdate(Member member) {
		adminDao.gradeUpdate(member);
		
	}
	@Override
	public List<Member> MemberSearch(String category, String content,Paging paging) {
		return adminDao.MemberSearch(category,content,paging);
	}
	@Override
	public void DisabledAllDelete(int i) {
		adminDao.DisabledAllDelete(i);
	}
	
	@Override
	public List<Notice> noticeAll(Paging paging) {
		
		return adminDao.noticeAll(paging);
	}
	@Override
	public Paging getnoticePaging(Paging paging) {
		int totalCount = adminDao.selectCntNotice();
		int curPage = paging.getCurPage();
		
		paging =new Paging(totalCount,curPage);
		return paging;
	}
	@Override
	public Paging getprojectPaging(Paging paging,int step) {
		int totalCount = adminDao.selectCntProject(step);
		int curPage = paging.getCurPage();
		paging = new Paging(totalCount,curPage);
		return paging;
	}
	@Override
	public Notice selectByNotice(Notice notice) {
		
		return adminDao.selectByNotice(notice);
	}
	@Override
	public List<NoticeFile> selectBtNoticeFile(Notice notice) {
		return adminDao.selectByNoticeFile(notice);
	}
//	@Override
//	public void noticeWrite(Notice notice, MultipartFile file) {
//		
//		
//	}
//	@Override
//	public NoticeFile selectByNoticeFile(NoticeFile noticeFile) {
//		return adminDao.selectByNoticeFile(noticeFile);
//	} 
	@Override
	public Notice getFile(Notice notice) {
	
		return adminDao.selectNoticeFileByFileNo(notice);
	}
	@Override
	public void noticeUpdate(Notice notice,List<MultipartFile> filelist) {
		int noticeNo= notice.getNoticeNo();
		adminDao.noticeUpdate(notice);
		if(filelist.size()<=0) {
			return;
		}
		
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File(storedPath);
		if(!storedFolder.exists()) {
			storedFolder.mkdir();
		}
//		String filename = file.getOriginalFilename();
//		filename+= UUID.randomUUID().toString().split("-")[4];
//		File dest = new File(storedFolder,filename);
//
//		try {
//			file.transferTo(dest);
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		notice.setFileOrigin(file.getOriginalFilename());
//		notice.setFileStorage(filename);
//		if(notice.getFileNo()<=0) {
//			adminDao.insertNoticeFile(notice);
//		}else {
//			adminDao.updateNoticeFile(notice);			
//		}
		adminDao.fileNoByDelete(notice);
		for(MultipartFile mf : filelist) {
			
			String filename = mf.getOriginalFilename();
			filename+= UUID.randomUUID().toString().split("-")[4];
			File dest = new File(storedFolder,filename);
			try {
				mf.transferTo(dest);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			notice.setFileOrigin(mf.getOriginalFilename());
			notice.setFileStorage(filename);
			notice.setNoticeNo(noticeNo);
			adminDao.insertNoticeFile(notice);
		}
		
	}
	@Override
	public void noticeDelete(Notice notice) {
		
		adminDao.noticeFileDelete(notice);
		adminDao.noticeDelete(notice);
		
	}
	@Override
	public void noticeWrite(Notice notice, List<MultipartFile> filelist) {
		int noticeNo = adminDao.selectBynoticeno();
		notice.setNoticeNo(noticeNo);
		adminDao.noticeWrite(notice);
		if(filelist.size()<=0) {
			return;
		}
		String storedPath = context.getRealPath("upload");
		
		
		File storedFolder = new File(storedPath);
		if(!storedFolder.exists()) {
			storedFolder.mkdir();
		}
		for(MultipartFile mf : filelist) {
			
			String filename = mf.getOriginalFilename();
			filename = UUID.randomUUID().toString().split("-")[4];
			File dest = new File(storedFolder,filename);
			try {
				mf.transferTo(dest);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			notice.setFileOrigin(mf.getOriginalFilename());
			notice.setFileStorage(filename);
			notice.setNoticeNo(noticeNo);
			adminDao.insertNoticeFile(notice);
		}
		
	}
	@Override
	public List<Project> projectList(Paging paging, int step) {
		
		return adminDao.projectList(paging, step);
	}
}
