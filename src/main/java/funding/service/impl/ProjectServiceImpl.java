package funding.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funding.commons.Pagination;
import funding.dao.face.ProjectDao;
import funding.dto.Category;
import funding.dto.Project;
import funding.service.face.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	private static final Logger log = LoggerFactory.getLogger(ProjectService.class);
	
	@Autowired
	private ProjectDao projectDao;

	@Override
	public List<Project> getPageList(Pagination pagination) {
		
		log.info("pagination: {}", pagination);
		
		int total = projectDao.getTotalCnt(pagination);
		
		pagination.build(10, total);
		
		List<Project> list = projectDao.findAllByFilterAndOrder(pagination);
		
		return list;
	}

	@Override
	public List<Category> getCategoryList() {
		
		return projectDao.findCategoryList();
	}

}
