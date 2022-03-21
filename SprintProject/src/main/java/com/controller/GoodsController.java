package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.CartDTO;
import com.dto.CouponDTO;
import com.dto.CouponUserDTO;
import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.dto.StockDTO;
import com.service.CartService;
import com.service.GoodsService;
import com.service.StockService;

@Controller
public class GoodsController {
	@Autowired
	GoodsService service;
	@Autowired
	CartService cservice;
	
	@RequestMapping(value = "/goodsList")
	public ModelAndView goodsList(String gCategory) {
		ModelAndView mav = new ModelAndView();		
		List<GoodsDTO> list = service.selectAllByCategory(gCategory);		
		mav.addObject("goodsList", list);
		mav.setViewName("category");	
		return mav;
	}
	
	//ajax goodsRetrieve에서 add to cart로 cart에 추가 담기 
	// db에 stock 추가해서 이부분도 고쳐야한다~~~~~~~~~~~~~~~~~~~~~~~```<- 수정시 제거하기 
	@RequestMapping(value = "/cartAdd")
	public @ResponseBody String cartAdd(CartDTO dto , HttpSession session ) {
		
		//1. 추가 파싱하기
		MemberDTO mdto = (MemberDTO) session.getAttribute("login_member");
		GoodsDTO gdto = service.goodsRetrieve(dto.getGid());	
		dto.setMid(mdto.getMid());
		dto.setGname(gdto.getGname());
		dto.setGprice(gdto.getGprice());
		dto.setGimage(gdto.getGimage1());
		dto.setGcategory(gdto.getGcategory());

		// stock 정보도 받아서 추가하기.. gid와 사이즈와 컬러값 넘겨서 수량 받아오기.. <- 수정시 제거하기 
		//gid,gcolor,gsize
		StockDTO sdto = new StockDTO();
		sdto.setGid(dto.getGid());
		sdto.setGsize(dto.getCsize());
		sdto.setGcolor(dto.getGcolor());
		
	
		
		int stock = service.cartStock(sdto);
		dto.setStock(stock);
		
		
		//2. cart db에 저장하기
		
		// 수정사항.. 있으면 수량만 업데이트 하기 
		CartDTO checkdto = null;
		checkdto = service.beforeCartAddCheck(dto);
		int m =0;
		
		if ( checkdto == null) {
			//없으면 추가하기
			m =service.cartAdd(dto);
		}else {
			// 있으면 수량만 업데이트하기
			int cqty = dto.getCqty() + checkdto.getCqty();
			checkdto.setCqty(cqty);
			
			m = service.updateCartAddCqty(checkdto);
		}
		
		
		
		
		if( m ==0) {
			System.out.println("cartAdd insert실패");
			return "failed";
		}else {
			//db담기 성공
			return "success";
		}
		
	}
	
	@RequestMapping(value = "/cartdelete")
	public @ResponseBody String cartdelete(String cid) {
		String result="success";
		
		int m=0;
		m = cservice.cartdelete(cid);
		if ( m ==0) {
			result="falied";
		}
		
		return result;
	}
	
	@RequestMapping(value = "/loginCheck/coupon")
	public @ResponseBody CouponDTO coupon(@RequestParam String dccode , HttpSession session) {
		
		CouponDTO result= new CouponDTO();
		result.setCode("test");
		MemberDTO mdto = (MemberDTO) session.getAttribute("login_member");
		String mid = mdto.getMid();
		
		// code가 coupon에 있는 쿠폰이다? 분기시작
		//1. 이미 내아이디로 등록된경우 
			//1.1 이미사용함 -> 벌써 사용한 쿠폰입니다. 
			//1.2 아직사용하지 않음
		//2. 등록되지않은경우
			//2.1 아직 쿠폰에 여유가 있다. -> 아이디 couponuser에 등록하기 , coupon의 current_num +1하기
			//2.2 다 발급한 쿠폰이다-> 에러:모든 쿠폰이 소진되었습니다
		//3. dccode가 다르다? -> 잘못 입력하셨습니다. 
		
		//1.2와 2.1만 쿠폰 데이터를 보낸다. 
		
		
		//1. dc코드가 다르다? 
		CouponDTO coupondto = cservice.couponSelectByDCCode(dccode);
		
		//1. dc 코드가 다르다. 
		if( coupondto ==null) {
			result.setCode("failed");
		//2. 분기, 이미 couponuser 테이블에 등록된경우? 혹은 등록되지 않은경우				
		}else {
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("code", coupondto.getCode());
			map.put("mid", mid);
			
			CouponUserDTO userdto = cservice.couponuserSelectByMid(map);
			//2.1 couponuser에 등록되지 않았다. 
			if( userdto == null) {
				
				System.out.println("등록되지 않음");
				int max = coupondto.getMax_num();
				int curr = coupondto.getCurrent_num();
				
				// 2.1.1 지금 쿠폰발급량에 여유가 있으면 couponuser DB에 등록하기
				if ( curr < max) {
					CouponUserDTO updateCouponUser = new CouponUserDTO();
					updateCouponUser.setCode(coupondto.getCode());
					updateCouponUser.setMid(mid);
					
					int l =0;
					
					try {
						 l = cservice.TX_insertCouponUser(updateCouponUser);
						
						
					} catch (Exception e) {
						// TODO: handle exception
						System.out.println("에러발생해서 롤백 처리.");
					}
					
					
					//tx결과 
					if( l == 0) {
						System.out.println("쿠폰유저테이블 insert 실패");
						result.setCode("TXerror");
					//tx 성공 couponuser db에 등록 + coupon db current_num++ 성공
					}else {
					// 쿠폰의 content와 code 보내기 
						result.setCode(coupondto.getCode());
						result.setContent(coupondto.getContent());
						result.setType(coupondto.getType());
						result.setDiscount(coupondto.getDiscount());
					
					}
				//2.1.2 쿠폰 발급량에 여유가 없다. 	
				}else {
					result.setCode("failed2");
				}
			//2.2 counponuser에 등록되있다. 	
			}else {
				// 2.2.1 이미 사용한 쿠폰이다.
				if (userdto.getUsed() == 1) {
					result.setCode("used");
				// 2.2.2 사용가능한 쿠폰이다. 	
				}else {
					result.setCode(coupondto.getCode());
					result.setContent(coupondto.getContent());
					result.setType(coupondto.getType());
					result.setDiscount(coupondto.getDiscount());
				
				}
			}//end 2. dc코드 가 이미 등록된경우 if/else	
		}//end 1. dc코드가 다를때
		return result;
	}
	
	
	
	
	
	
	@RequestMapping(value = "/loginCheck/ordercheck")
	public String ordercheck(String [] cids, String code , RedirectAttributes attr , HttpSession session) {
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		boolean flag = true;
		//1. 카트DB 에 구매하고자 하는 cid의 수량정보 수정하기 
		// 멀티 insert로 할걸.... 
		for (String s : cids) {
			String [] cidjson = s.split(":");
			HashMap<String, String> map = new HashMap<String, String>();
			String cid = cidjson[0];
			String cqty = cidjson[1];
			map.put("cid", cid);
			map.put("cqty", cqty);
			
			int m =0;
			m = cservice.cartUpdate(map);
			if(m ==0) {
				System.out.println("ordercheck update에러");
				flag =false;
				break;
			}else {
				list.add(Integer.parseInt(cid));
			}
		}
		//2. 카트DB update 문제없으면.. 
		if(flag) {
			if (code != "x") {
				CouponDTO cpdto = cservice.couponSelectByCode(code);
				if(cpdto == null) {
					System.out.println("order select에러");
				}else {
					session.setAttribute("dcCode", cpdto);
					
				}
			}
			//변경하기..... 
			
			List<CartDTO> cartlist = cservice.selectAllCartByCids(list);
			session.setAttribute("orderCartlist", cartlist);
			
			
			
			return "redirect:../order";
		}else {
			return "redirect:../loginCheck/cart";
		}
		
		
	}
	
	@RequestMapping(value = "/order")
	public String order() {
		return "order";
	}
	
	
	
	
	
	// 현재는 gooddto 2개만 보내지만, 앞으로 게시판, 리뷰정보 등등. 많이 고쳐야한다. 여기 정말 많이 바껴야 한다. 
	@RequestMapping(value = "/goodsRetrieve")
	public ModelAndView goodsRetrieve(@RequestParam String gid ,HttpServletRequest request, HttpSession session) {		
		ModelAndView mav = new ModelAndView();		
		GoodsDTO dto = service.goodsRetrieve(gid);	
		
		
		//gid에 대한 아이디 재고현황 리스트 뽑기 
		List<StockDTO> sdto = service.stockRetrieve(gid);
		
		List<String> size = new ArrayList<String>(); //사이즈를 담을 리스트
		List<String> color = new ArrayList<String>();//사이즈를 담을 컬러
		
		for(StockDTO s : sdto ) {
		size.add(s.getGsize()); //재고현황리스트에 사이즈만 생성된 List에 넣는다
		color.add(s.getGcolor()); // 재고현황리스트에 컬러만 생성된 List에 넣는다.
		}
		
		List<String> sizelist = size.stream().distinct().collect(Collectors.toList()); //여러개의 중복사이즈 데이터중 중복된 데이터를 제거
		List<String> colorlist = color.stream().distinct().collect(Collectors.toList());//여러개의 중복사이즈 데이터중 중복된 데이터를 제거
		
		if( dto == null) {
			//주소로 gid를 보내기때문에 그럴 가능성은 적지만.. 			
			mav.setViewName("main");			
		}else {
			
			//조회수 +1 여기까지 오면 gid에는 문제가 없으니 검증은 끝난것.. 
			int m = 0;
			m = service.GhitPlusOne(gid);	
			
			// gid에 맞는 상품정보를 mav에 담에서 보낸다. 
			mav.addObject("goodsRetrieve", dto);
			mav.addObject("sizelist", sizelist);
			mav.addObject("colorlist", colorlist);
			mav.addObject("sdto", sdto);
			mav.setViewName("goodsRetrieve");
		}
		return mav;		
	}
	
	
	@RequestMapping(value = "/goodsRetrieveStock")
	@ResponseBody
	public List<StockDTO> goodsRetrieveStock(@RequestParam Map<String, String> map, HttpServletRequest request) {
		
		List<StockDTO> stock = service.goodsRetrieveStock(map);
		
		return stock;
	}
	
	// cart화면... 
	@RequestMapping(value = "/loginCheck/cart")
	public String loginCheckCart() {
		return "redirect:../cart";
	}
	
	// 이러면 loginCheck쓴 의미가 없지않나? 그런데 이렇게 안하면 주소창에서 /cart쓰면 접근이 되서 에러나는데? 
	@SuppressWarnings("unused")
	@RequestMapping(value = "/cart")
	public String cart(HttpSession session , Model m ) {

		MemberDTO dto = (MemberDTO) session.getAttribute("login_member");
		String mid = dto.getMid();
		String nextpage ="cart";
		if ( dto == null) {
			nextpage = "redirect:loginForm";
		}else {
		
			// 1. id에 맞는 카트 꺼내오기.. 
			List<CartDTO> list = cservice.cartList(mid);
			
			if(list == null) {
				System.out.println("cart select에러");
			}else {
				// 2. 
				m.addAttribute("cartlist", list);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
			    Calendar c1 = Calendar.getInstance();
				String today = sdf.format(c1.getTime());
				c1.add(Calendar.DATE, +2);
				String nextday = sdf.format(c1.getTime());
				String delieveryDay = today +"~" + nextday;
				
				m.addAttribute("delevertDay", delieveryDay);
			}
			
			
		}	
		return nextpage;
	}
	
	@RequestMapping(value = "/goodsRetrieveStockCheck")
	@ResponseBody
	public int goodsRetrieveStockCheck(StockDTO dto) {
		
		
		int stock = service.goodsRetrieveStockCheck(dto);
		
		System.out.println(dto);
		
		return stock;
				
	}
	
	
	
	
}
