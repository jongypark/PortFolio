package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.StockDAO;
import com.dto.CartDTO;

@Service
public class StockService {

	@Autowired
	StockDAO dao;

	public int stockCheckByCartDTO(CartDTO dto) {
		// TODO Auto-generated method stub
		int m = 0;
		m = dao.stockCheckByCartDTO(dto);
		
		return m;
	}
	
	
	
	
	
	
}
