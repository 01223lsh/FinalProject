package funding.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import funding.dto.Category;
import funding.dto.Member;
import funding.dto.Notice;
import funding.dto.NoticeFile;
import funding.dto.Project;
import funding.dto.Qna;
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
    List<Project> findAllWaitingProject(Paging paging);

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
	public int selectCntapproveProject(Paging paging);

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


}
