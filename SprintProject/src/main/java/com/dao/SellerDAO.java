package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dto.CouponUserDTO;
import com.dto.GoodsDTO;
import com.dto.OrderChartDTO;
import com.dto.OrderDTO;
import com.dto.OrderProductDetailDTO;
import com.dto.PageDTO;
import com.dto.ReturnDTO;
import com.dto.SellerDTO;
import com.dto.StockDTO;
import com.dto.StockDTO2;
import com.dto.StockPageDTO;

@Service
public class SellerDAO {

	@Autowired
	SqlSessionTemplate session;

	public SellerDTO login(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		SellerDTO dto = session.selectOne("SellerMapper.login" , map);
		return dto;
	}

	public int idCheck(String sid) {
		// TODO Auto-generated method stub
		int m = session.selectOne("SellerMapper.idCheck",sid);
		return m;
	}

	public int insert(SellerDTO dto) {
		// TODO Auto-generated method stub
		int m = session.insert("SellerMapper.insert",dto);
		return m;
	}

	public int SellerGoodsAdd(GoodsDTO dto) {
		int num = session.insert("GoodsMapper.SellerGoodsAdd",dto);
		return num;
	}

	public int SellerGoodsIDCheck(String gid) {
		int num =session.selectOne("GoodsMapper.SellerGoodsIDCheck",gid);
		return num;
	}

	public List<GoodsDTO> SellerGoodsList(String sid) {
		List<GoodsDTO> list = session.selectList("GoodsMapper.SellerGoodsList",sid);
		return list;
	}

	public int SellerGoodsDelete(String gid) {
		int num = session.delete("GoodsMapper.SellerGoodsDelete",gid);
		return num;
	}

	public int SellerGoodsUpdate(GoodsDTO dto) {
		int num = session.update("GoodsMapper.SellerGoodsUpdate",dto);
			return num;
	}

	public List<StockDTO> SelectStock(String sid) {
		List<StockDTO> sDTO = session.selectList("StockMapper.selectSellergoods",sid);
		return sDTO;
	}

	public List<GoodsDTO> SelectGoods(String sid) {
		List<GoodsDTO> sDTO = session.selectList("StockMapper.selectgoods",sid);
		return sDTO;
	}

	public int SellerStockUpdate(Map<String, String> map) {
		int count = session.update("StockMapper.SellerStockUpdate",map);
		return count;
	}

	public int SellerStockDelete(int num) {
		int num1 = session.delete("StockMapper.SellerStockDelete",num);
		return num1;
	}

	public int SellerStockAdd(StockDTO dto) {
		int num = session.insert("StockMapper.SellerStockAdd",dto);
		return num;
	}

	public int SellerStockCheck(StockDTO dto) {
		int count = session.selectOne("StockMapper.SellerStockCheck",dto);
		return count;
	}

	public List<GoodsDTO> selectgidT(String T) {
		List<GoodsDTO> gidT =session.selectList("StockMapper.selectgidT",T);
		return gidT;
	}

	
	public PageDTO SellergoodsPage(HashMap<String, String> map, int curPage) {
		PageDTO pdto = new PageDTO();
		
		System.out.println(map);
		
		int perPage = pdto.getPerPage();
		int offset = (curPage - 1) * perPage;
		List<GoodsDTO> list = session.selectList("GoodsMapper.SellergoodsPage", map, new RowBounds(offset, perPage));

		pdto.setCurPage(curPage);// 해당페이지번호 
		pdto.setList(list); //해당페이지 해당 데이터
		pdto.setTotalCount(totalCount(session, map));
		return pdto;
	}

	public int totalCount(SqlSessionTemplate session2, HashMap<String, String> map) {
		return session.selectOne("GoodsMapper.SellergoodsPagetotalcount", map);
	}

	public StockPageDTO SellerStockPage(HashMap<String, String> map, int curPage) {
		StockPageDTO pdto = new StockPageDTO();
		int perPage = pdto.getPerPage();
		int offset = (curPage - 1) * perPage;
		List<StockDTO2> list = session.selectList("StockMapper.SellerStockPage", map, new RowBounds(offset, perPage));
		
		
		pdto.setCurPage(curPage);
		pdto.setList(list);
		pdto.setTotalCount(totalStockCount(map));
		
		return pdto;
	}

	private int totalStockCount(HashMap<String, String> map) {
		return session.selectOne("StockMapper.totalStockCount",map);
	}





	public List<OrderDTO> Monthlysales(String sid) {
		List<OrderDTO> dto = session.selectList("SellerMapper.Monthlysales",sid);
		return dto;
	}

	public List<OrderProductDetailDTO> TodaySalesQuantity(String sid) {
		List<OrderProductDetailDTO> dto = session.selectList("SellerMapper.TodaySalesQuantity",sid);
		return dto;
	}

	public List<CouponUserDTO> TodaySaleMoney(String sid) {
		List<CouponUserDTO> dto = session.selectList("SellerMapper.TodaySaleMoney",sid);
		return dto;
	}


	public List<OrderDTO> Recentorderstatus(String sid) {
		List<OrderDTO> dto = session.selectList("SellerMapper.Recentorderstatus",sid);
		return dto;
	}

	public int TotalUserCount(String sid) {
		int num = session.selectOne("SellerMapper.TotalUserCount",sid);
		return num;
	}


	public List<OrderDTO> Rank(String sid) {
		List<OrderDTO> dto = session.selectList("SellerMapper.Rank",sid);
		return dto;
	}

	public List<GoodsDTO> Salesbycategory(String sid) {
		List<GoodsDTO> dto = session.selectList("SellerMapper.Salesbycategory",sid);
		return dto;
	}

	public List<OrderDTO> monthlysales(String sid) {
		List<OrderDTO> dto = session.selectList("SellerMapper.monthlysales",sid);
		return dto;
	}

	public List<OrderDTO> delivery(String sid) {
		// TODO Auto-generated method stub
		List<OrderDTO> list = session.selectList("SellerMapper.del", sid);
		return list;
	}

	public int Outofstockproduct(String sid) {
		int num = session.selectOne("SellerMapper.Outofstockproduct",sid);
		return num;
	}

	public List<Integer> totalinventory(String sid) {
		List<Integer> list = session.selectList("SellerMapper.totalinventory",sid);
		return list;
	}

	public int deliveryupdate(OrderDTO dto) {
		// TODO Auto-generated method stub
		int num = session.update("SellerMapper.deliveryupdate",dto);
		return num;
	}

	public List<ReturnDTO> s_return(String sid) {
		// TODO Auto-generated method stub
		List<ReturnDTO> list = session.selectList("SellerMapper.return", sid);
		return list;
	}


	

}
