package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("CreditCartDTO")
public class CreditCartDTO {

	private String creditid;
	private String mid;
	private String company;
	private String cardnumber;
	private int day;
	private int month;
	private int cvv;
	public CreditCartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CreditCartDTO(String creditid, String mid, String company, String cardnumber, int day, int month, int cvv) {
		super();
		this.creditid = creditid;
		this.mid = mid;
		this.company = company;
		this.cardnumber = cardnumber;
		this.day = day;
		this.month = month;
		this.cvv = cvv;
	}
	@Override
	public String toString() {
		return "CreditCartDTO [creditid=" + creditid + ", mid=" + mid + ", company=" + company + ", cardnumber="
				+ cardnumber + ", day=" + day + ", month=" + month + ", cvv=" + cvv + "]";
	}
	public String getCreditid() {
		return creditid;
	}
	public void setCreditid(String creditid) {
		this.creditid = creditid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCardnumber() {
		return cardnumber;
	}
	public void setCardnumber(String cardnumber) {
		this.cardnumber = cardnumber;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getCvv() {
		return cvv;
	}
	public void setCvv(int cvv) {
		this.cvv = cvv;
	}
	
	
	
	
	
	
}
