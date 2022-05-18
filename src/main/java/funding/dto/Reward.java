package funding.dto;

public class Reward {
	
	private int rewardNo;
	private int projectNo;
	private int rewardPrice;
	private int rewardAmount;
	private String rewardName;
	private String rewardIntro;
	private int rewardState;
	
	
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
