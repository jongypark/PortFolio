package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("OrderChartDTO")
public class OrderChartDTO {

	
	private String sid;
	private String mid;
	private String ordate;
	private String oname;
	private String ophone1;
	private String ophone2;
	private String ophone3;
	private String oaddress1;
//	-------------------------------구매한 상춤목록출력
	private int opindex;
	private String gid;
	private int oprice;
	private String gname;
	private String gimage;
	private String oimage;
	private String gcolor;
	private String gsize;
	private int gamount;
	private int gprice;
	private String oproductname;
	private String opaymentcheckstatus;
//	-------------------------------구매자 정보
	private String code;
	private String discount;
	private String content;
	private int oconfirmed;
//	--------------------------------쿠폰정보
	private String company;
	private String cardnumber;
	private int opaymentcheck;
	private int used;
//	----------------------------------결재수단
	private String odelivery;
	private String deliverystatus;
	private int oid;
	
	public OrderChartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderChartDTO(String sid, String mid, String ordate, String oname, String ophone1, String ophone2,
			String ophone3, String oaddress1, int opindex, String gid, int oprice, String gname, String gimage,
			String oimage, String gcolor, String gsize, int gamount, int gprice, String oproductname,
			String opaymentcheckstatus, String code, String discount, String content, int oconfirmed, String company,
			String cardnumber, int opaymentcheck, int used, String odelivery, String deliverystatus, int oid) {
		super();
		this.sid = sid;
		this.mid = mid;
		this.ordate = ordate;
		this.oname = oname;
		this.ophone1 = ophone1;
		this.ophone2 = ophone2;
		this.ophone3 = ophone3;
		this.oaddress1 = oaddress1;
		this.opindex = opindex;
		this.gid = gid;
		this.oprice = oprice;
		this.gname = gname;
		this.gimage = gimage;
		this.oimage = oimage;
		this.gcolor = gcolor;
		this.gsize = gsize;
		this.gamount = gamount;
		this.gprice = gprice;
		this.oproductname = oproductname;
		this.opaymentcheckstatus = opaymentcheckstatus;
		this.code = code;
		this.discount = discount;
		this.content = content;
		this.oconfirmed = oconfirmed;
		this.company = company;
		this.cardnumber = cardnumber;
		this.opaymentcheck = opaymentcheck;
		this.used = used;
		this.odelivery = odelivery;
		this.deliverystatus = deliverystatus;
		this.oid = oid;
	}

	@Override
	public String toString() {
		return "OrderChartDTO [sid=" + sid + ", mid=" + mid + ", ordate=" + ordate + ", oname=" + oname + ", ophone1="
				+ ophone1 + ", ophone2=" + ophone2 + ", ophone3=" + ophone3 + ", oaddress1=" + oaddress1 + ", opindex="
				+ opindex + ", gid=" + gid + ", oprice=" + oprice + ", gname=" + gname + ", gimage=" + gimage
				+ ", oimage=" + oimage + ", gcolor=" + gcolor + ", gsize=" + gsize + ", gamount=" + gamount
				+ ", gprice=" + gprice + ", oproductname=" + oproductname + ", opaymentcheckstatus="
				+ opaymentcheckstatus + ", code=" + code + ", discount=" + discount + ", content=" + content
				+ ", oconfirmed=" + oconfirmed + ", company=" + company + ", cardnumber=" + cardnumber
				+ ", opaymentcheck=" + opaymentcheck + ", used=" + used + ", odelivery=" + odelivery
				+ ", deliverystatus=" + deliverystatus + ", oid=" + oid + "]";
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getOrdate() {
		return ordate;
	}

	public void setOrdate(String ordate) {
		this.ordate = ordate;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getOphone1() {
		return ophone1;
	}

	public void setOphone1(String ophone1) {
		this.ophone1 = ophone1;
	}

	public String getOphone2() {
		return ophone2;
	}

	public void setOphone2(String ophone2) {
		this.ophone2 = ophone2;
	}

	public String getOphone3() {
		return ophone3;
	}

	public void setOphone3(String ophone3) {
		this.ophone3 = ophone3;
	}

	public String getOaddress1() {
		return oaddress1;
	}

	public void setOaddress1(String oaddress1) {
		this.oaddress1 = oaddress1;
	}

	public int getOpindex() {
		return opindex;
	}

	public void setOpindex(int opindex) {
		this.opindex = opindex;
	}

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public int getOprice() {
		return oprice;
	}

	public void setOprice(int oprice) {
		this.oprice = oprice;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getGimage() {
		return gimage;
	}

	public void setGimage(String gimage) {
		this.gimage = gimage;
	}

	public String getOimage() {
		return oimage;
	}

	public void setOimage(String oimage) {
		this.oimage = oimage;
	}

	public String getGcolor() {
		return gcolor;
	}

	public void setGcolor(String gcolor) {
		this.gcolor = gcolor;
	}

	public String getGsize() {
		return gsize;
	}

	public void setGsize(String gsize) {
		this.gsize = gsize;
	}

	public int getGamount() {
		return gamount;
	}

	public void setGamount(int gamount) {
		this.gamount = gamount;
	}

	public int getGprice() {
		return gprice;
	}

	public void setGprice(int gprice) {
		this.gprice = gprice;
	}

	public String getOproductname() {
		return oproductname;
	}

	public void setOproductname(String oproductname) {
		this.oproductname = oproductname;
	}

	public String getOpaymentcheckstatus() {
		return opaymentcheckstatus;
	}

	public void setOpaymentcheckstatus(String opaymentcheckstatus) {
		this.opaymentcheckstatus = opaymentcheckstatus;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getOconfirmed() {
		return oconfirmed;
	}

	public void setOconfirmed(int oconfirmed) {
		this.oconfirmed = oconfirmed;
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

	public int getOpaymentcheck() {
		return opaymentcheck;
	}

	public void setOpaymentcheck(int opaymentcheck) {
		this.opaymentcheck = opaymentcheck;
	}

	public int getUsed() {
		return used;
	}

	public void setUsed(int used) {
		this.used = used;
	}

	public String getOdelivery() {
		return odelivery;
	}

	public void setOdelivery(String odelivery) {
		this.odelivery = odelivery;
	}

	public String getDeliverystatus() {
		return deliverystatus;
	}

	public void setDeliverystatus(String deliverystatus) {
		this.deliverystatus = deliverystatus;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	
	
}
