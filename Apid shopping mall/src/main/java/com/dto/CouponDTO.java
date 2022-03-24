package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("CouponDTO")
public class CouponDTO {

	private String code;
	private String dccode;
	private String type;
	private String content;
	private int max_num;
	private int current_num;
	private String discount;
	
	
	
	public CouponDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	public String getDiscount() {
		return discount;
	}





	public void setDiscount(String discount) {
		this.discount = discount;
	}





	@Override
	public String toString() {
		return "CouponDTO [code=" + code + ", dccode=" + dccode + ", type=" + type + ", content=" + content
				+ ", max_num=" + max_num + ", current_num=" + current_num + ", discount=" + discount + "]";
	}





	public CouponDTO(String code, String dccode, String type, String content, int max_num, int current_num,
			String discount) {
		super();
		this.code = code;
		this.dccode = dccode;
		this.type = type;
		this.content = content;
		this.max_num = max_num;
		this.current_num = current_num;
		this.discount = discount;
	}





	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDccode() {
		return dccode;
	}
	public void setDccode(String dccode) {
		this.dccode = dccode;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getMax_num() {
		return max_num;
	}
	public void setMax_num(int max_num) {
		this.max_num = max_num;
	}
	public int getCurrent_num() {
		return current_num;
	}
	public void setCurrent_num(int current_num) {
		this.current_num = current_num;
	}
	
	
	
	
	
	
	
	
}
