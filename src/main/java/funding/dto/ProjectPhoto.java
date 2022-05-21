package funding.dto;

public class ProjectPhoto {

	private int photoNo;		// 첨부사진 번호
	private int projectNo;		// 프로젝트 번호
	private String photoName;	// 원본파일명
	private String photoUpdate;	// 수정 파일명
	private String photoPath;	// 파일경로
	
	@Override
	public String toString() {
		return "projectPhoto [photoNo=" + photoNo + ", projectNo=" + projectNo + ", photoName=" + photoName
				+ ", photoUpdate=" + photoUpdate + ", photoPath=" + photoPath + "]";
	}
	
	public int getPhotoNo() {
		return photoNo;
	}
	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getPhotoUpdate() {
		return photoUpdate;
	}
	public void setPhotoUpdate(String photoUpdate) {
		this.photoUpdate = photoUpdate;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	
}
