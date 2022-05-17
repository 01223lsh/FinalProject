package funding.dto;

public class Project {
	private int projectNo;
	private String projectTitle;
	@Override
	public String toString() {
		return "Project [projectNo=" + projectNo + ", projectTitle=" + projectTitle + "]";
	}
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public String getProjectTitle() {
		return projectTitle;
	}
	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}
}
