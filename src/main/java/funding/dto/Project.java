package funding.dto;

import java.util.Date;

public class Project {
	
	private int projectNo;			// 프로젝트 번호
	private int memberNo;			// 회원번호
	private int categoryId;			// 카테고리 번호
	private String projectTitle;	// 프로젝트 제목
	private String projectIntro;	// 소개글(요약)
	private String budgetPlan;		// 프로젝트 예약 계획
	private String schedulePlan;	// 프로젝트 일정
	private String ProjectImage;	// 대표사진경로
	private int projectPrice;		// 목표금액
	private Date openDate;			// 프로젝트 오픈일
	private Date closeDate;			// 프로젝트 종료일
	private Date deliveryDate;		// 예상 배송시작일
	private String projectContent;	// 소개글 내용
	private int fundPrice; 			// 펀딩금액(현재)
	private String projectStep;		// 프로젝트 진행 단계
	
	
	@Override
	public String toString() {
		return "Project [projectNo=" + projectNo + ", memberNo=" + memberNo + ", categoryId=" + categoryId
				+ ", projectTitle=" + projectTitle + ", projectIntro=" + projectIntro + ", budgetPlan=" + budgetPlan
				+ ", schedulePlan=" + schedulePlan + ", ProjectImage=" + ProjectImage + ", projectPrice=" + projectPrice
				+ ", openDate=" + openDate + ", closeDate=" + closeDate + ", deliveryDate=" + deliveryDate
				+ ", projectContent=" + projectContent + ", fundPrice=" + fundPrice + ", projectStep=" + projectStep
				+ "]";
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
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
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
		return ProjectImage;
	}
	public void setProjectImage(String projectImage) {
		ProjectImage = projectImage;
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
	public String getProjectStep() {
		return projectStep;
	}
	public void setProjectStep(String projectStep) {
		this.projectStep = projectStep;
	}
	
	
}
