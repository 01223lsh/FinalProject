package funding.dto;


import java.util.Date;

public class Alert {
	  
	private int alertNo;
	private int memberNo;
	private String alertContent;
	private int alertRead;
	private Date alertDate;

	@Override
	public String toString() {
		return "Alert [alertNo=" + alertNo + ", memberNo=" + memberNo + ", alertContent=" + alertContent
				+ ", alertRead=" + alertRead + ", alertDate=" + alertDate + "]";
	}


	public int getAlertNo() {
		return alertNo;
	}

	public void setAlertNo(int alertNo) {
		this.alertNo = alertNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getAlertContent() {
		return alertContent;
	}

	public void setAlertContent(String alertContent) {
		this.alertContent = alertContent;
	}

	public int getAlertRead() {
		return alertRead;
	}

	public void setAlertRead(int alertRead) {
		this.alertRead = alertRead;
	}

	public Date getAlertDate() {
		return alertDate;
	}

	public void setAlertDate(Date alertDate) {
		this.alertDate = alertDate;
	}
	
}
