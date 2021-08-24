package woo.edu.c.vo;

public class YearMonthDay {
	private String week_num;
	private String month;
	private String sun;
	private String mon;
	private String tue;
	private String wed;
	private String thu;
	private String fri;
	private String sat;
	private String year;
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getWeek_num() {
		return week_num;
	}
	public void setWeek_Num(String week_num) {
		this.week_num = week_num;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String monthis) {
		this.month = monthis;
	}
	public String getMon() {
		return mon;
	}
	public void setMon(String mon) {
		this.mon = mon;
	}
	public String getTue() {
		return tue;
	}
	public void setTue(String tue) {
		this.tue = tue;
	}
	public String getWed() {
		return wed;
	}
	public void setWed(String wed) {
		this.wed = wed;
	}
	public String getThu() {
		return thu;
	}
	public void setThu(String thu) {
		this.thu = thu;
	}
	public String getFri() {
		return fri;
	}
	public void setFri(String fri) {
		this.fri = fri;
	}
	public String getSat() {
		return sat;
	}
	public void setSat(String sat) {
		this.sat = sat;
	}
	public String getSun() {
		return sun;
	}
	public void setSun(String sun) {
		this.sun = sun;
	}
	@Override
	public String toString() {
		return "YearMonthDay [week_Num=" + week_num + ", month=" + month + ", mon=" + mon + ", tue=" + tue + ", wed="
				+ wed + ", thu=" + thu + ", fri=" + fri + ", sat=" + sat + ", sun=" + sun + "]";
	}
	
}
