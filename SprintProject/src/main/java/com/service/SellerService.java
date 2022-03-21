package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SellerDAO;
import com.dto.CouponUserDTO;
import com.dto.GoodsDTO;
import com.dto.OrderChartDTO;
import com.dto.OrderDTO;
import com.dto.OrderProductDetailDTO;
import com.dto.PageDTO;
import com.dto.ReturnDTO;
import com.dto.SellerDTO;
import com.dto.StockDTO;
import com.dto.StockPageDTO;

@Service
public class SellerService {

	@Autowired
	SellerDAO dao;

	public SellerDTO login(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		SellerDTO dto = dao.login(map);
		return dto;
	}

	public int idCheck(String sid) {
		// TODO Auto-generated method stub
		int m = dao.idCheck(sid);
		return m;
	}

	public int insert(SellerDTO dto) {
		// TODO Auto-generated method stub
		int m = dao.insert(dto);
		return m;
	}

	public int SellerGoodsAdd(GoodsDTO dto) {
		int num = dao.SellerGoodsAdd(dto);
		return num;
	}

	public int SellerGoodsIDCheck(String gid) {
		int num = dao.SellerGoodsIDCheck(gid);
		return num;
	}

	public List<GoodsDTO> SellerGoodsList(String sid) {
		List<GoodsDTO> list = dao.SellerGoodsList(sid);
		return list;
	}

	public int SellerGoodsDelete(String gid) {
		int num = dao.SellerGoodsDelete(gid);
		return num;
	}

	public int SellerGoodsUpdate(GoodsDTO dto) {
		int num = dao.SellerGoodsUpdate(dto);
		return num;
	}

	public List<StockDTO> SelectStock(String sid) {
		List<StockDTO> sDTO = dao.SelectStock(sid);
		return sDTO;
	}

	public List<GoodsDTO> SelectGoods(String sid) {
		List<GoodsDTO> sDTO = dao.SelectGoods(sid);
		return sDTO;
	}

	public int SellerStockUpdate(Map<String, String> map) {
		int count = dao.SellerStockUpdate(map);
		return count;
	}

	public int SellerStockDelete(int num) {
		int num1 = dao.SellerStockDelete(num);
		return num1 ;
	}

	public int SellerStockAdd(StockDTO dto) {
		int num = dao.SellerStockAdd(dto);
		return num;
	}

	public int SellerStockCheck(StockDTO dto) {
		int count = dao.SellerStockCheck(dto);
		return count;
	}

	public List<GoodsDTO> selectgidT(String T) {
		List<GoodsDTO> gidT = dao.selectgidT(T);
		return gidT;
	}

	
	public PageDTO SellergoodsPage(HashMap<String, String> map, int curPage) {
		PageDTO dto = dao.SellergoodsPage(map, curPage);
		return dto;
	}

	public StockPageDTO SellerStockPage(HashMap<String, String> map, int curPage) {
		StockPageDTO dto = dao.SellerStockPage(map, curPage);
		return dto;
	}


	

	public List<OrderDTO> Monthlysales(String sid) {
		List<OrderDTO> dto = dao.Monthlysales(sid);
		return dto;
	}

	public List<OrderProductDetailDTO> TodaySalesQuantity(String sid) {
		List<OrderProductDetailDTO> dto = dao.TodaySalesQuantity(sid);
		return dto;
	}

	public List<CouponUserDTO> TodaySaleMoney(String sid) {
		List<CouponUserDTO> dto = dao.TodaySaleMoney(sid);
		return dto;

	}

	public List<OrderDTO> Recentorderstatus(String sid) {
		List<OrderDTO> dto = dao.Recentorderstatus(sid);
		return dto;
	}

	public int TotalUserCount(String sid) {
		int num = dao.TotalUserCount(sid);
		return num;
	}


	public List<OrderDTO> Rank(String sid) {
		List<OrderDTO> dto = dao.Rank(sid);
	  return dto;
	}

	public List<GoodsDTO> Salesbycategory(String sid) {
		List<GoodsDTO> dto = dao.Salesbycategory(sid);
		return dto;
	}

	public List<OrderDTO> monthlysales(String sid) {
		List<OrderDTO> dto = dao.monthlysales(sid);
		return dto;
	}

	public List<OrderDTO> delivery(String sid) {
		// TODO Auto-generated method stub
		List<OrderDTO> list = dao.delivery(sid);
		return list;
	}

	public int Outofstockproduct(String sid) {
		int num = dao.Outofstockproduct(sid);
		return num;
	}

	public List<Integer> totalinventory(String sid) {
		List<Integer> list = dao.totalinventory(sid);
		return list;
	}

	public int deliveryupdate(OrderDTO dto) {
		// TODO Auto-generated method stub
		int num = dao.deliveryupdate(dto);
		System.out.println(num);
		System.out.println("서비스");
		return num;
	}

	public List<ReturnDTO> s_return(String sid) {
		// TODO Auto-generated method stub
		List<ReturnDTO> list = dao.s_return(sid);
		return list;
	}

	





	 

	
	
	
}
