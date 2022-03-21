package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dto.CartDTO;
import com.dto.CouponDTO;
import com.dto.CouponUserDTO;

@Service
public class CartDAO {

	@Autowired
	SqlSessionTemplate session;

	public List<CartDTO> cartList(String mid) {
		// TODO Auto-generated method stub
		List<CartDTO> list = null;
		list = session.selectList("CartMapper.cartList" , mid);
		return list;
	}

	public int cartdelete(String cid) {
		// TODO Auto-generated method stub
		int list = 0;
		list = session.delete("CartMapper.cartDelete" , Integer.parseInt(cid));
		return list;
	}

	public int cartUpdate(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		int list = 0;
		list = session.update("CartMapper.cartUpdate" , map);
		return list;
	}

	public CouponDTO couponSelectByDCCode(String dccode) {
		// TODO Auto-generated method stub
		CouponDTO list = null;
		list = session.selectOne("CartMapper.couponSelectByDCCode" , dccode);
		return list;
	}

	public CouponUserDTO couponuserSelectByMid(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		CouponUserDTO list = null;
		list = session.selectOne("CartMapper.couponuserSelectByMid" , map);
		return list;
	}

	public int TX_insertCouponUser(CouponUserDTO updateCouponUser) {
		// TODO Auto-generated method stub
		//1. coupon current_num update
		String code = updateCouponUser.getCode();
		int m = session.update("CartMapper.couponPlusCurrentNum",code );
		
		//2. couponuser에 등록하기
		int n = session.insert("CartMapper.insertCouponUser", updateCouponUser);
		
		return m+n;
	}

	public CouponDTO couponSelectByCode(String code) {
		// TODO Auto-generated method stub
		CouponDTO list = null;
		list = session.selectOne("CartMapper.couponSelectByCode" , code);
		return list;
	}

	public List<CartDTO> selectAllCartByCids(ArrayList<Integer> list) {
		// TODO Auto-generated method stub
		List<CartDTO> m = null;
		m = session.selectList("CartMapper.selectAllCartByCids" , list);
		return m;
	}
}
