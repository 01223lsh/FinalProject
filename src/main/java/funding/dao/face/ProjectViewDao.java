package funding.dao.face;

import java.util.List;

import funding.dto.Member;
import funding.dto.MemberSeller;
import funding.dto.Project;
import funding.dto.ProjectComment;
import funding.dto.ProjectNews;
import funding.dto.Reward;

public interface ProjectViewDao {

	public Project selectProject(Project project);

	public Project selectPlan(Project project);

	public List<ProjectNews> selectNewsList(int projectNo);

	public List<ProjectComment> selectCommentList(int projectNo);

	public Project selectContent(int projectNo);

	public ProjectNews selectNewsView(ProjectNews news);

	public void insertNews(ProjectNews news);

	public void deleteNews(ProjectNews news);

	public void insertComment(ProjectComment comment);

	public void deleteComment(ProjectComment comment);

	public List<Reward> selectRewardList(Project project);

	public Member selectSeller(Project project);

	public Project selectStep(Project project);

	public void updateTalktime(Project project);

}
