package funding.dto;



public class Chart {
	private int cnt;
	private int normalcnt;
	private int buisnesscnt;
	private String regDate;
	private int selectDate;
	private int chartCheck;
	
	@Override
	public String toString() {
		return "Chart [cnt=" + cnt + ", normalcnt=" + normalcnt + ", buisnesscnt=" + buisnesscnt + ", regDate="
				+ regDate + ", selectDate=" + selectDate + ", chartCheck=" + chartCheck + "]";
	}


	public int getNormalcnt() {
		return normalcnt;
	}
	public void setNormalcnt(int normalcnt) {
		this.normalcnt = normalcnt;
	}
	public int getBuisnesscnt() {
		return buisnesscnt;
	}
	public void setBuisnesscnt(int buisnesscnt) {
		this.buisnesscnt = buisnesscnt;
	}
	public int getChartCheck() {
		return chartCheck;
	}
	public void setChartCheck(int chartCheck) {
		this.chartCheck = chartCheck;
	}
	public int getSelectDate() {
		return selectDate;
	}
	public void setSelectDate(int selectDate) {
		this.selectDate = selectDate;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	
	
	
}
