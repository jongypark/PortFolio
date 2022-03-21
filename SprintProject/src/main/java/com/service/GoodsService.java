package com.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GoodsDAO;
import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.StockDTO;

@Service
public class GoodsService {

	@Autowired
	GoodsDAO dao;

	public List<GoodsDTO> selectAllByCategory(String gCategory) {
		// TODO Auto-generated method stub
		List<GoodsDTO> list = dao.selectAllByCategory(gCategory);
		return list;
	}

	public GoodsDTO goodsRetrieve(String gid) {
		// TODO Auto-generated method stub
		GoodsDTO dto = dao.goodsRetrieve(gid);
		return dto;
	}

	public int GhitPlusOne(String gid) {
		// TODO Auto-generated method stub
		int dto = dao.GhitPlusOne(gid);
		return dto;
	}

	public int cartAdd(CartDTO dto) {
		// TODO Auto-generated method stub
		int m = dao.cartAdd(dto);
		return m;
	}

	public List<StockDTO> stockRetrieve(String gid) {
		List<StockDTO> list = dao.stockRetrieve(gid);
		return list;
	}

	public int goodsRetrieveStockCheck(StockDTO dto) {
		int stock = dao.goodsRetrieveStockCheck(dto);
		return stock;
	}

	public int cartStock(StockDTO sdto) {
		int stock = dao.cartStock(sdto);
		return stock;
	}

	public List<StockDTO> goodsRetrieveStock(Map<String, String> map) {
		List<StockDTO> stock = dao.goodsRetrieveStock(map);
		return stock;
	}

	public CartDTO beforeCartAddCheck(CartDTO dto) {
		// TODO Auto-generated method stub
		CartDTO d = dao.beforeCartAddCheck(dto);
		return d;
	}

	public int updateCartAddCqty(CartDTO checkdto) {
		// TODO Auto-generated method stub
		int stock = dao.updateCartAddCqty(checkdto);
		return stock;
	}



	


}
