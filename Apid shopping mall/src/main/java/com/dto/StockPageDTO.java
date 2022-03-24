package com.dto;

import java.util.List;

public class StockPageDTO {

	private List<StockDTO2> list; // 현재 페이지에 들어갈 레코드를 perPage만큼저장
	private int curPage; // 현재 볼 페이지
	private int perPage = 15; // 한페이지에 보여질 목록 수 2개 레코드
	private int totalCount; // 전체 레코드 수

	public StockPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StockPageDTO(List<StockDTO2> list, int curPage, int perPage, int totalCount) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.perPage = perPage;
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "StockPageDTO [list=" + list + ", curPage=" + curPage + ", perPage=" + perPage + ", totalCount="
				+ totalCount + "]";
	}

	public List<StockDTO2> getList() {
		return list;
	}

	public void setList(List<StockDTO2> list) {
		this.list = list;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

}
