package funding.dto;

import java.util.Date;

public class Project {
	private int projectNo;
	private int memberNo;
	private int categoryNo;
	private String projectTitle;
	private String projectIntro;
	private String budgetPlan;
	private String schedulePlan;
	private String projectImage;
	private int projectPrice;
	private Date openDate;
	private Date closeDate;
	private Date deliveryDate;
	private String projectContent;
	private int fundPrice;
	private int projectStep;
	private int sum;
	
	@Override
	public String toString() {
		return "Project [projectNo=" + projectNo + ", memberNo=" + memberNo + ", categoryNo=" + categoryNo
				+ ", projectTitle=" + projectTitle + ", projectIntro=" + projectIntro + ", budgetPlan=" + budgetPlan
				+ ", schedulePlan=" + schedulePlan + ", projectImage=" + projectImage + ", projectPrice=" + projectPrice
				+ ", openDate=" + openDate + ", closeDate=" + closeDate + ", deliveryDate=" + deliveryDate
				+ ", projectContent=" + projectContent + ", fundPrice=" + fundPrice + ", projectStep=" + projectStep
				+ ", sum=" + sum + "]";
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
	
	
}
