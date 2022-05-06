package funding.dto;

public class Reward {
	
	private int rewardNo;		// 리워드 번호
	private int projectNo;		// 프로젝트 번호
	private int rewardPrice;	// 리워드 가격
	private int rewardAmount;	// 리워드 남은갯수
	private String rewardName;	// 품목명
	private String rewardIntro;	// 품목설명
	private int rewardState;	// 제품 포함 여부

	@Override
	public String toString() {
		return "Reward [rewardNo=" + rewardNo + ", projectNo=" + projectNo + ", rewardPrice=" + rewardPrice
				+ ", rewardAmount=" + rewardAmount + ", rewardName=" + rewardName + ", rewardIntro=" + rewardIntro
				+ ", rewardState=" + rewardState + "]";
	}

	public int getRewardNo() {
		return rewardNo;
	}

	public void setRewardNo(int rewardNo) {
		this.rewardNo = rewardNo;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public int getRewardPrice() {
		return rewardPrice;
	}

	public void setRewardPrice(int rewardPrice) {
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

	
}
