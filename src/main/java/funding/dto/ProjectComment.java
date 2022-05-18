package funding.dto;

import java.util.Date;

public class ProjectComment {

	private int commentNo;
	private int projectNo;
	private String commentContent;
	private String commentWriter;
	private Date commentDate;
	private int memberNo;
	
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentWriter() {
		return commentWriter;
	}
	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	@Override
	public String toString() {
		return "ProjectComment [commentNo=" + commentNo + ", projectNo=" + projectNo + ", commentContent="
				+ commentContent + ", commentWriter=" + commentWriter + ", commentDate=" + commentDate + ", memberNo="
				+ memberNo + "]";
	}
	
	
	
}
