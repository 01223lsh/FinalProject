package funding.dto;

import java.util.Date;

public class Qna {

	private int rnum;
	private int rnum2;
	private int qnaNo;
	private String qnaTitle;
	private String nick;
	private String qnaContent;
	private Date qnaCreateDate;
	private int qnaRefer;
	private int qnaStep;
	private int qnaDepth;
	private int memberNo;
	
	
	@Override
	public String toString() {
		return "Qna [rnum=" + rnum + ", rnum2=" + rnum2 + ", qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", nick="
				+ nick + ", qnaContent=" + qnaContent + ", qnaCreateDate=" + qnaCreateDate + ", qnaRefer=" + qnaRefer
				+ ", qnaStep=" + qnaStep + ", qnaDepth=" + qnaDepth + ", memberNo=" + memberNo + "]";
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getRnum2() {
		return rnum2;
	}
	public void setRnum2(int rnum2) {
		this.rnum2 = rnum2;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public Date getQnaCreateDate() {
		return qnaCreateDate;
	}
	public void setQnaCreateDate(Date qnaCreateDate) {
		this.qnaCreateDate = qnaCreateDate;
	}
	public int getQnaRefer() {
		return qnaRefer;
	}
	public void setQnaRefer(int qnaRefer) {
		this.qnaRefer = qnaRefer;
	}
	public int getQnaStep() {
		return qnaStep;
	}
	public void setQnaStep(int qnaStep) {
		this.qnaStep = qnaStep;
	}
	public int getQnaDepth() {
		return qnaDepth;
	}
	public void setQnaDepth(int qnaDepth) {
		this.qnaDepth = qnaDepth;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	

	

	
	
	
}
