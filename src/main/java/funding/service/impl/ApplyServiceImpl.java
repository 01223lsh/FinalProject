package funding.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import funding.dao.face.ApplyDao;
import funding.dto.Project;
import funding.dto.Reward;
import funding.service.face.ApplyService;

@Service
public class ApplyServiceImpl implements ApplyService{
	
	@Autowired
	ApplyDao applyDao;
	
	@Autowired 
	private ServletContext context;
	
	@Override
	public void categoryInsert(Project project) {
		
		//프로젝트 생성
//		System.out.println("프로젝트 db저장 전 매개변수 주소값: " + project);
		
//		Project project1 = project;
		
		applyDao.projectInsert(project);
		
//		System.out.println("주소 비교값: " + project1.equals(project));
		
//		System.out.println("프로젝트 db저장 후 매개변수 주소값: " + project);

		System.out.println("프로젝트 생성 후 객체값: " + project.toString());
		
		//프로젝트에 기본 리워드 추가
		int projectNo = project.getProjectNo();

		applyDao.insertDefaultReward(projectNo);
		
	}
	
	
	@Override
	public Project projectSelect(int projectNo) {
		
		//프로젝트 정보 불러오기
		return applyDao.projectSelect(projectNo);
		
	}
	
	@Override
	public void productUpdate(Project project, MultipartFile file) {
		
		
		//대표 이미지 업로드
		if(file != null && file.getSize() != 0 ) {

			//파일이 저장될 경로
			String storedPath = context.getRealPath("projectImage");
			File storedFolder = new File(storedPath);
			if( !storedFolder.exists() ) {
				storedFolder.mkdir();
			}
	
			//파일이 저장될 이름
			String originName = file.getOriginalFilename();
			String storedName = UUID.randomUUID().toString().split("-")[4] + originName ;
			
			//저장될 파일 정보 객체
			File dest = new File(storedFolder, storedName);
	
			try {
				file.transferTo(dest);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
	
			//-----------------------------------------------------
	
	//		ProjectPhoto projectPhoto = new ProjectPhoto();
	//		project.getProjectPhoto().setProjectNo(project.getProjectNo());
	//		boardFile.setBoardNo( board.getBoardNo() );
	//		project.getProjectPhoto().setPhotoName(originName);
	//		boardFile.setOriginName(originName);
	//		project.getProjectPhoto().setPhotoUpdate(storedName);
	//		boardFile.setStoredName(storedName);
			
			
			//대표이미지값 객체에 저장
			project.setProjectImage("/projectImage/" + storedName);
		}
		
		System.out.println(project);
		
		//제품 정보 입력하기
		applyDao.productUpdate(project);
		
	}
	
	@Override
	public void planUpdate(Project project) {
		
		//계획정보 저장하기
		applyDao.planUpdate(project);
	}
	
	@Override
	public void contentUpdate(Project project) {

		//제품 정보 저장하기
		applyDao.contentUpdate(project);

//		//컨텐트 이미지 업로드
//		if(file != null && file.getSize() != 0 ) {
//
//			//파일이 저장될 경로
//			String storedPath = context.getRealPath("projectPhoto");
//			File storedFolder = new File(storedPath);
//			if( !storedFolder.exists() ) {
//				storedFolder.mkdir();
//			}
//	
//			//파일이 저장될 이름
//			String originName = file.getOriginalFilename();
//			String storedName = UUID.randomUUID().toString().split("-")[4] + originName ;
//			
//			//저장될 파일 정보 객체
//			File dest = new File(storedFolder, storedName);
//	
//			try {
//				file.transferTo(dest);
//			} catch (IllegalStateException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			
//			
//			project.getProjectPhoto().setPhotoNo();
//			boardFile.setBoardNo(board.getBoardNo());
//			boardFile.setOriginName(originName);
//			boardFile.setStoredName(storedName);
//			
//			boardDao.insertFile(boardFile);
//			
////			//소개글 + 파일 값 객체에 저장
////			project.setProjectImage("/projectImage/" + storedName);
//		}
		
		System.out.println(project);
		
	}
	
	@Override
	public String fileUpload(MultipartFile file) {
		
		//ck에디터 사진 파일 저장
		
		// 파일 저장 경로 생성
		String storedPath = context.getRealPath("projectPhoto");
		File storedFolder = new File(storedPath);
		if (storedFolder.exists()) {
		storedFolder.mkdir();
		}
		// 저장 파일 이름 생성
		String fileName = UUID.randomUUID().toString().split("-")[4] + file.getOriginalFilename();
		// 업로드 파일 객체 생성
		File dest = new File(storedFolder, fileName);
		// 파일 업로드
		try {
		file.transferTo(dest);
		} catch (IOException e) {
		e.printStackTrace();
		}
		return fileName;
	
	}
	
	
	@Override
	public List<Reward> rewardSelect(int projectNo) {
		
		//리워드 정보 불러오기
		return applyDao.rewardSelect(projectNo);
	}
	
	@Override
	public void rewardInsert(Reward reward) {
		
		//리워드 정보 입력하기
		applyDao.rewardInsert(reward);
	}
	
	@Override
	public void rewardDelete(int rewardNo) {
		
		//리워드 삭제하기
		applyDao.rewardDelete(rewardNo);
	}
	
	@Override
	public void projectApply(int projectNo) {
		
		//프로젝트 신청하기
		applyDao.projectApply(projectNo);
		
		//채팅방 생성하기
		applyDao.chatRoomInsert(projectNo);
	}
	
	
	
}
