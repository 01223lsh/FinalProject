package funding.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import funding.dto.Project;
import funding.dto.Reward;

public interface ApplyService {
	
	/**
	 * 프로젝트 생성
	 * 
	 * @param project - 카테고리번호, 맴버번호가 저장된 객체
	 */
	public void categoryInsert(Project project);
	
	/**
	 * 제품 정보 불러오기
	 * 
	 * @param project
	 * @return project - 제품정보
	 */
	public Project projectSelect(int projectNo);

	/**
	 * 제품 정보 저장하기
	 * @param project
	 * @param file
	 */
	public void productUpdate(Project project, MultipartFile file);
	
	/**
	 * 리워드 정보 리스트
	 * 
	 * @param project
	 * @return list - 리워드 정보 리스트
	 */
	public List<Reward> rewardSelect(int projectNo);
	
	/**
	 * 계획 정보 저장하기
	 * 
	 * @param project
	 */
	public void planUpdate(Project project);
	
	/**
	 * 프로젝트 소개글 저장하기
	 * 
	 * @param project
	 */
	public void contentUpdate(Project project);
	
	/**
	 * ck에디터 사진 파일 저장
	 * 
	 * @param file
	 * @return
	 */
	public String fileUpload(MultipartFile file);
	
	/**
	 * 리워드 정보 입력
	 * 
	 * @param reward - 입력한 리워드 정보
	 */
	public void rewardInsert(Reward reward);
	
	/**
	 * 리워드 삭제
	 * 
	 * @param rewardNo - 삭제할 리워드 번호
	 */
	public void rewardDelete(int rewardNo);

	/**
	 * 프로젝트 신청
	 * 
	 * @param projectNo - 신청할 프로젝트 번호
	 */
	public void projectApply(int projectNo);
	
	/**
	 * 작성중인 프로젝트 불러오기
	 * 
	 * @param memberNo
	 * @return
	 */
	public List<Project> projectSelectAll(int memberNo);
	
	

}
