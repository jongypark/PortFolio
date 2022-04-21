package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.CouponUserDTO;
import com.dto.MemberDTO;
import com.dto.OrderChartDTO;
import com.dto.OrderDTO;
import com.dto.OrderProductDetailDTO;
import com.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	OrderService service;
	//주문조회
	@RequestMapping(value = "/loginCheck/orderChart")
	public String orderChart(HttpSession session){
		System.out.println("주문조회 기능");
		MemberDTO mdto = (MemberDTO)session.getAttribute("login_member");
		String mid = mdto.getMid();
		List<OrderDTO> list = service.orderChart(mid);
		System.out.println(list);
		session.setAttribute("orderChart", list);
		return "redirect:../orderChart";
	}
	
	@RequestMapping(value = "/orderChart")
	public String ordercart2() {
		return "orderChart";
	}
	
	//개별반품처리
	@RequestMapping(value = "/return_goods")
	@ResponseBody
	public String return_goods(String gid,OrderProductDetailDTO dto,
			String confirmed) {
		System.out.println("반품완료");
		
		dto.setConfirmed(Integer.parseInt(confirmed));
		dto.setGid(gid);
		
		int num = service.return_goods(dto);
		System.out.println(num);
	
		return "success";
	}
	
	
	//묶음 반품
	@RequestMapping(value = "return_goods2")
	@ResponseBody
	public String return_goods2(OrderDTO dto,String oconfirmed,String oid) {
		
		System.out.println("묶음 반품");
		
		dto.setOconfirmed(Integer.parseInt(oconfirmed));
		dto.setOid(Integer.parseInt(oid));
		
		int num = service.return_goods2(dto);
		System.out.println(num);		
	
		return "success";
	}
	
	
	
	
	//주문상세조회
	@RequestMapping(value = "/orderChart_info")
	public  ModelAndView orderChart_info(int oid,HttpSession session) {
		System.out.println("구매자정보조회");
		//컨트롤러 동작확인 
		MemberDTO mdto = (MemberDTO)session.getAttribute("login_member");
		String mid = mdto.getMid();
		//로그인한 소비자정보 파싱
		System.out.println(oid);
		System.out.println(mid);
		//데이터 확인
		OrderChartDTO dto = new OrderChartDTO();
		dto.setMid(mid);
		dto.setOid(oid);
		//dto에 파싱한데이터 입력
		List<OrderChartDTO> list = service.orderChart_info(dto);	
		//데이터를 List에 넣어서 서비스로 전달
		System.out.println(list);
		//출력된데이터 확인
		ModelAndView mav = new ModelAndView();
		mav.addObject("info", list);
		mav.setViewName("orderChart_info");
		//데이터를 ModelAndView에 담아서 전달
		return mav;
	}
	
	
	
	
	
	
}
