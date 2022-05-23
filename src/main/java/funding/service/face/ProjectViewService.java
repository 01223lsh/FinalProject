
package funding.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import funding.dto.Member;
import funding.dto.MemberSeller;
import funding.dto.Payment;
import funding.dto.Project;
import funding.dto.ProjectComment;
import funding.dto.ProjectNews;
import funding.dto.Reward;

public interface ProjectViewService {

	/**
	 * 프로젝트 정보 불러오기
	 * @param project - 프로젝트번호
	 * @return 상세정보
	 */
	public Project getProject(Project project);

	/**
	 * 프로젝트 계획 불러오기
	 * @param project - 프로젝트번호
	 * @return 계획
	 */
	public Project getPlan(Project project);

	/**
	 * 프로젝트 최근소식 리스트
	 * @param projectNo - 프로젝트번호
	 * @return 최근소식 리스트
	 */
	public List<ProjectNews> getNewsList(int projectNo);

	/**
	 * 댓글목록 불러오기
	 * @param projectNo - 프로젝트 번호
	 * @return 댓글 목록
	 */
	public List<ProjectComment> getCommentList(int projectNo);

	/**
	 * 소개글 불러오기
	 * @param projectNo - 프로젝트번호
	 * @return 소개글
	 */
	public Project getContent(int projectNo);

	/**
	 * 최근소식 상세보기
	 * @param news - 최근소식번호
	 * @return 최근소식 상세정보
	 */
	public ProjectNews getNewsView(ProjectNews news);

	/**
	 * 최근소식 작성
	 * @param news - 최근소식정보
	 */
	public void writeNews(ProjectNews news);

	/**
	 * 최근소식 삭제
	 * @param news - 최근소식정보
	 */
	public void deleteNews(ProjectNews news);

	/**
	 * 댓글 등록
	 * @param comment - 댓글정보
	 */
	public void writeComment(ProjectComment comment);

	/**
	 * 댓글 삭제
	 * @param comment - 댓글정보
	 */
	public void deleteComment(ProjectComment comment);

	/**
	 * 리워드 목록 불러오기
	 * @param project - 프로젝트 번호
	 * @return 리워드 목록
	 */
	public List<Reward> getReward(Project project);

	/**
	 * 창작자 정보 불러오기
	 * @param project - 프로젝트 번호
	 * @return 창작자 정보
	 */
	public Member getSeller(Project project);

	/**
	 * 프로젝트 진행상황 불러오기
	 * @param projectNo - 프로젝트번호
	 * @return 진행상황
	 */
	public Project getStep(int projectNo);

	/**
	 * ck에디터 파일업로드
	 * @param file - 업로드 파일
	 * @return 이름,경로
	 */
	public String fileUpload(MultipartFile file);

	/**
	 * 대화가능 시간 변경
	 * @param project - 대화가능시간
	 */
	public void updateTalktime(Project project);

	/**
	 * 후원자 수 불러오기
	 * @param projectNo - 프로젝트 번호
	 * @return 후원자 수
	 */
	public int getContributors(int projectNo);

	/**
	 * 후원자 목록 불러오기
	 * @param payment - 프로젝트 번호
	 * @return 후원자 목록
	 */
	public List<Payment> getContributorsList(Payment payment);

	/**
	 * 최근소식 수정
	 * @param news - 최근소식 정보
	 */
	public void updateNews(ProjectNews news);

}
