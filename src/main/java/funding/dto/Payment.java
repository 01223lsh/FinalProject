package funding.dto;


public class Payment {
	
	private int paymentNo;
	private int orderNo;
	private int projectNo;
	private String paymentCode;
	private String paymentTotal;
	private String paymentMethod;
	@Override
	public String toString() {
		return "Payment [paymentNo=" + paymentNo + ", orderNo=" + orderNo + ", projectNo=" + projectNo
				+ ", paymentCode=" + paymentCode + ", paymentTotal=" + paymentTotal + ", paymentMethod=" + paymentMethod
				+ "]";
	}
	public int getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public String getPaymentCode() {
		return paymentCode;
	}
	public void setPaymentCode(String paymentCode) {
		this.paymentCode = paymentCode;
	}
	public String getPaymentTotal() {
		return paymentTotal;
	}
	public void setPaymentTotal(String paymentTotal) {
		this.paymentTotal = paymentTotal;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	
}
