package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("OrderProductDTO")
public class OrderProductDTO {

	private int opindex;
	private String code;
	private String bundle;
	public OrderProductDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderProductDTO(int opindex, String code, String bundle) {
		super();
		this.opindex = opindex;
		this.code = code;
		this.bundle = bundle;
	}
	@Override
	public String toString() {
		return "OrderProductDTO [opindex=" + opindex + ", code=" + code + ", bundle=" + bundle + "]";
	}
	public int getOpindex() {
		return opindex;
	}
	public void setOpindex(int opindex) {
		this.opindex = opindex;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getBundle() {
		return bundle;
	}
	public void setBundle(String bundle) {
		this.bundle = bundle;
	}
	
	
	
	
	
}
