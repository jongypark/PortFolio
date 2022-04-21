package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("CouponUserDTO")
public class CouponUserDTO {

	private int cmind;// 시퀀스로 pk값
	private String code;
	private String mid;
	private int used;// 쿠폰 사용했냐?
	private String issuedtime;// 쿠폰 발급받은 날짜.
	private String usedtime;// 쿠폰 사용한 날짜.
	// -------------------//
	private int gprice; // 금일 쿠폰 할인금액을 위해 변수추가
	// -------------------//

	public CouponUserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CouponUserDTO(int cmind, String code, String mid, int used, String issuedtime, String usedtime, int gprice) {
		super();
		this.cmind = cmind;
		this.code = code;
		this.mid = mid;
		this.used = used;
		this.issuedtime = issuedtime;
		this.usedtime = usedtime;
		this.gprice = gprice;

	}

	@Override
	public String toString() {
		return "CouponUserDTO [cmind=" + cmind + ", code=" + code + ", mid=" + mid + ", used=" + used + ", issuedtime="
				+ issuedtime + ", usedtime=" + usedtime + ", gprice=" + gprice + "]";
	}

	public int getCmind() {
		return cmind;
	}

	public int getGprice() {
		return gprice;
	}

	public void setGprice(int gprice) {
		this.gprice = gprice;
	}

	public void setCmind(int cmind) {
		this.cmind = cmind;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getUsed() {
		return used;
	}

	public void setUsed(int used) {
		this.used = used;
	}

	public String getIssuedtime() {
		return issuedtime;
	}

	public void setIssuedtime(String issuedtime) {
		this.issuedtime = issuedtime;
	}

	public String getUsedtime() {
		return usedtime;
	}

	public void setUsedtime(String usedtime) {
		this.usedtime = usedtime;
	}

}
