package funding.dto;

import java.util.Date;

public class JoinFunding {
	
	//project
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
	private int projectStep;		// 프로젝트 진행 단계
	
	//order
	private int orderNo;
//	private int memberNo;
	private Date orderDate;
	private int orderStatus;
	private int additionalFunding;
	private int totalPrice;
	private int rewardOrderNo;
	private int rewardNo;
	private int rewardCount;
	
	//reward
//	private int rewardNo;
//	private int projectNo;
	private String rewardPrice;
	private int rewardAmount;
	private String rewardName;
	private String rewardIntro;
	private int rewardState;

	//reward-order
//	private int rewardOrderNo;
//	private int orderNo;
//	private int rewardNo;
//	private int rewardCount;
	
	//category
	private int categoryNo;
	private String categoryName;
	
	//delivery
	private int deliveryNo;
//	private int orderNo;
	private String postalCode;
	private String address;
	private String addressDetail;
	private String addressExtra;
	private String recipientName;
	private String recipientPhone;
	private String precautions;
	
	
	
	
	
	@Override
	public String toString() {
		return "JoinFunding [projectNo=" + projectNo + ", memberNo=" + memberNo + ", categoryId=" + categoryId
				+ ", projectTitle=" + projectTitle + ", projectIntro=" + projectIntro + ", budgetPlan=" + budgetPlan
				+ ", schedulePlan=" + schedulePlan + ", ProjectImage=" + ProjectImage + ", projectPrice=" + projectPrice
				+ ", openDate=" + openDate + ", closeDate=" + closeDate + ", deliveryDate=" + deliveryDate
				+ ", projectContent=" + projectContent + ", fundPrice=" + fundPrice + ", projectStep=" + projectStep
				+ ", orderNo=" + orderNo + ", orderDate=" + orderDate + ", orderStatus=" + orderStatus
				+ ", additionalFunding=" + additionalFunding + ", totalPrice=" + totalPrice + ", rewardOrderNo="
				+ rewardOrderNo + ", rewardNo=" + rewardNo + ", rewardCount=" + rewardCount + ", rewardPrice="
				+ rewardPrice + ", rewardAmount=" + rewardAmount + ", rewardName=" + rewardName + ", rewardIntro="
				+ rewardIntro + ", rewardState=" + rewardState + ", categoryNo=" + categoryNo + ", categoryName="
				+ categoryName + ", deliveryNo=" + deliveryNo + ", postalCode=" + postalCode + ", address=" + address
				+ ", addressDetail=" + addressDetail + ", addressExtra=" + addressExtra + ", recipientName="
				+ recipientName + ", recipientPhone=" + recipientPhone + ", precautions=" + precautions + "]";
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
	public int getProjectStep() {
		return projectStep;
	}
	public void setProjectStep(int projectStep) {
		this.projectStep = projectStep;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
	public int getAdditionalFunding() {
		return additionalFunding;
	}
	public void setAdditionalFunding(int additionalFunding) {
		this.additionalFunding = additionalFunding;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getRewardOrderNo() {
		return rewardOrderNo;
	}
	public void setRewardOrderNo(int rewardOrderNo) {
		this.rewardOrderNo = rewardOrderNo;
	}
	public int getRewardNo() {
		return rewardNo;
	}
	public void setRewardNo(int rewardNo) {
		this.rewardNo = rewardNo;
	}
	public int getRewardCount() {
		return rewardCount;
	}
	public void setRewardCount(int rewardCount) {
		this.rewardCount = rewardCount;
	}
	public String getRewardPrice() {
		return rewardPrice;
	}
	public void setRewardPrice(String rewardPrice) {
		this.rewardPrice = rewardPrice;
	}
	public int getRewardAmount() {
		return rewardAmount;
	}
	public void setRewardAmount(int rewardAmount) {
		this.rewardAmount = rewardAmount;
	}
	public String getRewardName() {
		return rewardName;
	}
	public void setRewardName(String rewardName) {
		this.rewardName = rewardName;
	}
	public String getRewardIntro() {
		return rewardIntro;
	}
	public void setRewardIntro(String rewardIntro) {
		this.rewardIntro = rewardIntro;
	}
	public int getRewardState() {
		return rewardState;
	}
	public void setRewardState(int rewardState) {
		this.rewardState = rewardState;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getDeliveryNo() {
		return deliveryNo;
	}
	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getAddressExtra() {
		return addressExtra;
	}
	public void setAddressExtra(String addressExtra) {
		this.addressExtra = addressExtra;
	}
	public String getRecipientName() {
		return recipientName;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}
	public String getRecipientPhone() {
		return recipientPhone;
	}
	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}
	public String getPrecautions() {
		return precautions;
	}
	public void setPrecautions(String precautions) {
		this.precautions = precautions;
	}
	
	
	
	
	
	
}
