package funding.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import funding.dto.AdminMain;
import funding.dto.Alert;
import funding.dto.Category;
import funding.dto.Chart;
import funding.dto.Member;
import funding.dto.MemberSeller;
import funding.dto.Notice;
import funding.dto.NoticeFile;
import funding.dto.Project;
import funding.dto.ProjectComment;
import funding.dto.ProjectNews;
import funding.dto.Qna;
import funding.dto.Reward;
import funding.util.ApprovedPaging;
import funding.util.Paging;
import funding.util.ProjectPaging;

public interface AdminService {

	/**
	 * member 전체 조회
	 * 
	 * @param paging 페이징
	 * @return
	 */
	public List<Member> selectMemberAll(Paging paging);

	/**
	 * 회원 정보 불러옴
	 * @param member 회원 정보
	 * @return
	 */
	public Member selectBymemberNo(Member member);
	/**
	 * member 회원관리 페이징
	 * 
	 * @param paging 페이징
	 * @param i 회원 등급
	 * @param category 검색 카테고리
	 * @param content 검색 내용
	 * @return
	 */
	public Paging membergetPaging(Paging paging,int i, String category, String content);

	/**
	 *member 회원관리 등급별 페이징
	 *
	 * @param member 등급
	 * @param paging 페이징
	 * @return
	 */
	public List<Member> selectByGrade(Member member, Paging paging);

	/**
	 * 회원 등급 수정
	 * @param member 회원 정보
	 */
	public void gradeUpdate(Member member);

	/**
	 * member 검색
	 * 
	 * @param category 카테고리
	 * @param content 검색 내용
	 * @param paging 페이징
	 * @return
	 */
	public List<Member> MemberSearch(String category, String content, Paging paging);
	/**
	 *  비활성화 삭제
	 * 
	 * @param i 비활성화 넘버
	 */
	public void DisabledAllDelete(int i);

	/**
	 * 공지사항 페이징 리스트
	 * @param paging 페이징
	 * @return
	 */
	public List<Notice> noticeAll(Paging paging);

	/**
	 * 공지사항 페이징 개수
	 * @param paging 페이징
	 * @return
	 */
	public Paging getnoticePaging(Paging paging);

	/**
	 * 공지사항 내용
	 * @param notice 공지사항 정보
	 * @return
	 */
	public Notice selectByNotice(Notice notice);

	/**
	 * 공지사항 정보 추가
	 * @param notice 공지사항 정보
	 * @param filelist 공지사항 이미지 정보
	 */
	public void noticeWrite(Notice notice, List<MultipartFile> filelist);

	

	/**
	 * 공지사항 정보 수정
	 * @param notice 공지사항 정보
	 * @param filelist 공지사항 파일 추가 정보
	 * @param fileNolist 공지사항 파일 기존 정보
	 */
	public void noticeUpdate(Notice notice, List<MultipartFile> filelist, List<Integer> fileNolist);

	/**
	 * 공지사항 삭제
	 * @param notice 공지사항 정보
	 */
	public void noticeDelete(Notice notice);

	/**
	 * 공지사항 이미지 정보
	 * @param notice 공지사항 정보
	 * @return
	 */
	public List<NoticeFile> selectBtNoticeFile(Notice notice);

	/**
	 * 카테고리 별 or 전체 리스트 조회
	 * @param paging 페이징
	 * @param i 프로젝트 진행 단계
	 * @param category 카테고리 정보
	 * @return
	 */
	public List<Project> projectList(ProjectPaging paging, int i, Category category);
	
	/**
	 *  카테고리 별 or 전체 리스트 조회(페이징)
	 *  
	 * @param paging 페이징 개수
	 * @param i 프로젝트 진행 단계 개수
	 * @param category 카테고리 정보 개수
	 * @return
	 */
	public ProjectPaging getprojectPaging(ProjectPaging paging, int i, Category category);

	/**
	 * 공지사항 정보로 파일정보
	 * @param notice 공지사항 정보
	 * @return
	 */
	public List<NoticeFile> selectByNoticeFile(Notice notice);

	// create by young
	// project_step = 1, 심사 대기중인 프로젝트만 가져오는 메소드
    public List<Project> getWaitingProject(ApprovedPaging paging);

	// create by young
	// 프로젝트 심사 처리
	public int updateProjectStep(Project project, Alert alert);

	// create by young
	// 프로젝트 상세 내용 가져오기
	public Project getProject(Project project);

	/**
	 * 프로젝트 카테고리 번호, 이름
	 * @return 카테고리 정보 
	 */
	public List<Category> categoryList();
	// create by young
	public ApprovedPaging getapproveProjectpaging(ApprovedPaging paging);
	// create by young
	public Paging getQnaPaging(Paging paging, String complete);

	/**
	 * 문의게시판 리스트 목록 조회
	 * @param paging 페이징
	 * @param complete 답변 완/미
	 * @return 문의게시판 리스트 목록
	 */
	public List<Qna> Qnalist(Paging paging, String complete);

	/**
	 * 문의게시판 상세보기
	 * @param viewqna 문의사항 정보
	 * @return 문의사항 정보
	 */
	public Qna qnaview(Qna viewqna);

	/**
	 * 문의사항 삭제
	 * @param qna
	 */
	public void qnaDelete(Qna qna);

	/**
	 * 문의사항 답변 작성
	 * @param qna 문의사항 정보
	 */
	public void qnarewrite(Qna qna);

	/**
	 * 문의사항 답변 확인
	 * @return 문의사항 정보
	 */
	public List<Qna> Qnalist();

	/**
	 *  member 넘버로 사업자 정보 가져오기
	 * @param member 회원 정보
	 * @return 사업자 정보
	 */
	public MemberSeller selectBymemberSeller(Member member);

	/**
	 * member Date 정보 불러옴
	 * @param chart 
	 * @return member Date
	 */
	public List<Chart> selectByMemberDate(Chart chart);

	/**
	 * qnano로 qna정보 불러옴
	 * @param qna qna넘버
	 * @return qna 정보
	 */
	public Qna selectbyqnainfo(Qna qna);
	/**
	 * qna 작성 정보 갱신
	 */
	public void qnaUpdate(Qna qna);

	/**
	 * 관리자 페이지 첫페이지 보여줄 값 
	 * @return cnt
	 */
	public AdminMain memberAndProjectAllCnt();

	/**
	 * 카테고리 별 count
	 * @return 카테고리 명, count
	 */
	public List<AdminMain> categoryCntList();

	/**
	 * 메인페이지 공지사항 목록 조회
	 * @return 공지사항 리스트
	 */
	public List<Notice> mainNoticeAll();

	/**
	 * 메인페이지 문의게시판 목록 조회
	 * @return qna 목록
	 */
	public List<Qna> mainQnaAll();

	/**
	 * 프로젝트 주문 내역 확인 리스트
	 * @return 프로젝트 리스트
	 */
	public List<AdminMain> adminProjectList();

	/**
	 * 프로젝트 결제 내역 - 회원별로
	 * @return 회원별 결제 리스트
	 */
	public List<AdminMain> projectSelectPayment();

	/**
	 * 전일 금일 데이터 비교
	 * @return 전일 데이터
	 */
	public AdminMain selectCntAll();
	
	
	
	
	//최원석님 코드
	public Project getProject2(Project project);
	//최원석님 코드
	public Project getPlan(Project project);
	//최원석님 코드
	public List<ProjectNews> getNewsList(int projectNo);
	//최원석님 코드
	public Project getContent(int projectNo);
	//최원석님 코드
	public ProjectNews getNewsView(ProjectNews news);
	//최원석님 코드
	public Member getSeller(Project project);
	//최원석님 코드
	public Project getStep(Project project);
	//최원석님 코드
	public String fileUpload(MultipartFile file);

	public void deleteNews(ProjectNews news);

	public List<Reward> getReward(Project project);

	public List<ProjectComment> getCommentList(int projectNo);
	



}
