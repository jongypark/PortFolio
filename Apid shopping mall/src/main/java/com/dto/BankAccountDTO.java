package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("BankAccountDTO")
public class BankAccountDTO {

	private String bankid;
	private String mid;
	private String accountnumber;
	private String accountname;
	private String bank;
	public BankAccountDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BankAccountDTO(String bankid, String mid, String accountnumber, String accountname, String bank) {
		super();
		this.bankid = bankid;
		this.mid = mid;
		this.accountnumber = accountnumber;
		this.accountname = accountname;
		this.bank = bank;
	}
	@Override
	public String toString() {
		return "BankAccount [bankid=" + bankid + ", mid=" + mid + ", accountnumber=" + accountnumber + ", accountname="
				+ accountname + ", bank=" + bank + "]";
	}
	public String getBankid() {
		return bankid;
	}
	public void setBankid(String bankid) {
		this.bankid = bankid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getAccountnumber() {
		return accountnumber;
	}
	public void setAccountnumber(String accountnumber) {
		this.accountnumber = accountnumber;
	}
	public String getAccountname() {
		return accountname;
	}
	public void setAccountname(String accountname) {
		this.accountname = accountname;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	
	
	
	
	
	
}
