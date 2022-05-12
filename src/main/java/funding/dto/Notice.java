package funding.dto;

import java.sql.Date;

public class Notice {
	private int fileNo;
	private int noticeNo;
	private String title;
	private String content;
	private String fileOrigin;
	private String fileStorage;
	private Date regDate;
	@Override
	public String toString() {
		return "Notice [fileNo=" + fileNo + ", noticeNo=" + noticeNo + ", title=" + title + ", content=" + content
				+ ", fileOrigin=" + fileOrigin + ", fileStorage=" + fileStorage + ", regDate=" + regDate + "]";
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileOrigin() {
		return fileOrigin;
	}
	public void setFileOrigin(String fileOrigin) {
		this.fileOrigin = fileOrigin;
	}
	public String getFileStorage() {
		return fileStorage;
	}
	public void setFileStorage(String fileStorage) {
		this.fileStorage = fileStorage;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}