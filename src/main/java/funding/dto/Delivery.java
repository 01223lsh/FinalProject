package funding.dto;

public class Delivery {
	
	private int deliveryNo;
	private int orderNo;
	private String postalCode;
	private String addressDetail;
	private String recipientName;
	private String recipientPhone;
	private String precautions;
	@Override
	public String toString() {
		return "Delivery [deliveryNo=" + deliveryNo + ", orderNo=" + orderNo + ", postalCode=" + postalCode
				+ ", addressDetail=" + addressDetail + ", recipientName=" + recipientName + ", recipientPhone="
				+ recipientPhone + ", precautions=" + precautions + "]";
	}
	public int getDeliveryNo() {
		return deliveryNo;
	}
	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
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
