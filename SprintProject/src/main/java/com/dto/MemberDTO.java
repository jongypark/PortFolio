package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("MemberDTO")
public class MemberDTO {
	//14개
private	String mid;
private	String mpw;
private	String mname;
private	String maddress1;
private	String maddress2;
private	String memail1;
private	String memail2;
private	String mpost;
private	String mphone1;
private	String mphone2;
private	String mphone3;
private	String mrdate; // 가입일
private	String mbirth; // 생일
private	int mdrop; // 탈퇴여부
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDTO(String mid, String mpw, String mname, String maddress1, String maddress2, String memail1,
			String memail2, String mpost, String mphone1, String mphone2, String mphone3, String mrdate, String mbirth,
			int mdrop) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.maddress1 = maddress1;
		this.maddress2 = maddress2;
		this.memail1 = memail1;
		this.memail2 = memail2;
		this.mpost = mpost;
		this.mphone1 = mphone1;
		this.mphone2 = mphone2;
		this.mphone3 = mphone3;
		this.mrdate = mrdate;
		this.mbirth = mbirth;
		this.mdrop = mdrop;
	}
	@Override
	public String toString() {
		return "MemberDTO [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", maddress1=" + maddress1
				+ ", maddress2=" + maddress2 + ", memail1=" + memail1 + ", memail2=" + memail2 + ", mpost=" + mpost
				+ ", mphone1=" + mphone1 + ", mphone2=" + mphone2 + ", mphone3=" + mphone3 + ", mrdate=" + mrdate
				+ ", mbirth=" + mbirth + ", mdrop=" + mdrop + "]";
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMaddress1() {
		return maddress1;
	}
	public void setMaddress1(String maddress1) {
		this.maddress1 = maddress1;
	}
	public String getMaddress2() {
		return maddress2;
	}
	public void setMaddress2(String maddress2) {
		this.maddress2 = maddress2;
	}
	public String getMemail1() {
		return memail1;
	}
	public void setMemail1(String memail1) {
		this.memail1 = memail1;
	}
	public String getMemail2() {
		return memail2;
	}
	public void setMemail2(String memail2) {
		this.memail2 = memail2;
	}
	public String getMpost() {
		return mpost;
	}
	public void setMpost(String mpost) {
		this.mpost = mpost;
	}
	public String getMphone1() {
		return mphone1;
	}
	public void setMphone1(String mphone1) {
		this.mphone1 = mphone1;
	}
	public String getMphone2() {
		return mphone2;
	}
	public void setMphone2(String mphone2) {
		this.mphone2 = mphone2;
	}
	public String getMphone3() {
		return mphone3;
	}
	public void setMphone3(String mphone3) {
		this.mphone3 = mphone3;
	}
	public String getMrdate() {
		return mrdate;
	}
	public void setMrdate(String mrdate) {
		this.mrdate = mrdate;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}
	public int getMdrop() {
		return mdrop;
	}
	public void setMdrop(int mdrop) {
		this.mdrop = mdrop;
	}
	
	
	
}
