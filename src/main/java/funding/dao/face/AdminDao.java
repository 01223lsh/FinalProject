package funding.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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

public interface AdminDao {
	
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
	public Member selectBymemberNo(int i);

	/**
	 * 회원 정보 리스트 개수
	 * @return 회원 정보 개수
	 */
	public int selectCntMember();

	/**
	 * 회원 정보 등급 리스트 개수
	 * @param i 등급
	 * @return 회원 정보 등급 개수
	 */
	public int selectCntMemberGrade(int i);

	/**
	 * 회원 정보 등급 리스트
	 * @param grade 등급
	 * @param paging 페이징
	 * @return 리스트
	 */
	public List<Member> selectByGrade(@Param("grade")int grade,@Param("paging") Paging paging);

	/**
	 * 회원 정보(등급) 수정
	 * @param member 회원 정보
	 */
	public void gradeUpdate(Member member);

	/**
	 * 멤버 검색
	 * @param category 카테고리
	 * @param content 검색 내용
	 * @param paging 페이징(개수)
	 * @return 검색 후 멤버 정보
	 */
	public List<Member> MemberSearch(@Param("category")String category, @Param("content")String content,@Param("paging") Paging paging);

	/**
	 *  멤버 검색 페이징 개수
	 * @param category 카테고리
	 * @param content 검색 내용
	 * @return 개수
	 */
	public int selectCntMemberSearch(@Param("category")String category,@Param("content") String content);

	/**
	 * 비활성화 멤버 정보 삭제
	 * @param i 비활성화 등급 번호 - 3
	 */
	public void DisabledAllDelete(int i);

	/**
	 * 공지사항 개수
	 * 
	 * @return 공지시항 개수
	 */
	public int selectCntNotice();
	/**
	 * 공지사항 리스트 목록(페이징)
	 * @param paging 페이징
	 * @return 공지사항 리스트
	 */
	public List<Notice> noticeAll(Paging paging);
	
	/**
	 * 공지사항 정보 상세보기
	 * 
	 * @param notice 공지사항 넘버
	 * @return  공지사항 정보
	 */
	public Notice selectByNotice(Notice notice);
	
	/**
	 * 공지사항 번호 찾기?
	 * @return 공지사항 번호
	 */
	public int selectBynoticeno();

	/**
	 * 공지사항 작성하기
	 * @param notice 입력한 정보
	 */
	public void noticeWrite(Notice notice);


//	public NoticeFile selectByNoticeFile(NoticeFile noticeFile);

	/**
	 *  공지사항 파일 정보 찾기
	 * @param notice 공지사항 넘버
	 * @return 공지사항 파일 정보
	 */
	public Notice selectNoticeFileByFileNo(Notice notice);

	/**
	 * 공지사항 수정
	 * @param notice 수정할 내용
	 */
	public void noticeUpdate(Notice notice);
	/**
	 * 공지사항 파일 등록
	 * @param notice 파일 정보
	 */
	public void insertNoticeFile(Notice notice);

	/**
	 * 공지사항 삭제
	 * @param notice 공지사항 정보
	 */
	public void noticeDelete(Notice notice);

	/**
	 * 공지사항 파일 삭제
	 * @param notice 공지사항 파일 정보
	 */
	public void noticeFileDelete(Notice notice);

	/**
	 * 공지사항 파일 정보 리스트
	 * @param notice 공지사항 정보(넘버)
	 * @return 공지사항 파일 리스트
	 */
	public List<NoticeFile> selectByNoticeFile(Notice notice);

	/**
	 * 공지사항 수정 시 넘어오지 않는 정보를 제외한 파일 삭제
	 * @param notice 공지사항 번호
	 * @param fileNolist 공지사항 파일 넘버
	 */
	public void fileNoByDelete(@Param("notice")Notice notice,@Param("fileNolist") List<Integer> fileNolist);

	/**
	 * 프로젝트 리스트 페이징
	 * @param paging 페이징
	 * @param step 진행 단계
	 * @param categoryNo 카테고리 넘버
	 * @return 프로젝트 리스트 정보
	 */
	public List<Project> projectList(@Param("paging") ProjectPaging paging, @Param("step")int step,@Param("categoryNo") int categoryNo);

	/**
	 * 프로젝트 페이징 개수
	 * @param step 진행 단계
	 * @param categoryNo 카테고리 넘버
	 * @return 프로젝트 리스트 개수
	 */
	public int selectCntProject(@Param("step")int step,@Param("categoryNo") int categoryNo);

	// create by young
	// DB 에서 심사대기중인 프로젝트 가져오기
    List<Project> findAllWaitingProject(ApprovedPaging paging);

	// create by young
	// 프로젝트 상태 업데이트
	int updateProjectStep(Project project);

	// create by young
	// 프로젝트 상세 내용 조회
	Project findByNo(Project project);

	/**
	 * 프로젝트 카테고리 정보 리스트
	 * @return 프로젝트 카테고리 정보 리스트
	 */
	public List<Category> categoryList();

	/**
	 * 프로젝트 승인 페이지 페이징
	 * @param paging 페이징
	 * @return 프로젝트 승인 리스트
	 */
	public int selectCntapproveProject(ApprovedPaging paging);

	/**
	 * 문의 게시판 리스트 개수
	 * @param complete 답변 / 미답변
	 * @return 문의 게시판 리스트 개수
	 */
	public int selectCntQna(String complete);

	/**
	 * 문의게시판 전체 리스트 
	 * @param paging 페이징
	 * @return 문의게시판 리스트
	 */
	public List<Qna> qnaAll(Paging paging);

	/**
	 * 문의게시판 리스트 목록 조회
	 * @param paging 페이징
	 * @param complete 답변 완/미
	 * @return 문의게시판 리스트 목록
	 */
	public List<Qna> selectQnaList(@Param("paging")Paging paging, @Param("complete")String complete);

	/**
	 * 문의게시판 상세보기
	 * @param viewqna 문의게시판 넘버
	 * @return 문의게시판 정보
	 */
	public Qna selectByQnaNo(Qna viewqna);

	/**
	 * 문의게시판 삭제
	 * @param qna 삭제할 문의게시판 정보
	 */
	public void deleteQna(Qna qna);

	/**
	 * 문의게시판 답변?????
	 * @param qna 답변 정보????
	 */
	public void updateQnaAll(Qna qna);

	/**
	 * 문의게시판 답변 등록
	 * @param qna 문의게시판 답변 정보
	 */
	public void insertQnare(Qna qna);

	/**
	 * 문의게시판 답변 / 미답변 구분
	 * @return 문의게시판 미답변 정보
	 */
	public List<Qna> selectQnaListStep();

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
	 * @param qna 문의글 내용
	 */
	public void qnaUpdate(Qna qna);

	/**
	 * 프로젝트 승인 및 거절
	 * @param alert 알람 정보
	 */
	public void insertAlert(Alert alert);

	/**
	 * 문의사항 답변 alert
	 * @param qna 정보
	 */
	public void insertqnaAlert(Qna qna);

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
	/**
	 * 프로젝트 유저 번호로 유저 판매정보 및 유저 정보 가져오기
	 * @param result 프로젝트 정보
	 * @return 유저정보(사업자 포함)
	 */
	public MemberSeller getBuisnessInfo(Project result);
	
	/**
	 * 멤버 사업자를 삭제합니다.
	 * @param i
	 */
	public void DisabledAllDeleteSeller(int i);
	
	
	
	//최원석님 코드
	public Project selectProject(Project project);
	//최원석님 코드
	public Project selectPlan(Project project);
	//최원석님 코드
	public List<ProjectNews> selectNewsList(int projectNo);
	
	//최원석님 코드
	public Project selectContent(int projectNo);
	//최원석님 코드
	public ProjectNews selectNewsView(ProjectNews news);

	//최원석님 코드
	public Member selectSeller(Project project);
	//최원석님 코드
	public Project selectStep(Project project);

	//최원석님 코드
	public void deleteNews(ProjectNews news);

	//최원석님 코드
	public List<Reward> selectRewardList(Project project);

	//최원석님 코드
	public List<ProjectComment> selectCommentList(int projectNo);







}
