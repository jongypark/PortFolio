package com.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.StockDTO;

@Service
public class GoodsDAO {

	@Autowired
	SqlSessionTemplate session;

	public List<GoodsDTO> selectAllByCategory(String gCategory) {
		// TODO Auto-generated method stub
		 List<GoodsDTO> list = session.selectList("GoodsMapper.selectAllByCategory" , gCategory);
		return list;
	}

	public GoodsDTO goodsRetrieve(String gid) {
		// TODO Auto-generated method stub
		GoodsDTO dto = session.selectOne("GoodsMapper.goodsRetrieve" , gid);
		return dto;
	}

	public int GhitPlusOne(String gid) {
		// TODO Auto-generated method stub
		int dto = session.update("GoodsMapper.GhitPlusOne" , gid);
		return dto;
	}

	public int cartAdd(CartDTO dto) {
		// TODO Auto-generated method stub
		int m = session.insert("CartMapper.cartAdd" , dto);
		return m;
	}

	public List<StockDTO> stockRetrieve(String gid) {
		List<StockDTO> list = session.selectList("GoodsMapper.stockRetrieve",gid);
		return list;
	}

	public int goodsRetrieveStockCheck(StockDTO dto) {
		int stock = session.selectOne("GoodsMapper.goodsRetrieveStockCheck",dto);
		return stock;
	}

	public int cartStock(StockDTO sdto) {
		int stock = session.selectOne("GoodsMapper.cartStock",sdto);
		return stock;
	}

	public List<StockDTO> goodsRetrieveStock(Map<String, String> map) {
		List<StockDTO> stock = session.selectList("GoodsMapper.goodsRetrieveStock",map);
		return stock;
	}

	public CartDTO beforeCartAddCheck(CartDTO dto) {
		// TODO Auto-generated method stub
		CartDTO stock = session.selectOne("CartMapper.beforeCartAddCheck",dto);
		return stock;
	}

	public int updateCartAddCqty(CartDTO checkdto) {
		// TODO Auto-generated method stub
		int stock = session.update("CartMapper.updateCartAddCqty",checkdto);
		return stock;
	}

	
}
