package funding.dto;

public class Project {
	private int projectNo;
	private int memberNo;
	private String projectTitle;
	
	@Override
	public String toString() {
		return "Project [projectNo=" + projectNo + ", memberNo=" + memberNo + ", projectTitle=" + projectTitle + "]";
	}
	
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getProjectTitle() {
		return projectTitle;
	}
	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}	
	
	
	

}
