package funding.dto;

import java.util.Date;

public class ProjectNews {

	private int newsNo;
	private int projectNo;
	private String newsTitle;
	private String newsContent;
	private Date newsDate;
	
	
	public int getNewsNo() {
		return newsNo;
	}
	public void setNewsNo(int newsNo) {
		this.newsNo = newsNo;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	public Date getNewsDate() {
		return newsDate;
	}
	public void setNewsDate(Date newsDate) {
		this.newsDate = newsDate;
	}
	
	@Override
	public String toString() {
		return "News [newsNo=" + newsNo + ", projectNo=" + projectNo + ", newsTitle=" + newsTitle + ", newsContent="
				+ newsContent + ", newsDate=" + newsDate + "]";
	}
	
	
}
