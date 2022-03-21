package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("OrderProductDetailDTO")
public class OrderProductDetailDTO {

	// OrderProductDetail 테이블에 들어갈 정보..
	private String opdindex; // index값
	private int opindex; // fk / orderproduct
	private String gid; // 구매 상품코드
	private String gname; // 구매 상품 이름
	private String gsize; // 구매 상품 사이즈
	private int gamount; // 구매수량
	private String gcolor; // 구매 상품 컬러
	private int gprice; // 구매상품 가격
	private String gimage; // 구매상품 대표이미지
	private int confirmed; // 반품 혹은 구매확정
	// --------------------//
	private String ordate; // 금일 판매수량을 위해 추가
	// --------------------//

	public OrderProductDetailDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderProductDetailDTO(String opdindex, int opindex, String gid, String gname, String gsize, int gamount,
			String gcolor, int gprice, String gimage, int confirmed, String ordate) {
		super();
		this.opdindex = opdindex;
		this.opindex = opindex;
		this.gid = gid;
		this.gname = gname;
		this.gsize = gsize;
		this.gamount = gamount;
		this.gcolor = gcolor;
		this.gprice = gprice;
		this.gimage = gimage;
		this.confirmed = confirmed;
		this.ordate = ordate;
	}



	@Override
	public String toString() {
		return "OrderProductDetailDTO [opdindex=" + opdindex + ", opindex=" + opindex + ", gid=" + gid + ", gname="
				+ gname + ", gsize=" + gsize + ", gamount=" + gamount + ", gcolor=" + gcolor + ", gprice=" + gprice
				+ ", gimage=" + gimage + ", confirmed=" + confirmed + ", ordate=" + ordate + "]";
	}

	public String getOpdindex() {
		return opdindex;
	}

	public String getOrdate() {
		return ordate;
	}

	public void setOrdate(String ordate) {
		this.ordate = ordate;
	}

	public void setOpdindex(String opdindex) {
		this.opdindex = opdindex;
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

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
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

	public String getGcolor() {
		return gcolor;
	}

	public void setGcolor(String gcolor) {
		this.gcolor = gcolor;
	}

	public int getGprice() {
		return gprice;
	}

	public void setGprice(int gprice) {
		this.gprice = gprice;
	}

	public String getGimage() {
		return gimage;
	}

	public void setGimage(String gimage) {
		this.gimage = gimage;
	}

	public int getConfirmed() {
		return confirmed;
	}

	public void setConfirmed(int confirmed) {
		this.confirmed = confirmed;
	}


}
