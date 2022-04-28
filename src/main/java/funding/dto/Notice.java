package funding.dto;

import java.sql.Date;

public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticefileOrigin;
	private String noticefileStorage;
	private Date noticeDate;
	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticefileOrigin=" + noticefileOrigin + ", noticefileStorage=" + noticefileStorage
				+ ", noticeDate=" + noticeDate + "]";
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticefileOrigin() {
		return noticefileOrigin;
	}
	public void setNoticefileOrigin(String noticefileOrigin) {
		this.noticefileOrigin = noticefileOrigin;
	}
	public String getNoticefileStorage() {
		return noticefileStorage;
	}
	public void setNoticefileStorage(String noticefileStorage) {
		this.noticefileStorage = noticefileStorage;
	}
	
	

}
