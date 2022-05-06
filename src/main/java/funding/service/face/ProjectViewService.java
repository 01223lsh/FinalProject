
package funding.service.face;

import java.util.List;

import funding.dto.Project;
import funding.dto.ProjectComment;
import funding.dto.ProjectNews;

public interface ProjectViewService {

	public Project getProject(Project project);

	public Project getPlan(Project project);

	public List<ProjectNews> getNewsList(int projectNo);

	public List<ProjectComment> getCommentList(int projectNo);

	public Project getContent(int projectNo);

	public ProjectNews getNewsView(ProjectNews news);

}
