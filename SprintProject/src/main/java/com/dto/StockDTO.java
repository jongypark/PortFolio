package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("StockDTO")
public class StockDTO {

	String gid;
	String gsize;
	String gcolor;
	int gstock;
	int num;
	
	public StockDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StockDTO(String gid, String gsize, String gcolor, int gstock, int num) {
		super();
		this.gid = gid;
		this.gsize = gsize;
		this.gcolor = gcolor;
		this.gstock = gstock;
		this.num = num;
	}

	@Override
	public String toString() {
		return "StockDTO [gid=" + gid + ", gsize=" + gsize + ", gcolor=" + gcolor + ", gstock=" + gstock + ", num="
				+ num + "]";
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getGsize() {
		return gsize;
	}

	public void setGsize(String gsize) {
		this.gsize = gsize;
	}

	public String getGcolor() {
		return gcolor;
	}

	public void setGcolor(String gcolor) {
		this.gcolor = gcolor;
	}

	public int getGstock() {
		return gstock;
	}

	public void setGstock(int gstock) {
		this.gstock = gstock;
	}
	
}
