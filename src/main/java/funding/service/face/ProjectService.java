package funding.service.face;

import java.util.List;

import funding.commons.Pagination;
import funding.dto.Category;
import funding.dto.Project;
import funding.util.Paging;

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

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Project> list(Paging paging);

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 파라미터 객체의 curPage(현재 페이지) DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 게시글 상세보기
	 * 
	 * @param viewBoard - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public Project view(Project viewProject);

}
