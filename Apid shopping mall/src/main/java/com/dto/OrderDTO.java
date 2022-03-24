package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("OrderDTO")
public class OrderDTO {

	private int oid; // index 값..
	// 배달할 주소지 정보
	private String mid;
	private String ordate;
	private String oname;
	private String ophone1;
	private String ophone2;
	private String ophone3;
	private String oaddress1;
	private String oaddress2;
	private String opost;

	private String paymentid; // 결제정보가 담긴 payment테이블fk
	private int opindex; // 구매한 상품들의 정보가 있는 orderproduct테이블fk

	// 화면에 필요한 정보
	private String oproductname; // 출력형식은 xxx 상품 외 2개..
	private int oprice; // 구매한 가격
	private String oimage; // 화면에 나올 대표 이미지
	private int opaymentcheck; // 결제했는지 확인하는 곳
	private int odelivery; // 배달상태를 나타내는 변수
	private int oconfirmed; // 구매확정 혹은 개별 반품? 전체반품?

	// --------------------//
	private String deliverystatus;// 배송현황을 표시를 위해 추가
	// --------------------//
	private String opaymentcheckstatus;// 결제상태를 위해 추가
	// --------------------//
	private int sum;//가장많이 구매한 금액을 합친 변수 추가 
	// --------------------//
	
	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderDTO(int oid, String mid, String ordate, String oname, String ophone1, String ophone2, String ophone3,
			String oaddress1, String oaddress2, String opost, String paymentid, int opindex, String oproductname,
			int oprice, String oimage, int opaymentcheck, int odelivery, int oconfirmed, String deliverystatus,
			String opaymentcheckstatus, int sum) {
		super();
		this.oid = oid;
		this.mid = mid;
		this.ordate = ordate;
		this.oname = oname;
		this.ophone1 = ophone1;
		this.ophone2 = ophone2;
		this.ophone3 = ophone3;
		this.oaddress1 = oaddress1;
		this.oaddress2 = oaddress2;
		this.opost = opost;
		this.paymentid = paymentid;
		this.opindex = opindex;
		this.oproductname = oproductname;
		this.oprice = oprice;
		this.oimage = oimage;
		this.opaymentcheck = opaymentcheck;
		this.odelivery = odelivery;
		this.oconfirmed = oconfirmed;
		this.deliverystatus = deliverystatus;
		this.opaymentcheckstatus = opaymentcheckstatus;
		this.sum = sum;
	}

	@Override
	public String toString() {
		return "OrderDTO [oid=" + oid + ", mid=" + mid + ", ordate=" + ordate + ", oname=" + oname + ", ophone1="
				+ ophone1 + ", ophone2=" + ophone2 + ", ophone3=" + ophone3 + ", oaddress1=" + oaddress1
				+ ", oaddress2=" + oaddress2 + ", opost=" + opost + ", paymentid=" + paymentid + ", opindex=" + opindex
				+ ", oproductname=" + oproductname + ", oprice=" + oprice + ", oimage=" + oimage + ", opaymentcheck="
				+ opaymentcheck + ", odelivery=" + odelivery + ", oconfirmed=" + oconfirmed + ", deliverystatus="
				+ deliverystatus + ", opaymentcheckstatus=" + opaymentcheckstatus + ", sum=" + sum +"]";
	}

	public int getOid() {
		return oid;
	}

	public String getDeliverystatus() {
		return deliverystatus;
	}

	public void setDeliverystatus(String deliverystatus) {
		this.deliverystatus = deliverystatus;
	}

	public String getOpaymentcheckstatus() {
		return opaymentcheckstatus;
	}

	public void setOpaymentcheckstatus(String opaymentcheckstatus) {
		this.opaymentcheckstatus = opaymentcheckstatus;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public void setOid(int oid) {
		this.oid = oid;
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

	public String getOaddress2() {
		return oaddress2;
	}

	public void setOaddress2(String oaddress2) {
		this.oaddress2 = oaddress2;
	}

	public String getOpost() {
		return opost;
	}

	public void setOpost(String opost) {
		this.opost = opost;
	}

	public String getPaymentid() {
		return paymentid;
	}

	public void setPaymentid(String paymentid) {
		this.paymentid = paymentid;
	}

	public int getOpindex() {
		return opindex;
	}

	public void setOpindex(int opindex) {
		this.opindex = opindex;
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

	public String getOimage() {
		return oimage;
	}

	public void setOimage(String oimage) {
		this.oimage = oimage;
	}

	public int getOpaymentcheck() {
		return opaymentcheck;
	}

	public void setOpaymentcheck(int opaymentcheck) {
		this.opaymentcheck = opaymentcheck;
	}

	public int getOdelivery() {
		return odelivery;
	}

	public void setOdelivery(int odelivery) {
		this.odelivery = odelivery;
	}

	public int getOconfirmed() {
		return oconfirmed;
	}

	public void setOconfirmed(int oconfirmed) {
		this.oconfirmed = oconfirmed;
	}

}
