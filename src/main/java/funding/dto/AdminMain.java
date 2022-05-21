package funding.dto;

import java.sql.Date;

public class AdminMain {
	private int normalCnt;
	private int buisnessCnt;
	private int disabledCnt;
	private int userAllCnt;
	private int approvedCnt;
	private int waitingCnt;
	private int proceedingCnt;
	private int projectAllCnt;
	private int categoryCnt;
	private String categoryName;
	private int projectNo;
	private String projectTitle;
	private int paymentTotal;
	private int projectPrice;
	private int memberNo;
	private String id;
	private String nick;
	private String email;
	private Date orderDate;
	private Date regDate;
	
	
	@Override
	public String toString() {
		return "AdminMain [normalCnt=" + normalCnt + ", buisnessCnt=" + buisnessCnt + ", disabledCnt=" + disabledCnt
				+ ", userAllCnt=" + userAllCnt + ", approvedCnt=" + approvedCnt + ", waitingCnt=" + waitingCnt
				+ ", proceedingCnt=" + proceedingCnt + ", projectAllCnt=" + projectAllCnt + ", categoryCnt="
				+ categoryCnt + ", categoryName=" + categoryName + ", projectNo=" + projectNo + ", projectTitle="
				+ projectTitle + ", paymentTotal=" + paymentTotal + ", projectPrice=" + projectPrice + ", memberNo="
				+ memberNo + ", id=" + id + ", nick=" + nick + ", email=" + email + ", orderDate=" + orderDate
				+ ", regDate=" + regDate + "]";
	}
	
	

	public Date getRegDate() {
		return regDate;
	}



	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}



	public int getMemberNo() {
		return memberNo;
	}



	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getNick() {
		return nick;
	}



	public void setNick(String nick) {
		this.nick = nick;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public Date getOrderDate() {
		return orderDate;
	}



	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}



	public int getProjectPrice() {
		return projectPrice;
	}


	public void setProjectPrice(int projectPrice) {
		this.projectPrice = projectPrice;
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


	public int getPaymentTotal() {
		return paymentTotal;
	}


	public void setPaymentTotal(int paymentTotal) {
		this.paymentTotal = paymentTotal;
	}


	public int getCategoryCnt() {
		return categoryCnt;
	}


	public void setCategoryCnt(int categoryCnt) {
		this.categoryCnt = categoryCnt;
	}


	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getNormalCnt() {
		return normalCnt;
	}
	public void setNormalCnt(int normalCnt) {
		this.normalCnt = normalCnt;
	}
	public int getBuisnessCnt() {
		return buisnessCnt;
	}
	public void setBuisnessCnt(int buisnessCnt) {
		this.buisnessCnt = buisnessCnt;
	}
	public int getDisabledCnt() {
		return disabledCnt;
	}
	public void setDisabledCnt(int disabledCnt) {
		this.disabledCnt = disabledCnt;
	}
	public int getUserAllCnt() {
		return userAllCnt;
	}
	public void setUserAllCnt(int userAllCnt) {
		this.userAllCnt = userAllCnt;
	}
	public int getApprovedCnt() {
		return approvedCnt;
	}
	public void setApprovedCnt(int approvedCnt) {
		this.approvedCnt = approvedCnt;
	}
	public int getWaitingCnt() {
		return waitingCnt;
	}
	public void setWaitingCnt(int waitingCnt) {
		this.waitingCnt = waitingCnt;
	}
	
	public int getProceedingCnt() {
		return proceedingCnt;
	}
	public void setProceedingCnt(int proceedingCnt) {
		this.proceedingCnt = proceedingCnt;
	}
	public int getProjectAllCnt() {
		return projectAllCnt;
	}
	public void setProjectAllCnt(int projectAllCnt) {
		this.projectAllCnt = projectAllCnt;
	}
	
	
	
	

}
