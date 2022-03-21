package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("ReturnDTO")
public class ReturnDTO {

	private String sid;
	private int oid;
	private String oproductname;
	private int oprice;
	private String oname;
	private String oaddress1;
	private int oconfirmed;
	private int confirmed;
	private String oimage;
	private String gname;
	public ReturnDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReturnDTO(String sid, int oid, String oproductname, int oprice, String oname, String oaddress1,
			int oconfirmed, int confirmed, String oimage, String gname) {
		super();
		this.sid = sid;
		this.oid = oid;
		this.oproductname = oproductname;
		this.oprice = oprice;
		this.oname = oname;
		this.oaddress1 = oaddress1;
		this.oconfirmed = oconfirmed;
		this.confirmed = confirmed;
		this.oimage = oimage;
		this.gname = gname;
	}
	@Override
	public String toString() {
		return "ReturnDTO [sid=" + sid + ", oid=" + oid + ", oproductname=" + oproductname + ", oprice=" + oprice
				+ ", oname=" + oname + ", oaddress1=" + oaddress1 + ", oconfirmed=" + oconfirmed + ", confirmed="
				+ confirmed + ", oimage=" + oimage + ", gname=" + gname + "]";
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getOproductname() {
		return oproductname;
	}
	public void setOproductname(String oproductname) {
		this.oproductname = oproductname;
	}
	public int getOprice() {
		return oprice;
	}
	public void setOprice(int oprice) {
		this.oprice = oprice;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getOaddress1() {
		return oaddress1;
	}
	public void setOaddress1(String oaddress1) {
		this.oaddress1 = oaddress1;
	}
	public int getOconfirmed() {
		return oconfirmed;
	}
	public void setOconfirmed(int oconfirmed) {
		this.oconfirmed = oconfirmed;
	}
	public int getConfirmed() {
		return confirmed;
	}
	public void setConfirmed(int confirmed) {
		this.confirmed = confirmed;
	}
	public String getOimage() {
		return oimage;
	}
	public void setOimage(String oimage) {
		this.oimage = oimage;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	
	
}
