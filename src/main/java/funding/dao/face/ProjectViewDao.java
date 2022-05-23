package funding.dao.face;

import java.util.List;

import funding.dto.Member;
import funding.dto.MemberSeller;
import funding.dto.Payment;
import funding.dto.Project;
import funding.dto.ProjectComment;
import funding.dto.ProjectNews;
import funding.dto.Reward;

public interface ProjectViewDao {

	
	/**
	 * 프로젝트 정보 불러오기
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 정보
	 */
	public Project selectProject(Project project);

	/**
	 * 프로젝트 계획
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 계획
	 */
	public Project selectPlan(Project project);

	/**
	 * 최근소식 목록
	 * @param projectNo - 프로젝트 번호
	 * @return 최근소식 목록
	 */
	public List<ProjectNews> selectNewsList(int projectNo);

	/**
	 * 댓글 목록
	 * @param projectNo - 프로젝트 번호
	 * @return 댓글 목록
	 */
	public List<ProjectComment> selectCommentList(int projectNo);

	/**
	 * 소개글 불러오기
	 * @param projectNo - 프로젝트 번호
	 * @return 소개글
	 */
	public Project selectContent(int projectNo);

	/**
	 * 최근소식 상세보기
	 * @param news
	 * @return 상세정보
	 */
	public ProjectNews selectNewsView(ProjectNews news);

	/**
	 * 최근소식 작성
	 * @param news - 최근소식정보
	 */
	public void insertNews(ProjectNews news);

	/**
	 * 최근소식 삭제
	 * @param news - 최근소식 정보
	 */
	public void deleteNews(ProjectNews news);

	/**
	 * 댓글 등록
	 * @param comment - 댓글정보
	 */
	public void insertComment(ProjectComment comment);

	/**
	 * 댓글 삭제
	 * @param comment - 댓글정보
	 */
	public void deleteComment(ProjectComment comment);

	/**
	 * 리워드 목록
	 * @param project - 프로젝트 번호 
	 * @return 리워드 목록
	 */
	public List<Reward> selectRewardList(Project project);

	/**
	 * 창작자 정보 불러오기
	 * @param project - 프로젝트번호
	 * @return 창작자 정보
	 */
	public Member selectSeller(Project project);

	/**
	 * 프로젝트 진행상황
	 * @param projectNo -프로젝트 번호
	 * @return 진행상황
	 */
	public Project selectStep(int projectNo);

	/**
	 * 대화가능시간 수정
	 * @param project - 프로젝트 번호
	 */
	public void updateTalktime(Project project);

	/**
	 * 후원자수 불러오기
	 * @param projectNo - 프로젝트 번호
	 * @return 후원자 수
	 */
	public int selectContributors(int projectNo);

	/**
	 * 후원자 목록 불러오기
	 * @param payment - 프로젝트 번호
	 * @return 후원자 목록
	 */
	public List<Payment> selectContributorsList(Payment payment);

	/**
	 * 최근소식 수정
	 * @param news - 최근소식 정보
	 */
	public void updateNews(ProjectNews news);

}
