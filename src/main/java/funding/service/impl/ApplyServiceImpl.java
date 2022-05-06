package funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funding.dao.face.ApplyDao;
import funding.dto.Project;
import funding.dto.Reward;
import funding.service.face.ApplyService;

@Service
public class ApplyServiceImpl implements ApplyService{
	
	@Autowired
	ApplyDao applyDao;
	
	@Override
	public void categoryInsert(Project project) {
		
		//프로젝트 생성
//		System.out.println("프로젝트 db저장 전 매개변수 주소값: " + project);
		
		Project project1 = project;
		
		applyDao.projectInsert(project);
		
		System.out.println("주소 비교값: " + project1.equals(project));
		
//		System.out.println("프로젝트 db저장 후 매개변수 주소값: " + project);

		System.out.println("프로젝트 생성 후 객체값: " + project.toString());
		
		//프로젝트에 기본 리워드 추가
		int projectNo = project.getProjectNo();

		applyDao.insertDefaultReward(projectNo);
		
	}
	
	
	@Override
	public Project projectSelect(Project project) {
		
		//프로젝트 정보 불러오기
		return applyDao.projectSelect(project);
		
	}
	
	
	@Override
	public List<Reward> rewardSelect(Project project) {
		
		//리워드 정보 불러오기
		return applyDao.rewardSelect(project);
	}
	
	
}
