package funding.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import funding.dao.face.ProjectViewDao;
import funding.dto.Member;
import funding.dto.Payment;
import funding.dto.Project;
import funding.dto.ProjectComment;
import funding.dto.ProjectNews;
import funding.dto.Reward;
import funding.service.face.ProjectViewService;

@Service
public class ProjectViewServiceImpl implements ProjectViewService {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	private ProjectViewDao projectViewDao;
	
	@Override
	public Project getProject(Project project) {
		
		return projectViewDao.selectProject(project);
	}
	
	@Override
	public Project getPlan(Project project) {
		
		return projectViewDao.selectPlan(project);
	}
	
	@Override
	public List<ProjectNews> getNewsList(int projectNo) {

		return projectViewDao.selectNewsList(projectNo);
	}
	
	@Override
	public List<ProjectComment> getCommentList(int projectNo) {
		
		return projectViewDao.selectCommentList(projectNo);
	}
	
	@Override
	public Project getContent(int projectNo) {

		
		return projectViewDao.selectContent(projectNo);
	}
	
	@Override
	public ProjectNews getNewsView(ProjectNews news) {
		
		return projectViewDao.selectNewsView(news);
	}

	@Override
	public void writeNews(ProjectNews news) {
		
		projectViewDao.insertNews(news);
		
	}
	
	@Override
	public void deleteNews(ProjectNews news) {
		
		projectViewDao.deleteNews(news);
	}
	
	@Override
	public void writeComment(ProjectComment comment) {
		
		projectViewDao.insertComment(comment);
	}
	
	@Override
	public void deleteComment(ProjectComment comment) {
		
		projectViewDao.deleteComment(comment);
		
	}
	
	@Override
	public List<Reward> getReward(Project project) {
		
		return projectViewDao.selectRewardList(project);
	}
	
	@Override
	public Member getSeller(Project project) {
		
		return projectViewDao.selectSeller(project);
	}
	
	@Override
	public Project getStep(Project project) {
		
		return projectViewDao.selectStep(project);
	}
	
	@Override
	public String fileUpload(MultipartFile file) {
	// 파일 저장 경로 생성
	String storedPath = context.getRealPath("img");
	File storedFolder = new File(storedPath);
	if (storedFolder.exists() == false) {
	storedFolder.mkdir();
	}
	// 저장 파일 이름 생성
	String fileName = UUID.randomUUID().toString().split("-")[4] + file.getOriginalFilename();
	// 업로드 파일 객체 생성
	File dest = new File(storedFolder, fileName);
	// 파일 업로드
	try {
	file.transferTo(dest);
	} catch (IOException e) {
	e.printStackTrace();
	}
	return fileName;
	}
	
	@Override
	public void updateTalktime(Project project) {
		
		projectViewDao.updateTalktime(project);
	}
	
	@Override
	public int getContributors(int projectNo) {
		
		return projectViewDao.selectContributors(projectNo);
	}
	
	@Override
	public List<Payment> getContributorsList(Payment payment) {
		
		return projectViewDao.selectContributorsList(payment);
	}
}
