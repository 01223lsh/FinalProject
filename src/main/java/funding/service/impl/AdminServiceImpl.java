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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import funding.dao.face.AdminDao;
import funding.dto.AdminMain;
import funding.dto.Alert;
import funding.dto.Category;
import funding.dto.Chart;
import funding.dto.Member;
import funding.dto.MemberSeller;
import funding.dto.Notice;
import funding.dto.NoticeFile;
import funding.dto.Project;
import funding.dto.ProjectComment;
import funding.dto.ProjectNews;
import funding.dto.Qna;
import funding.dto.Reward;
import funding.service.face.AdminService;
import funding.util.ApprovedPaging;
import funding.util.Paging;
import funding.util.ProjectPaging;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDao adminDao;

	@Autowired
	ServletContext context;
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);

	@Override
	public List<Chart> selectByMemberDate(Chart chart) {
		return adminDao.selectByMemberDate(chart);
	}
	@Override
	public List<Member> selectMemberAll(Paging paging) {
		return adminDao.selectMemberAll(paging);
	}

	@Override
	public Member selectBymemberNo(Member member) {
		return adminDao.selectBymemberNo(member.getMemberNo());
	}

	@Override
	public Paging membergetPaging(Paging paging, int i, String category, String content) {
		int totalCount;
		int curPage = paging.getCurPage();
		if (i == 4 && content == null && !"".equals(content)) {
			totalCount = adminDao.selectCntMember();
		} else if (content != null && !"".equals(content)) {
			totalCount = adminDao.selectCntMemberSearch(category, content);
		} else {
			totalCount = adminDao.selectCntMemberGrade(i);
		}

		paging = new Paging(totalCount, curPage);
		return paging;
	}

	@Override
	public List<Member> selectByGrade(Member member, Paging paging) {
		return adminDao.selectByGrade(member.getGrade(), paging);
	}

	@Override
	public void gradeUpdate(Member member) {
		adminDao.gradeUpdate(member);

	}

	@Override
	public List<Member> MemberSearch(String category, String content, Paging paging) {
		return adminDao.MemberSearch(category, content, paging);
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

		paging = new Paging(totalCount, curPage);
		return paging;
	}
	@Override
	public Paging getQnaPaging(Paging paging, String complete) {
		int totalCount = adminDao.selectCntQna(complete);
		int curPage = paging.getCurPage();

		paging = new Paging(totalCount, curPage);
		return paging;
	}
	

	@Override
	public ProjectPaging getprojectPaging(ProjectPaging paging, int step,Category category) {

		int totalCount = adminDao.selectCntProject(step,category.getCategoryNo());
		int curPage = paging.getCurPage();
		paging = new ProjectPaging(totalCount, curPage);
		return paging;
	}
	@Override
	public ApprovedPaging getapproveProjectpaging(ApprovedPaging paging) {
		int totalCount = adminDao.selectCntapproveProject(paging);
		int curPage = paging.getCurPage();
		paging = new ApprovedPaging(totalCount,curPage);
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


	

	@Override
	@Transactional
	public void noticeUpdate(Notice notice, List<MultipartFile> filelist, List<Integer> fileNolist) {
		int noticeNo = notice.getNoticeNo();
		if(notice.getTitle().equals("") &&notice.getTitle()==null) {
			notice.setTitle("?????? ??????");
		}
		if(notice.getContent().equals("") || notice.getContent()==null) {
			notice.setContent(" ");
		}
		adminDao.noticeUpdate(notice);
		adminDao.fileNoByDelete(notice, fileNolist);
		if (filelist.size() <= 0) {

			return;
		}

		String storedPath = context.getRealPath("noticeimg");
		File storedFolder = new File(storedPath);
		if (!storedFolder.exists()) {
			storedFolder.mkdir();
		}

		for (MultipartFile mf : filelist) {

			String filename = mf.getOriginalFilename();
			filename += UUID.randomUUID().toString().split("-")[4];
			File dest = new File(storedFolder, filename);
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
	@Transactional
	public void noticeWrite(Notice notice, List<MultipartFile> filelist) {
		if(notice.getTitle().equals("") || notice.getTitle()==null) {
			notice.setTitle("?????? ??????");
		}
		if(notice.getContent().equals("") || notice.getContent()==null) {
			notice.setContent(" ");
		}
		int noticeNo = adminDao.selectBynoticeno();
		notice.setNoticeNo(noticeNo);
		adminDao.noticeWrite(notice);
		
		if (filelist.size() <= 0) {
			return;
		}
		String storedPath = context.getRealPath("noticeimg");


		File storedFolder = new File(storedPath);
		if (!storedFolder.exists()) {
			storedFolder.mkdir();
		}
		for (MultipartFile mf : filelist) {

			String filename = mf.getOriginalFilename();
			filename = UUID.randomUUID().toString().split("-")[4];
			File dest = new File(storedFolder, filename);
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
	public List<Project> projectList(ProjectPaging paging, int step,Category category) {

		return adminDao.projectList(paging, step,category.getCategoryNo());
	}
	@Override
	public List<NoticeFile> selectByNoticeFile(Notice notice) {
		return adminDao.selectByNoticeFile(notice);
	}

	// create by young
	// project_step = 1, ?????? ???????????? ??????????????? ???????????? ?????????
	@Override
	public List<Project> getWaitingProject(ApprovedPaging paging) {
		return adminDao.findAllWaitingProject(paging);
	}

	// create by young
	// ???????????? ???????????? ????????????(4 - ??????, 3 - ?????? ??????}
	@Override
	@Transactional  // ?????? ????????? insert ?????? ????????? ???????????? ?????? ??????
	public int updateProjectStep(Project project, Alert alert) {
		// ???????????? ?????? ????????????
		int result = adminDao.updateProjectStep(project);
		
		if (project.getProjectStep() == 5) {
			// ???????????? ?????? ????????? ??????????????? ?????? ????????? ????????? ?????? ??????
			alert.setAlertContent("\""+project.getProjectTitle()+"\"??? ??????????????? ?????? ???????????????.") ;
		}else if(project.getProjectStep() == 2) {
			alert.setAlertContent("\""+project.getProjectTitle()+"\"??? ??????????????? ?????? ???????????????. (?????? :"+alert.getAlertContent()+")") ;
		}
		adminDao.insertAlert(alert);

		if (result == 1) {
			logger.info("???????????? ?????? ???????????? ??????");
			return 1;
		} else {
			logger.error("???????????? ?????? ???????????? ??????");
			return -1;
		}
	}

	// create by young
	// ?????? ???????????? ???????????? ??????
	@Override
	public Project getProject2(Project project) {
		return adminDao.findByNo(project);
	}
	@Override
	public List<Category> categoryList() {
		return adminDao.categoryList();
	}
	
	//????????? ??????
	@Override
	public List<Qna> Qnalist(Paging paging, String complete) {
		return adminDao.selectQnaList(paging,complete);
	}
	@Override
	public List<Qna> Qnalist() {
		return adminDao.selectQnaListStep();
	}
	@Override
	public Qna qnaview(Qna viewqna) {
		Qna qna = adminDao.selectByQnaNo(viewqna);
		
		return qna;
	}
	@Override
	public void qnaDelete(Qna qna) {
		logger.info("??????????????? ??? ?????? : {}", qna.getQnaNo());

		adminDao.deleteQna(qna);
		
	}
	@Override
	public void qnarewrite(Qna qna) {
		if("".equals(qna.getQnaTitle())){
			qna.setQnaTitle("(????????????)");
		}
		logger.info("qqqqqqqqqqq{}",qna);
		adminDao.insertqnaAlert(qna);
		adminDao.updateQnaAll(qna);
		adminDao.insertQnare(qna);
		
	}
	@Override
	public MemberSeller selectBymemberSeller(Member member) {
		return adminDao.selectBymemberSeller(member);
	}
	@Override
	public Qna selectbyqnainfo(Qna qna) {
		return adminDao.selectbyqnainfo(qna);
	}
	@Override
	public void qnaUpdate(Qna qna) {
		 adminDao.qnaUpdate(qna);
	}
	@Override
	public AdminMain memberAndProjectAllCnt() {
		return adminDao.memberAndProjectAllCnt();
	}
	@Override
	public List<AdminMain> categoryCntList() {
		return adminDao.categoryCntList();
	}
	@Override
	public List<Notice> mainNoticeAll() {
		return adminDao.mainNoticeAll();
	}
	@Override
	public List<Qna> mainQnaAll() {
		return adminDao.mainQnaAll();
	}
	@Override
	public List<AdminMain> adminProjectList() {
		return adminDao.adminProjectList();
	}
	@Override
	public List<AdminMain> projectSelectPayment() {
		return adminDao.projectSelectPayment();
	}
	
	@Override
	public AdminMain selectCntAll() {
		return adminDao.selectCntAll();
	}
	
	@Override
	public MemberSeller getBuisnessInfo(Project result) {
		return adminDao.getBuisnessInfo(result);
	}
	
	
	
	
	
	
	
	
	//???????????? ??????
	@Override
	public Project getProject(Project project) {
		
		return adminDao.selectProject(project);
	}
	//???????????? ??????
	@Override
	public Project getPlan(Project project) {
		
		return adminDao.selectPlan(project);
	}
	//???????????? ??????
	@Override
	public List<ProjectNews> getNewsList(int projectNo) {

		return adminDao.selectNewsList(projectNo);
	}
	//???????????? ??????
	@Override
	public Project getContent(int projectNo) {
		
		return adminDao.selectContent(projectNo);
	}
	//???????????? ??????
	@Override
	public ProjectNews getNewsView(ProjectNews news) {
		
		return adminDao.selectNewsView(news);
	}
	
	//???????????? ??????
	@Override
	public Member getSeller(Project project) {
		
		return adminDao.selectSeller(project);
	}
	//???????????? ??????
	@Override
	public Project getStep(Project project) {
		
		return adminDao.selectStep(project);
	}
	//???????????? ??????
	@Override
	public String fileUpload(MultipartFile file) {
	// ?????? ?????? ?????? ??????
	String storedPath = context.getRealPath("img");
	File storedFolder = new File(storedPath);
	if (storedFolder.exists() == false) {
	storedFolder.mkdir();
	}
	// ?????? ?????? ?????? ??????
	String fileName = UUID.randomUUID().toString().split("-")[4] + file.getOriginalFilename();
	// ????????? ?????? ?????? ??????
	File dest = new File(storedFolder, fileName);
	// ?????? ?????????
	try {
	file.transferTo(dest);
	} catch (IOException e) {
	e.printStackTrace();
	}
	return fileName;
	}
	//???????????? ??????
	@Override
	public List<ProjectComment> getCommentList(int projectNo) {
		
		return adminDao.selectCommentList(projectNo);
	}
	//???????????? ??????
	@Override
	public List<Reward> getReward(Project project) {
		
		return adminDao.selectRewardList(project);
	}
	//???????????? ??????
	@Override
	public void deleteNews(ProjectNews news) {
		
		adminDao.deleteNews(news);
	}

}