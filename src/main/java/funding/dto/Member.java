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
	private String naverlogin;	// 네이버 아이디
	private String kakaologin;	// 카카오 아이디
	private Date regDate;		// 가입날짜
	
	// 원석님이 필요해서 만든 필드값
	private MemberSeller memberSeller;

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email
				+ ", nick=" + nick + ", phone=" + phone + ", grade=" + grade + ", naverLogin=" + naverlogin
				+ ", kakaoLogin=" + kakaologin + ", regDate=" + regDate + ", memberSeller=" + memberSeller + "]";
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


	public String getNaverlogin() {
		return naverlogin;
	}

	public void setNaverlogin(String naverlogin) {
		this.naverlogin = naverlogin;
	}

	public String getKakaologin() {
		return kakaologin;
	}

	public void setKakaologin(String kakaologin) {
		this.kakaologin = kakaologin;

	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public MemberSeller getMemberSeller() {
		return memberSeller;
	}


	public void setMemberSeller(MemberSeller memberSeller) {
		this.memberSeller = memberSeller;
	}

}
