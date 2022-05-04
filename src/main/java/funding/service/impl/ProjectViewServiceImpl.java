package funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funding.dao.face.ProjectViewDao;
import funding.dto.Project;
import funding.service.face.ProjectViewService;

@Service
public class ProjectViewServiceImpl implements ProjectViewService {
	
	@Autowired
	private ProjectViewDao projectViewDao;
	
	@Override
	public Project getProject(Project project) {
		
		return projectViewDao.selectProject(project);
	}

}
