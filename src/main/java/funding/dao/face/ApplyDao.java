package funding.dao.face;

import java.util.List;

import funding.dto.Project;
import funding.dto.Reward;

public interface ApplyDao {
	
	/**
	 * 프로젝트 최초 생성 
	 * 
	 * @param project
	 */
	public void projectInsert(Project project);
	
	
	/**
	 * 기본 리워드 생성 
	 * 
	 * @param projectNo
	 */
	public void insertDefaultReward(int projectNo);

	/**
	 * 입력하던 정보 불러오기
	 * 
	 * @param project
	 * @return project - 입력했던 프로젝트 정보
	 */
	public Project projectSelect(Project project);

	/**
	 * 입력했던 리워드 정보 불러오기
	 * 
	 * @param project
	 * @return list - 작성하던 리워드 정보
	 */
	public List<Reward> rewardSelect(Project project);
	
}
