package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dao.OrderDAO;
import com.dto.BankAccountDTO;
import com.dto.CartDTO;
import com.dto.CouponUserDTO;
import com.dto.CreditCartDTO;
import com.dto.OrderChartDTO;
import com.dto.OrderDTO;
import com.dto.OrderProductDetailDTO;

@Service
public class OrderService {

	@Autowired
	OrderDAO dao;

	public List<OrderDTO> orderChart(String mid) {
		// TODO Auto-generated method stub
		List<OrderDTO> list = dao.orderChart(mid);
		return list;
	}



	public String checkCreditCardByDTO(CreditCartDTO credit) {
		// TODO Auto-generated method stub
		String m=null;
		m = dao.checkCreditCardByDTO(credit);
		return m;
	}

	public int insertCreditCardByDTO(CreditCartDTO credit) {
		// TODO Auto-generated method stub
		int m=0;
		m = dao.insertCreditCardByDTO(credit);
		return m;
	}


	public String checkPayMentByCreditid(String creditid) {
		// TODO Auto-generated method stub
		String m=null;
		m = dao.checkPayMentByCreditid(creditid);
		return m;
	}

	public int insertPayMentByCreditid(String creditid) {
		// TODO Auto-generated method stub
		int m=0;
		m = dao.insertPayMentByCreditid(creditid);
		return m;
	}

	public String checkBankAccountByDTO(BankAccountDTO account) {
		// TODO Auto-generated method stub
		String m=null;
		m = dao.checkBankAccountByDTO(account);
		return m;
	}

	public int insertBankAccountByDTO(BankAccountDTO account) {
		// TODO Auto-generated method stub
		int m=0;
		m = dao.insertBankAccountByDTO(account);
		return m;
	}

	public String checkPayMentByBankid(String bankid) {
		// TODO Auto-generated method stub
		String m=null;
		m = dao.checkPayMentByBankid(bankid);
		return m;
	}

	public int insertPayMentByBankid(String bankid) {
		// TODO Auto-generated method stub
		int m=0;
		m = dao.insertPayMentByBankid(bankid);
		return m;
	}

	@Transactional
	public int TXCartDelOrderIn(List<CartDTO> orderCartlist, String dcCode, OrderDTO odto)throws Exception {
		// TODO Auto-generated method stub
		int m=0;
		m = dao.TXCartDelOrderIn(orderCartlist ,dcCode ,odto );
		return m;
	}



	public List<OrderChartDTO> orderChart_info(OrderChartDTO dto) {
		// TODO Auto-generated method stub
		List<OrderChartDTO> list = dao.orderChart_info(dto);
		System.out.println("service");
		return list;
	}



	public int return_goods(OrderProductDetailDTO dto) {
		// TODO Auto-generated method stub
		int num = dao.return_goods(dto);
		return num;
	}



	public int return_goods2(OrderDTO dto) {
		// TODO Auto-generated method stub
		
		int num = dao.return_goods2(dto);
		return num;
	}
















	













	
}
