package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("CartDTO")
	public class CartDTO {

//	9개 + 추가 가능성? 재고량, 위시리스트? , 
	private int cid;
	private String mid;
	private String gid;
	private int cqty;
	private String csize;
	private String gname;
	private String gcolor;
	private int gprice;
	private String gimage;
	private int stock;
	private String gcategory;
	
	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	



	public String getGcategory() {
		return gcategory;
	}






	public void setGcategory(String gcategory) {
		this.gcategory = gcategory;
	}






	@Override
	public String toString() {
		return "CartDTO [cid=" + cid + ", mid=" + mid + ", gid=" + gid + ", cqty=" + cqty + ", csize=" + csize
				+ ", gname=" + gname + ", gcolor=" + gcolor + ", gprice=" + gprice + ", gimage=" + gimage + ", stock="
				+ stock + ", gcategory=" + gcategory + "]";
	}






	public CartDTO(int cid, String mid, String gid, int cqty, String csize, String gname, String gcolor, int gprice,
			String gimage, int stock, String gcategory) {
		super();
		this.cid = cid;
		this.mid = mid;
		this.gid = gid;
		this.cqty = cqty;
		this.csize = csize;
		this.gname = gname;
		this.gcolor = gcolor;
		this.gprice = gprice;
		this.gimage = gimage;
		this.stock = stock;
		this.gcategory = gcategory;
	}






	public int getStock() {
		return stock;
	}



	public void setStock(int stock) {
		this.stock = stock;
	}


	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public int getCqty() {
		return cqty;
	}
	public void setCqty(int cqty) {
		this.cqty = cqty;
	}
	public String getCsize() {
		return csize;
	}
	public void setCsize(String csize) {
		this.csize = csize;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
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
	
		
}

