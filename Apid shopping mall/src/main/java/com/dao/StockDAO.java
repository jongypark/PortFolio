package com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dto.CartDTO;

@Service
public class StockDAO {

	@Autowired
	SqlSessionTemplate session;

	public int stockCheckByCartDTO(CartDTO dto) {
		// TODO Auto-generated method stub
		int m = 0;
		m = session.selectOne("StockMapper.stockCheckByCartDTO", dto);
		return m;
	}
}
