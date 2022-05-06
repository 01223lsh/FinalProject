package funding.dao.face;

import java.util.List;

import funding.dto.Project;
import funding.dto.ProjectComment;
import funding.dto.ProjectNews;

public interface ProjectViewDao {

	public Project selectProject(Project project);

	public Project selectPlan(Project project);

	public List<ProjectNews> selectNewsList(int projectNo);

	public List<ProjectComment> selectCommentList(int projectNo);

	public Project selectContent(int projectNo);

	public ProjectNews selectNewsView(ProjectNews news);

}
