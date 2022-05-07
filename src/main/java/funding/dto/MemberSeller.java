package funding.dto;

public class MemberSeller {

	private int memberNo;
	private String bankName;
	private String accountNumber;
	private String accountName;
	private String sellerInfo;
	
	@Override
	public String toString() {
		return "MemberSeller [memberNo=" + memberNo + ", bankName=" + bankName + ", accountNumber=" + accountNumber
				+ ", accountName=" + accountName + ", sellerInfo=" + sellerInfo + "]";
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getSellerInfo() {
		return sellerInfo;
	}
	public void setSellerInfo(String sellerInfo) {
		this.sellerInfo = sellerInfo;
	}
	
	
	
}
