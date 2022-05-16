package funding.service.face;

import java.util.List;

import funding.commons.Pagination;
import funding.dto.Category;
import funding.dto.Project;

public interface ProjectService {

	/**
	 * 프로젝트 리스트 조회
	 * 
	 * @param pagination
	 * @param project
	 * @return
	 */
	List<Project> getPageList(Pagination pagination);

	/**
	 * 카테고리 리스트 조회
	 * 
	 * @return 카테고리 리스트
	 */
	List<Category> getCategoryList();

}