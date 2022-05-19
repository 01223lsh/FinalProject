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

	/**
	 * 페이징을 적용하여 프로젝트 목록 조회
	 * 
	 * paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 프로젝트 목록
	 */
	/*
	 * public List<Project> selectList(Paging paging);
	 * 
	 *//**
		 * 전체 프로젝트 수를 조회한다
		 * 
		 * @param paramData - search를 포함한 페이징 객체
		 * @return 총 게시글 수
		 */
	/*
	 * public int selectCntAll(Paging paramData);
	 * 
	 *//**
		 * 프로젝트 번호를 이용하여 프로젝트를 조회한다
		 * 
		 * @param viewProject - 조회하려는 프로젝트 번호
		 * @return 조회된 프로젝트 정보
		 *//*
			 * public Project select(Project viewProject);
			 */

}
