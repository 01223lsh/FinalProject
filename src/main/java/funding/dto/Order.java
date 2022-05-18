
package funding.dto;

import java.util.Date;

public class Order {
	
	private int orderNo;
	private int memberNo;
	private Date orderDate;
	private int orderStatus;
	private int addtionalFunding;
	private int totalPrice;
	private int rewardOrderNo;
	private int rewardNo;
	private int rewardCount;
	
	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", memberNo=" + memberNo + ", orderDate=" + orderDate + ", orderStatus="
				+ orderStatus + ", addtionalFunding=" + addtionalFunding + ", totalPrice=" + totalPrice
				+ ", rewardOrderNo=" + rewardOrderNo + ", rewardNo=" + rewardNo + ", rewardCount=" + rewardCount + "]";
	}
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
	public int getAddtionalFunding() {
		return addtionalFunding;
	}
	public void setAddtionalFunding(int addtionalFunding) {
		this.addtionalFunding = addtionalFunding;
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
	
	
	
	
	
}
