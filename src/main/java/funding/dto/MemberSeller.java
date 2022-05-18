
package funding.dto;

public class MemberSeller {
	
	private int sellerNo;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String nick;
	private String phone;
	private int grade;
	private String bankName;
	private String accountNumber;
	private String accountName;
	private String sellerInfo;
	
	@Override
	public String toString() {
		return "Member_Seller [sellerNo=" + sellerNo + ", id=" + id + ", pw=" + pw + ", name=" + name + ", email="
				+ email + ", nick=" + nick + ", phone=" + phone + ", grade=" + grade + ", bankName=" + bankName
				+ ", accountNumber=" + accountNumber + ", accountName=" + accountName + ", sellerInfo=" + sellerInfo
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	public int getSellerNo() {
		return sellerNo;
	}
	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
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
	public String getaccountName() {
		return accountName;
	}
	public void setaccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getsellerInfo() {
		return sellerInfo;
	}
	public void setsellerInfo(String sellerInfo) {
		this.sellerInfo = sellerInfo;
	}
	
	

}

