package funding.dto;

import java.util.Date;


import org.springframework.format.annotation.DateTimeFormat;


public class Project {
	
	private int projectNo;			// 프로젝트 번호
	private int memberNo;			// 회원번호
	private int categoryNo;			// 카테고리 번호
	private String projectTitle;	// 프로젝트 제목
	private String projectIntro;	// 소개글(요약)
	private String budgetPlan;		// 프로젝트 예산 계획
	private String schedulePlan;	// 프로젝트 일정
	private String projectImage;	// 대표사진경로
	private int projectPrice;		// 목표금액
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date openDate;			// 프로젝트 오픈일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date closeDate;			// 프로젝트 종료일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date deliveryDate;		// 예상 배송시작일
	private String projectContent;	// 소개글 내용
	private int fundPrice; 			// 펀딩금액(현재)
	private int projectStep;		// 프로젝트 진행 단계
	private int sum;				// 현재 모집된 총 금액
	private String talkTime;		// 판매자 채팅 가능 시간
	
	private int rnum;
	@Override
	public String toString() {
		return "Project [projectNo=" + projectNo + ", memberNo=" + memberNo + ", categoryNo=" + categoryNo
				+ ", projectTitle=" + projectTitle + ", projectIntro=" + projectIntro + ", budgetPlan=" + budgetPlan
				+ ", schedulePlan=" + schedulePlan + ", projectImage=" + projectImage + ", projectPrice=" + projectPrice
				+ ", openDate=" + openDate + ", closeDate=" + closeDate + ", deliveryDate=" + deliveryDate
				+ ", projectContent=" + projectContent + ", fundPrice=" + fundPrice + ", projectStep=" + projectStep
				+ ", sum=" + sum + ", talkTime=" + talkTime + ", rnum=" + rnum + "]";
	}


	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
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





	public int getCategoryNo() {
		return categoryNo;
	}





	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}





	public String getProjectTitle() {
		return projectTitle;
	}





	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}





	public String getProjectIntro() {
		return projectIntro;
	}





	public void setProjectIntro(String projectIntro) {
		this.projectIntro = projectIntro;
	}





	public String getBudgetPlan() {
		return budgetPlan;
	}





	public void setBudgetPlan(String budgetPlan) {
		this.budgetPlan = budgetPlan;
	}





	public String getSchedulePlan() {
		return schedulePlan;
	}





	public void setSchedulePlan(String schedulePlan) {
		this.schedulePlan = schedulePlan;
	}





	public String getProjectImage() {
		return projectImage;
	}





	public void setProjectImage(String projectImage) {
		this.projectImage = projectImage;
	}





	public int getProjectPrice() {
		return projectPrice;
	}





	public void setProjectPrice(int projectPrice) {
		this.projectPrice = projectPrice;
	}





	public Date getOpenDate() {
		return openDate;
	}





	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}





	public Date getCloseDate() {
		return closeDate;
	}





	public void setCloseDate(Date closeDate) {
		this.closeDate = closeDate;
	}





	public Date getDeliveryDate() {
		return deliveryDate;
	}





	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}





	public String getProjectContent() {
		return projectContent;
	}





	public void setProjectContent(String projectContent) {
		this.projectContent = projectContent;
	}





	public int getFundPrice() {
		return fundPrice;
	}


	public void setFundPrice(int fundPrice) {
		this.fundPrice = fundPrice;
	}



	public int getProjectStep() {
		return projectStep;
	}


	public void setProjectStep(int projectStep) {
		this.projectStep = projectStep;
	}

	public int getSum() {
		return sum;
	}



	public void setSum(int sum) {
		this.sum = sum;
	}


	public String getTalkTime() {
		return talkTime;
	}


	public void setTalkTime(String talkTime) {
		this.talkTime = talkTime;
	}
	
}

