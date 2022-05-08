package funding.dto;

public class OrderRewardMapping {
	
	//다대다관계 테이블 관계에 대한 DTO
	private int rewardOrderNo;
	private int orderNo;
	private int rewardNo;
	private int rewardCount;
	@Override
	public String toString() {
		return "OrderRewardMapping [rewardOrderNo=" + rewardOrderNo + ", orderNo=" + orderNo + ", rewardNo=" + rewardNo
				+ ", rewardCount=" + rewardCount + "]";
	}
	public int getRewardOrderNo() {
		return rewardOrderNo;
	}
	public void setRewardOrderNo(int rewardOrderNo) {
		this.rewardOrderNo = rewardOrderNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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
}
