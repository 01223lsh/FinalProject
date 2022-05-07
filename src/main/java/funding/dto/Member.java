package funding.dto;

public class Member {

	private int memberNo;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String nick;
	private String phone;
	private int grade;
	
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email
				+ ", nick=" + nick + ", phone=" + phone + ", grade=" + grade + "]";
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
	

	
}
