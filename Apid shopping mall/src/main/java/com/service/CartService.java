package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CartDAO;
import com.dto.CartDTO;
import com.dto.CouponDTO;
import com.dto.CouponUserDTO;

@Service
public class CartService {

	@Autowired
	CartDAO dao;

	public List<CartDTO> cartList(String mid) {
		// TODO Auto-generated method stub
		 List<CartDTO> list = null;
		 list = dao.cartList(mid);
		return list;
	}

	public int cartdelete(String cid) {
		// TODO Auto-generated method stub
		int list = 0;
		 list = dao.cartdelete(cid);
		return list;
	}

	public int cartUpdate(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		int list = 0;
		 list = dao.cartUpdate(map);
		return list;
	}

	public CouponDTO couponSelectByDCCode(String dccode) {
		// TODO Auto-generated method stub
		CouponDTO list = null;
		 list = dao.couponSelectByDCCode(dccode);
		return list;
	}

	public CouponUserDTO couponuserSelectByMid(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		CouponUserDTO list = null;
		 list = dao.couponuserSelectByMid(map);
		return list;
	}

	@Transactional
	public int TX_insertCouponUser(CouponUserDTO updateCouponUser) throws Exception{
		// TODO Auto-generated method stub
		int list = 0;
		 list = dao.TX_insertCouponUser(updateCouponUser);
		return list;
	}

	public CouponDTO couponSelectByCode(String code) {
		// TODO Auto-generated method stub
		CouponDTO list = null;
		 list = dao.couponSelectByCode(code);
		return list;
	}

	public List<CartDTO> selectAllCartByCids(ArrayList<Integer> list) {
		// TODO Auto-generated method stub
		List<CartDTO> m = null;
		 m = dao.selectAllCartByCids(list);
		return m;
	}
	
	
	
	
	
	
	
	
	
}
