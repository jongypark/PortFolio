package com.controller;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dto.CouponUserDTO;
import com.dto.GoodsDTO;
import com.dto.OrderDTO;
import com.dto.OrderProductDetailDTO;
import com.dto.PageDTO;
import com.dto.ReturnDTO;
import com.dto.SellerDTO;
import com.dto.StockDTO;
import com.dto.StockPageDTO;
import com.service.SellerService;

@Controller
public class SellerController {
	private static final String CURR_IMAGE_REPO_PATH = 
			"C:\\Users\\ASUS\\Desktop\\SpringProject\\SprintProject\\src\\main\\webapp\\resources\\images\\items";
	@Autowired
	SellerService service;
	
	//로그인
	@RequestMapping(value = "/loginS")
	public String loginS(@RequestParam HashMap<String, String> map ,  HttpSession session ) {
		SellerDTO dto =  service.login(map);
		
		if( dto == null) {
			session.setAttribute("loginfailed", "아이디 비번을 확인하세요");
			return "redirect:loginForm";
		}else {
			//2. 아이디 비번이 일치하면 session에 id/비번을 저장한다. 
			session.setAttribute("login_seller", dto);
			return "redirect:dashBoard";
		}		
	}
	
	
	//ajax로 id중복체그 부분
	@RequestMapping(value = "/idDuplicateCheckS")
	public @ResponseBody String idDuplicateCheckS(@RequestParam String sid) {
		System.out.println("ajaxs," + sid);
		String result =null;
		//1. idCheck하기 
		
		// mid가 공백으로 오면.. 
		if ( sid =="") { 
			System.out.println("공백");
			result ="failed";
		}else {
			// 공백이 아니면
			int m =0;
			m = service.idCheck(sid);
			// 0이면 중복이 아니니 사용가능한 아이디
			if( m == 0) {
				result ="success";
			}else {
				//1이면 사용불가능한 아이디 
				result ="duplicate";
			}
		}
		return result;// @ResponseBody가 있어서 주소가 아닌 String으로 전달된다.
	}
	
	//memberForm -> db에 회원정보등록
	@RequestMapping(value = "/sellerAdd")
	public String sellerAdd(SellerDTO dto , HttpSession session) {
		
		System.out.println("sellerAdd+" + dto);
		
		String nextpage =null;
		//1단계 db에 저장하기 
		int m = service.insert(dto);
		if ( m ==0) {
			System.out.println("sellerAdd db insert 실패");
			nextpage = "redirect:memberForm";//예상치못한 에러로 다시 회원가입폼으로이동
		}else {
			//2단계 session에 로그인 성공 메세지 저장하기
			session.setAttribute("sellerAdd", "Seller 회원가입성공");
			nextpage = "redirect:main";//회원가입성공, 메인페이지로.. 
		}
		return nextpage;
	}
	
	
	
	@RequestMapping(value = "/SellerGoodsAdd", method=RequestMethod.POST)
	   public String SellerGoodsAdd(GoodsDTO dto, HttpSession session,MultipartHttpServletRequest multipartRequest,
	            HttpServletResponse response )throws Exception {
	      
	      
	       multipartRequest.setCharacterEncoding("utf-8");
	        Map map = new HashMap();
	        Enumeration enu = multipartRequest.getParameterNames();

	        while(enu.hasMoreElements()) {
	            String name = (String)enu.nextElement();
	            String value = multipartRequest.getParameter(name);
	            map.put(name, value);
	        }
	        
	        List<String> fileList = fileProcess(multipartRequest);
	        
	        dto.setGimage1(fileList.get(0));
	        dto.setGimage2(fileList.get(1));
	        dto.setGimage3(fileList.get(2));
	        dto.setGimage4(fileList.get(3));
	        dto.setGimage5(fileList.get(4));
	        
	        System.out.println(dto);
	        
	        int num = service.SellerGoodsAdd(dto);
	        
	        HashMap<String, String> imageselectmap = new HashMap<String, String>();
	        imageselectmap.put("sid", dto.getSid());
	        
	        
	        map.put("fileList", fileList);
	        session.setAttribute("mesg", "상품등록 성공!");

	      return  "redirect:registerGoods";
	   }
	
	//----------------파일업로드 구역
    
    private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) 
        throws Exception{
        List<String> fileList = new ArrayList<String>();
        Iterator<String> fileNames = multipartRequest.getFileNames();
        
        
        while(fileNames.hasNext()) {
            String fileName = fileNames.next();
            MultipartFile mFile = multipartRequest.getFile(fileName);
            String originalFileName = mFile.getOriginalFilename();
            fileList.add(originalFileName);
            File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
            if(mFile.getSize() != 0) {
                if(!file.exists()) {
                    if(file.getParentFile().mkdir()) {
                        file.createNewFile();
                    }
                }
                mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + originalFileName));
            }
        }
        return fileList;
    }
 
 

//----------------파일업로드 구역
	
	@RequestMapping(value = "/selectpasswdS" , method = RequestMethod.GET)
	public void mailTest(@RequestParam SellerDTO dto ) {
		System.out.println("1234");
	}
	
	
	@RequestMapping(value = "/SellerGoodsIDCheck", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String SellerGoodsIDCheck(String gid) {

		int num = service.SellerGoodsIDCheck(gid);
		String mesg = "상품아이디 사용가능";
		if (num == 1) {
			mesg = "상품아이디 중복";
		}

		return mesg;
	}
	
	
	
	//로그인 성공 .. dashBoard 화면.. 
	@RequestMapping(value = "/dashBoard")
	public String dashBoard(HttpSession session, HttpServletRequest request) {
	
		
	SimpleDateFormat Month = new SimpleDateFormat("MM"); //현재 월 구하기
	SimpleDateFormat YearMonthDay = new SimpleDateFormat("YYYY-MM-dd"); //현재 월,일구하기
	Calendar time = Calendar.getInstance();// 날짜 구하기
	
	String month = Month.format(time.getTime()); // 월만 따로 뽑기
	String yearmonthday = YearMonthDay.format(time.getTime());//년, 월, 일 뽑기
	
	
	SellerDTO sellerdto = (SellerDTO)session.getAttribute("login_seller");
	String sid = sellerdto.getSid();
	
	List<OrderDTO> ordto = service.Monthlysales(sid); // 현판매자의 주문 상품들만 뽑기
	List<OrderProductDetailDTO> ordtodetail = service.TodaySalesQuantity(sid);// 금일 판매수량 뽑기
	List<CouponUserDTO> sale = service.TodaySaleMoney(sid);//할인 금액누적용 뽑기
	List<OrderDTO>  Recentorderstatus = service.Recentorderstatus(sid);//자신의 상품을 구매한 회원들의 최근주문현황(배송현황)
	List<OrderDTO> Rank = service.Rank(sid); //자신의 상품을 가장 많이 구매한 구매자의 순위
	List<GoodsDTO> Salesbycategory = service.Salesbycategory(sid); //원그래프 카테고리별 판매수량 합계
	List<OrderDTO> monthlysales = service.monthlysales(sid);// 막대그래프 월별 매출량
	int TotalUserCount = service.TotalUserCount(sid); //판매자의 상품을 1개라도 구매한 구매자의 수
	int Outofstockproduct = service.Outofstockproduct(sid);// 재고가 5개 이하인 재품들
	List<Integer> totalinventory = service.totalinventory(sid); // 총재고량
	
	
	
	
	int MonthTotal = 0; //월 판매금액 누적 변수생성
	for (OrderDTO dto : ordto) { // 현재 달에 모든 주문 뽑기 
		String ordate = dto.getOrdate().substring(5, 7); // 상품주문날짜 월만 뽑기
	if(ordate.equals(month)) { //현재 월과 주문날의 월이 같은 조건문 
		MonthTotal += dto.getOprice();// 월 총매출 금액 누적
	}//if
	}//for
	
	int DayTotal = 0; //당일 판매금액 누적 변수생성
	for (OrderDTO Daydto : ordto) {
		String YMDdate = Daydto.getOrdate();//주문 년도,월,일 저장
		if (YMDdate.substring(0, 10).equals(yearmonthday)){//DB에 등록된 시간,분,초 들어가이썽서 subString으로 년,월,일만 짜른다.
			DayTotal += Daydto.getOprice();//금일 매출 누적
		}
	}
	
	int TotalGamount = 0; // 당일 판매수량 누적 변수생성
	for (OrderProductDetailDTO Quantitiy : ordtodetail) {
		String date = Quantitiy.getOrdate();//주문날짜 뽑기
		if (date.substring(0, 10).equals(yearmonthday)) { // 현재날짜와 주문날짜 비교
			TotalGamount += Quantitiy.getGamount(); //당일 주문수량 누적해서 담기
		}
	}
	int TodaySaleMoney = 0; // 할인금익 누적 
	for (CouponUserDTO couponDTO : sale) {
		if(couponDTO.getUsedtime() != null) {
		String date = couponDTO.getUsedtime().substring(0, 10); //금일 주문날 년,월,일 뽑기
		String coupon = couponDTO.getCode(); // 쿠폰 데이터뽑기
		int gprice = couponDTO.getGprice(); // 원가 쿠폰이 안들어간 가격
		gprice += 3000;//배송비로인해 모든 주문상품 +3000
		if (date.equals(yearmonthday)) { //오늘날이란 주문날짜가 같은것만 
			if (coupon.equals("T-10")) {
			 TodaySaleMoney += (gprice - gprice * 0.1)-gprice; // 차액 결제 금액 누적 10%
		}else if (coupon.equals("T-20")) {
			 TodaySaleMoney += (gprice - gprice * 0.2)-gprice; // 차액 결제 금액 누적 20%
		}else if (coupon.equals("T-30")) {
			 TodaySaleMoney += (gprice - gprice * 0.3)-gprice; // 차액 결제 금액 누적 30%
		}else if (coupon.equals("D-All")) {
			 TodaySaleMoney += (gprice - 3000)-gprice; // 차액 결제 금액 누적 -3000 배송비
		}else if (coupon.equals("T-50")) {
			 TodaySaleMoney += (gprice - gprice * 0.5)-gprice; // 차액 결제 금액 누적 50%
		}//else end
		}//날짜 null이 아닐시 실행
		}//날짜 비교 if문 end
	}//for문 end
	
	int totalinventorys = 0; // 총재고량을 담음 변수
	for (Integer integer : totalinventory) {
		totalinventorys += integer; // 총재고수량을 누적 
	}
		
		
	session.setAttribute("MonthTotal", MonthTotal);//월 매출 금액 담기
	session.setAttribute("DayTotal", DayTotal);//금일 매출 금액 담기
	session.setAttribute("TotalGamount", TotalGamount);//금일 판매수량 담기
	request.setAttribute("TodaySaleMoney",TodaySaleMoney);//금일 할인 금액 담기
	request.setAttribute("Recentorderstatus",Recentorderstatus);//최근주문한 상품
	request.setAttribute("TotalUserCount",TotalUserCount);//판매자의 상품을 1개라도 구매한 고객의 수
	request.setAttribute("Rank",Rank);//판매자의 상품을 가장많이 구매한 고객순위
	request.setAttribute("Salesbycategory",Salesbycategory);//원그래프 카테고리별 판매량
	request.setAttribute("monthlysales",monthlysales);//막대그래프 월별 매출량
	request.setAttribute("month",month);// 현재 월 담기
	session.setAttribute("yearmonthday", yearmonthday); //현재 년,월,일 담기
	session.setAttribute("Outofstockproduct",Outofstockproduct);// 재고가 5개이하인제품들 수
	session.setAttribute("totalinventorys", totalinventorys); // 총재고량 누적 수 
	
		return  "main_seller";
	}
	
	//상품 등록 화면.. 
	@RequestMapping(value = "/registerGoods")
	public String registerGoods(HttpSession session , HttpServletRequest request, String search, String goodsSearch ) {
		SellerDTO seller = (SellerDTO) session.getAttribute("login_seller");
		
		String curPage = (String)request.getAttribute("curPage");
		
		if(curPage == null ){curPage = "1";}
		
		String sid = seller.getSid();
		
		System.out.println(sid);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("goodsSearch", goodsSearch);
		map.put("sid", sid);
		
		int count = 0;
		List<GoodsDTO> list = service.SellerGoodsList(sid);
		PageDTO pdto = service.SellergoodsPage(map,Integer.parseInt(curPage));
		
		
		for (int i = 0; i <= list.size(); i++) {
			count = i;
		}

		session.setAttribute("list", list);
		session.setAttribute("pdto", pdto);
		session.setAttribute("search", search);
		session.setAttribute("goodsSearch", goodsSearch);
		session.setAttribute("listcount", count);

		return  "s_register_goods";
	}
	
	@RequestMapping(value = "/registerGoodsPage")
	public String registerGoodsPage(String curPage,HttpServletRequest request,
			String search, String goodsSearch) {
		
		request.setAttribute("search", search);
		request.setAttribute("goodsSearch", goodsSearch);
		request.setAttribute("curPage",curPage);
		
		return "forward:registerGoods";
				
	}
	
	
	
	//상품현황 삭제
	@RequestMapping(value = "/SellerGoodsDelete")
	@ResponseBody//문자열로 리턴 jsp가아니라 
	public int SellerGoodsDelete(String gid, HttpSession session) {
		
		int num = service.SellerGoodsDelete(gid);

		int mesg = 0;
		if (num == 1) {
			mesg = 1;
		}
		
		return mesg; //jsp가아니라 문자열 ajax의 success부분의 data로 리턴 
	}
	
	//상품현황 수정
	@RequestMapping(value = "/SellerGoodsUpdate",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String SellerGoodsUpdate(GoodsDTO dto, HttpSession session) {
		System.out.println(dto);
		int num = service.SellerGoodsUpdate(dto);

		String mesg = "0";
		if (num == 1) {
			mesg = "1";
		}
		
		return mesg;
		
	}
	
	//재고 관리 화면.. (현황 재고등록 추가)
	@RequestMapping(value = "/stock")
	public String stock(HttpSession session, HttpServletRequest request,
			String stocksearch, String search ) {
		
		System.out.println(stocksearch);
		System.out.println(search);
		
		SellerDTO seller = (SellerDTO) session.getAttribute("login_seller");
		String sid = seller.getSid();
		
		String curPage = (String)request.getAttribute("curPage");
		if (curPage == null) {
			curPage = "1";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sid", sid);
		map.put("stocksearch", stocksearch);
		map.put("search", search);
		
		StockPageDTO list = service.SellerStockPage(map , Integer.parseInt(curPage));
		List<GoodsDTO> gDTO = service.SelectGoods(sid);//로그인 된 판매자의 상품리스 가져오기
		
		System.out.println(list);
		
		session.setAttribute("list", list);
		session.setAttribute("stocksearch", stocksearch);
		session.setAttribute("search", search);
		session.setAttribute("gDTO",gDTO);	
		
		return  "s_stock";
	}
	
	@RequestMapping(value = "/stockPage")
	public String stockPage(HttpServletRequest request, String curPage
			, String search, String stocksearch) {
		
		request.setAttribute("curPage", curPage);
		request.setAttribute("search", search);
		request.setAttribute("stocksearch", stocksearch);
		
		return "forward:stock";
	}
	
	
	
	
	//재고현황 수정
	@RequestMapping(value = "/SellerStockUpdate")
	@ResponseBody
	public String SellerStockUpdate(@RequestParam Map<String, String> map , HttpSession session) {
		
		int count = service.SellerStockUpdate(map);
		String mesg = "0";
		if(count == 1) {
			mesg = "1";
		}
		
		return mesg;
	}
	
	//재고현황 삭제
	@RequestMapping(value = "/SellerStockDelete")
	@ResponseBody
	public String SellerStockDelete(int num) {

		int count = service.SellerStockDelete(num);
		String mesg = "0";
		if (count == 1) {
			mesg = "1";
		}

	return mesg;
}
	// 재고 등록
	@RequestMapping(value = "/SellerStockAdd")
	public String SellerStockAdd(StockDTO dto, HttpSession session) {
		
		System.out.println(dto);
		
		int count = service.SellerStockAdd(dto);
		
		session.setAttribute("mesg", "재고등록 성공!");
		
		return "redirect:stock";
	}
	
	//재고 아이디체크
	@RequestMapping(value = "/SellerStockCheck")
	@ResponseBody
	public int SellerStockCheck(StockDTO dto) {
		System.out.println(dto);
		
		int count = service.SellerStockCheck(dto);

		int alert = 0;
		if (count == 1) {
			alert = 1;
		}
		
		return alert;
	}
	
	
	
	
	//리뷰 관리 화면.. 
	@RequestMapping(value = "/review")
	public String review() {
		
		return  "s_review";
	}
	
	//Q&A 관리 화면.. 
		@RequestMapping(value = "/qna")
		public String qna() {	
			
			return  "s_qna";
		}
	
		
		//반품정보 페이지
		@RequestMapping(value = "/returnGoods")
		public String returnGoods(HttpSession session) {
			
			System.out.println("반품현황");
			
			SellerDTO sdto = (SellerDTO) session.getAttribute("login_seller");
			String sid = sdto.getSid();

			
			List<ReturnDTO> list =  service.s_return(sid);
			System.out.println(list);
			
			session.setAttribute("return", list);
			
			return "s_return";		
		}
		
		
		
	//배송 관리 화면.. 
		@RequestMapping(value = "/delivery")
		public String delivery(HttpSession session) {
			System.out.println("베송관리");
			SellerDTO dto = (SellerDTO) session.getAttribute("login_seller");
			String sid = dto.getSid();
			
			List<OrderDTO> list = service.delivery(sid);
			System.out.println(list);
			
			
			
			session.setAttribute("del", list);
			
			
			return  "s_delivery";
		}
		//배송현황 수정
		@RequestMapping(value = "/deliveryupdate")
		@ResponseBody
		public String deliveryupdate(@RequestParam String odelivery,String oid,HttpSession session) {
			System.out.println("배송현황 수정");
			
			OrderDTO dto = new OrderDTO();
			dto.setOdelivery(Integer.parseInt(odelivery));
			dto.setOid(Integer.parseInt(oid));

			
			
			int num = service.deliveryupdate(dto);
		
			return "success";
		}
	
		
		
		
		
		
		
}
