package funding.dto;

import java.util.Date;

public class Order {
	
	//1. 주문 - 리워드 매핑 테이블의 관한 DTO는 따로 생성? 
	//2. 주문 테이블 DTO에 포함? 
	private int orderNo;
	private int memberNo;
	private Date orderDate;
	private int orderStatus;
	private int addtionalFunding;
	private int totalPrice;
	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", memberNo=" + memberNo + ", orderDate=" + orderDate + ", orderStatus="
				+ orderStatus + ", addtionalFunding=" + addtionalFunding + ", totalPrice=" + totalPrice + "]";
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
	
}
