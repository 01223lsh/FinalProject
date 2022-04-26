package funding.dao.face;

import java.util.List;

import funding.commons.Pagination;
import funding.dto.Category;
import funding.dto.Project;

public interface ProjectDao {

	/**
	 * 검색어, 필터가 적용된 프로젝트 목록 수
	 * 
	 * @param pagination 검색어, 필터 정보가 들어있는 DTO 객체
	 * @return 프로젝트 목록 수
	 */
	public int getTotalCnt(Pagination pagination);

	/**
	 * 검색어, 필터가 적용된 프로젝트 리스트
	 * @param pagination 검색어, 필터 정보가 들어있는 DTO 객체
	 * @return 조회된 프로젝트 리스트
	 */
	public List<Project> findAllByFilterAndOrder(Pagination pagination);

	/**
	 * 프로젝트 카테고리를 가져온다.
	 * @return
	 */
	public List<Category> findCategoryList();

	
}
