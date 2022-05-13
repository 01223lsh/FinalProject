package funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funding.dao.face.ProjectViewDao;
import funding.dto.Project;
import funding.dto.ProjectComment;
import funding.dto.ProjectNews;
import funding.dto.Reward;
import funding.service.face.ProjectViewService;

@Service
public class ProjectViewServiceImpl implements ProjectViewService {
	
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
}
