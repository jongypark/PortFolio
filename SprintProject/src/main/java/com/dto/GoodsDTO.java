package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("GoodsDTO")
public class GoodsDTO {

	// 15개
	private String gid;
	private String sid;
	private String gcategory;
	private String gname;
	private int gprice;
	private String gsize;
	private int gdiscount;
	private String gimage1;
	private String gimage2;
	private String gimage3;
	private String gimage4;
	private String gimage5;
	private String gdetail;
	private String grdate;
	private int ghit;
	private int gsell;
	private int gamount;

	public GoodsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getGcategory() {
		return gcategory;
	}

	public void setGcategory(String gcategory) {
		this.gcategory = gcategory;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public int getGprice() {
		return gprice;
	}

	public void setGprice(int gprice) {
		this.gprice = gprice;
	}

	public String getGsize() {
		return gsize;
	}

	public void setGsize(String gsize) {
		this.gsize = gsize;
	}

	public int getGdiscount() {
		return gdiscount;
	}

	public void setGdiscount(int gdiscount) {
		this.gdiscount = gdiscount;
	}

	public String getGimage1() {
		return gimage1;
	}

	public void setGimage1(String gimage1) {
		this.gimage1 = gimage1;
	}

	public String getGimage2() {
		return gimage2;
	}

	public void setGimage2(String gimage2) {
		this.gimage2 = gimage2;
	}

	public String getGimage3() {
		return gimage3;
	}

	public void setGimage3(String gimage3) {
		this.gimage3 = gimage3;
	}

	public String getGimage4() {
		return gimage4;
	}

	public void setGimage4(String gimage4) {
		this.gimage4 = gimage4;
	}

	public String getGimage5() {
		return gimage5;
	}

	public void setGimage5(String gimage5) {
		this.gimage5 = gimage5;
	}

	public String getGdetail() {
		return gdetail;
	}

	public void setGdetail(String gdetail) {
		this.gdetail = gdetail;
	}

	public String getGrdate() {
		return grdate;
	}

	public void setGrdate(String grdate) {
		this.grdate = grdate;
	}

	public int getGhit() {
		return ghit;
	}

	public void setGhit(int ghit) {
		this.ghit = ghit;
	}

	public int getGsell() {
		return gsell;
	}

	public void setGsell(int gsell) {
		this.gsell = gsell;
	}

	public int getGamount() {
		return gamount;
	}

	public void setGamount(int gamount) {
		this.gamount = gamount;
	}

	@Override
	public String toString() {
		return "GoodsDTO [gid=" + gid + ", sid=" + sid + ", gcategory=" + gcategory + ", gname=" + gname + ", gprice="
				+ gprice + ", gsize=" + gsize + ", gdiscount=" + gdiscount + ", gimage1=" + gimage1 + ", gimage2="
				+ gimage2 + ", gimage3=" + gimage3 + ", gimage4=" + gimage4 + ", gimage5=" + gimage5 + ", gdetail="
				+ gdetail + ", grdate=" + grdate + ", ghit=" + ghit + ", gsell=" + gsell + ", gamount=" + gamount + "]";
	}

	public GoodsDTO(String gid, String sid, String gcategory, String gname, int gprice, String gsize, int gdiscount,
			String gimage1, String gimage2, String gimage3, String gimage4, String gimage5, String gdetail,
			String grdate, int ghit, int gsell, int gamount) {
		super();
		this.gid = gid;
		this.sid = sid;
		this.gcategory = gcategory;
		this.gname = gname;
		this.gprice = gprice;
		this.gsize = gsize;
		this.gdiscount = gdiscount;
		this.gimage1 = gimage1;
		this.gimage2 = gimage2;
		this.gimage3 = gimage3;
		this.gimage4 = gimage4;
		this.gimage5 = gimage5;
		this.gdetail = gdetail;
		this.grdate = grdate;
		this.ghit = ghit;
		this.gsell = gsell;
		this.gamount = gamount;
	}

}
