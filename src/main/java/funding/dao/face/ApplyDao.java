package funding.dao.face;

import funding.dto.Project;

public interface ApplyDao {
	
	/**
	 * 프로젝트 최초 생성 
	 * 
	 * @param project
	 */
	public void projectInsert(Project project);
	
}
