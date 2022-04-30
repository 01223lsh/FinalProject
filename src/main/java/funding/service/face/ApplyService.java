package funding.service.face;

import java.util.List;

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
	public Project projectSelect(Project project);

	
	/**
	 * 리워드 정보 리스트
	 * 
	 * @param project
	 * @return list - 리워드 정보 리스트
	 */
	public List<Reward> rewardSelect(Project project);

}
