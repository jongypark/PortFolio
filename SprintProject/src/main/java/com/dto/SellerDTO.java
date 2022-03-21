package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("SellerDTO")
public class SellerDTO {

	//14개
	private	String	sid; 
	private	String  spw;
	private	String  sname;
	private	String  saddress1;
	private	String  saddress2;
	private	String  semail1;
	private	String  semail2;
	private	String  spost;
	private	String  sphone1;
	private	String  sphone2;
	private	String  sphone3;
	private	String  srdate;
	private	String  sbirth;
	private	int  sdrop;
	public SellerDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SellerDTO(String sid, String spw, String sname, String saddress1, String saddress2, String semail1,
			String semail2, String spost, String sphone1, String sphone2, String sphone3, String srdate, String sbirth,
			int sdrop) {
		super();
		this.sid = sid;
		this.spw = spw;
		this.sname = sname;
		this.saddress1 = saddress1;
		this.saddress2 = saddress2;
		this.semail1 = semail1;
		this.semail2 = semail2;
		this.spost = spost;
		this.sphone1 = sphone1;
		this.sphone2 = sphone2;
		this.sphone3 = sphone3;
		this.srdate = srdate;
		this.sbirth = sbirth;
		this.sdrop = sdrop;
	}
	@Override
	public String toString() {
		return "SellerDTO [sid=" + sid + ", spw=" + spw + ", sname=" + sname + ", saddress1=" + saddress1
				+ ", saddress2=" + saddress2 + ", semail1=" + semail1 + ", semail2=" + semail2 + ", spost=" + spost
				+ ", sphone1=" + sphone1 + ", sphone2=" + sphone2 + ", sphone3=" + sphone3 + ", srdate=" + srdate
				+ ", sbirth=" + sbirth + ", sdrop=" + sdrop + "]";
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getSpw() {
		return spw;
	}
	public void setSpw(String spw) {
		this.spw = spw;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSaddress1() {
		return saddress1;
	}
	public void setSaddress1(String saddress1) {
		this.saddress1 = saddress1;
	}
	public String getSaddress2() {
		return saddress2;
	}
	public void setSaddress2(String saddress2) {
		this.saddress2 = saddress2;
	}
	public String getSemail1() {
		return semail1;
	}
	public void setSemail1(String semail1) {
		this.semail1 = semail1;
	}
	public String getSemail2() {
		return semail2;
	}
	public void setSemail2(String semail2) {
		this.semail2 = semail2;
	}
	public String getSpost() {
		return spost;
	}
	public void setSpost(String spost) {
		this.spost = spost;
	}
	public String getSphone1() {
		return sphone1;
	}
	public void setSphone1(String sphone1) {
		this.sphone1 = sphone1;
	}
	public String getSphone2() {
		return sphone2;
	}
	public void setSphone2(String sphone2) {
		this.sphone2 = sphone2;
	}
	public String getSphone3() {
		return sphone3;
	}
	public void setSphone3(String sphone3) {
		this.sphone3 = sphone3;
	}
	public String getSrdate() {
		return srdate;
	}
	public void setSrdate(String srdate) {
		this.srdate = srdate;
	}
	public String getSbirth() {
		return sbirth;
	}
	public void setSbirth(String sbirth) {
		this.sbirth = sbirth;
	}
	public int getSdrop() {
		return sdrop;
	}
	public void setSdrop(int sdrop) {
		this.sdrop = sdrop;
	}
	
	
	
	
	
}
