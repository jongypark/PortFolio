package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dto.BankAccountDTO;
import com.dto.CartDTO;
import com.dto.CouponUserDTO;
import com.dto.CreditCartDTO;
import com.dto.OrderChartDTO;
import com.dto.OrderDTO;
import com.dto.OrderProductDTO;
import com.dto.OrderProductDetailDTO;

@Service
public class OrderDAO {

	@Autowired
	SqlSessionTemplate session;

	
	public List<OrderDTO> orderChart(String mid) {
		// TODO Auto-generated method stub
		List<OrderDTO> list = session.selectList("OrderMapper.orderChart", mid);
		return list;
	}



	public String checkCreditCardByDTO(CreditCartDTO credit) {
		// TODO Auto-generated method stub
		String m=null;
		m = session.selectOne("OrderMapper.checkCreditCardByDTO" , credit);
		return m;
	}

	public int insertCreditCardByDTO(CreditCartDTO credit) {
		// TODO Auto-generated method stub
		int m=0;
		m = session.insert("OrderMapper.insertCreditCardByDTO" , credit);
		return m;
	}



	public String checkPayMentByCreditid(String creditid) {
		// TODO Auto-generated method stub
		String m=null;
		m = session.selectOne("OrderMapper.checkPayMentByCreditid" , creditid);
		return m;
	}

	public int insertPayMentByCreditid(String creditid) {
		// TODO Auto-generated method stub
		int m=0;
		m = session.insert("OrderMapper.insertPayMentByCreditid" , creditid);
		return m;
	}

	public String checkBankAccountByDTO(BankAccountDTO account) {
		// TODO Auto-generated method stub
		String m=null;
		m = session.selectOne("OrderMapper.checkBankAccountByDTO" , account);
		return m;
	}

	public int insertBankAccountByDTO(BankAccountDTO account) {
		// TODO Auto-generated method stub
		int m=0;
		m = session.insert("OrderMapper.insertBankAccountByDTO" , account);
		return m;
	}

	public String checkPayMentByBankid(String bankid) {
		// TODO Auto-generated method stub
		String m=null;
		m = session.selectOne("OrderMapper.checkPayMentByBankid" , bankid);
		return m;
	}

	public int insertPayMentByBankid(String bankid) {
		// TODO Auto-generated method stub
		int m=0;
		m = session.insert("OrderMapper.insertPayMentByBankid" , bankid);
		return m;
	}

	
	
	
	
	public int TXCartDelOrderIn(List<CartDTO> orderCartlist, String dcCode, OrderDTO odto) throws Exception {
		// TODO Auto-generated method stub
		int m=0;
		
		int size = orderCartlist.size();
		String bundle = "N";
		if ( size >1 ) {
			bundle ="Y";
		}
		System.out.println("TXCartDelOrderInDAO 시작" + dcCode);
		if ( dcCode == null) {
			
			System.out.println("dc: null");
		}
		//1단계 orderProduct 와 orderProductDetail에 등록하고 opindex반환하기
		
		//1.1 orderProduct 생성후 opnum 반환하기
		OrderProductDTO opdto = new OrderProductDTO(0, dcCode, bundle);
	
		
		
		int x =0;
		if( dcCode == null) {
			x = session.insert("OrderMapper.insertOrderProductBynoCode" ,opdto );
		}else {
			
			x = session.insert("OrderMapper.insertOrderProduct" ,opdto );
			//4. 쿠폰 사용한거면 쿠폰 사용한거로 바꾸기
			String code = opdto.getCode();
			String mid = odto.getMid();
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("code", code);
			map.put("mid" , mid);
			
			int u = session.update("CartMapper.updateCouponUserUsedByMap",map);
			
		}
	
			
		int opindex =0;
		if ( x != 0) {
			opindex = session.selectOne("OrderMapper.selectOrderProductSequence");
			
		}else {
			System.out.println("에러 발생");
			
		}
		
		
		System.out.println("orderDAO.opindex: " + opindex);
		
		ArrayList<Integer> cartcids = new ArrayList<Integer>();
		//1.2 orderProductDetail에 멀티 insert하기 
		for (CartDTO cart : orderCartlist) {
			
			OrderProductDetailDTO detaildto = new OrderProductDetailDTO();
			detaildto.setOpindex(opindex);
			detaildto.setGid(cart.getGid());
			detaildto.setGname(cart.getGname());
			detaildto.setGsize(cart.getCsize());
			detaildto.setGamount(cart.getCqty());
			detaildto.setGcolor(cart.getGcolor());
			detaildto.setGprice(cart.getGprice());
			detaildto.setGimage(cart.getGimage());
			
			cartcids.add(cart.getCid());
			//멀티 insert할라했는데 에러를 못잡겠다 ~~ 
			int q = session.insert("OrderMapper.insertOrderProductDetailBydto",detaildto);
			

			//3.1 재고 마이너스 하기
			int r = session.update("StockMapper.updateStockMinusByDTO", cart);
			
			//4. good테이블에서 gsell +하기.. 
			int t = session.update("GoodsMapper.updateGsell",cart);
			
			
			
		}
		
		//2단계 order 테이블에 위의  opindex 추가해서 등록하기 
		odto.setOpindex(opindex);
		
		int w = session.insert("OrderMapper.insertOrdersByDTO", odto);
	
		int oid = session.selectOne("OrderMapper.selectOrdersSequence");
		System.out.println("orders: 시퀀스:" + oid);
		
		//3.2 카트에서 제거하기 
		
		int y = session.delete("CartMapper.deleteAllByListDTO" , cartcids);
		
		
		
		
		
		
		return oid; // 등록한 orders테이블 oid 리턴하기 
		
		
		
		
	}



	public List<OrderChartDTO> orderChart_info(OrderChartDTO dto) {
		// TODO Auto-generated method stub
		List<OrderChartDTO> list = session.selectList("OrderMapper.info", dto);
		System.out.println(dto);
		return list;
	}



	public int return_goods(OrderProductDetailDTO dto) {
		// TODO Auto-generated method stub
		int num = session.update("OrderMapper.ret", dto);
		return num;
	}



	public int return_goods2(OrderDTO dto) {
		// TODO Auto-generated method stub\
		int num = session.update("OrderMapper.ref2", dto);
		return num;
	}




	






}
