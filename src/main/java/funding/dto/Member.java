package funding.dto;

import java.util.Date;

public class Member {
	
	private int memberNo;		// 회원번호
	private String id;			// 아이디
	private String pw;			// 비밀번호
	private String name;		// 이름
	private String email;		// 이메일
	private String nick;		// 닉네임
	private String phone;		// 전화번호
	private int grade;			// 회원유형
	private String naverLogin;	// 네이버 아이디
	private String kakaoLogin;	// 네이버 아이디
	private Date reg_date; 		// 가입날짜
	
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email
				+ ", nick=" + nick + ", phone=" + phone + ", grade=" + grade + ", naverLogin=" + naverLogin
				+ ", kakaoLogin=" + kakaoLogin + ", reg_date=" + reg_date + "]";
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

	public String getNaverLogin() {
		return naverLogin;
	}

	public void setNaverLogin(String naverLogin) {
		this.naverLogin = naverLogin;
	}

	public String getKakaoLogin() {
		return kakaoLogin;
	}

	public void setKakaoLogin(String kakaoLogin) {
		this.kakaoLogin = kakaoLogin;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

}
