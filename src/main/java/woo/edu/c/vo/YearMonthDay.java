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
	private String chk_sun;
	private String chk_mon;
	private String chk_tue;
	private String chk_wed;
	private String chk_thu;
	private String chk_fri;
	private String chk_sat;
	
	
	public String getChk_sat() {
		return chk_sat;
	}
	public void setChk_sat(String chk_sat) {
		this.chk_sat = chk_sat;
	}
	public String getChk_sun() {
		return chk_sun;
	}
	public void setChk_sun(String chk_sun) {
		this.chk_sun = chk_sun;
	}
	public String getChk_mon() {
		return chk_mon;
	}
	public void setChk_mon(String chk_mon) {
		this.chk_mon = chk_mon;
	}
	public String getChk_tue() {
		return chk_tue;
	}
	public void setChk_tue(String chk_tue) {
		this.chk_tue = chk_tue;
	}
	public String getChk_wed() {
		return chk_wed;
	}
	public void setChk_wed(String chk_wed) {
		this.chk_wed = chk_wed;
	}
	public String getChk_thu() {
		return chk_thu;
	}
	public void setChk_thu(String chk_thu) {
		this.chk_thu = chk_thu;
	}
	public String getChk_fri() {
		return chk_fri;
	}
	public void setChk_fri(String chk_fri) {
		this.chk_fri = chk_fri;
	}
	public void setWeek_num(String week_num) {
		this.week_num = week_num;
	}
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
		return "YearMonthDay [week_num=" + week_num + ", month=" + month + ", sun=" + sun + ", mon=" + mon + ", tue="
				+ tue + ", wed=" + wed + ", thu=" + thu + ", fri=" + fri + ", sat=" + sat + ", chk_sun=" + chk_sun
				+ ", chk_mon=" + chk_mon + ", chk_tue=" + chk_tue + ", chk_wed=" + chk_wed + ", chk_thu=" + chk_thu
				+ ", chk_fri=" + chk_fri + ", chk_sat=" + chk_sat + ", year=" + year + "]";
	}
	
}
