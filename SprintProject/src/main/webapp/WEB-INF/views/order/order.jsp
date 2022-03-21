<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.CouponDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 	CouponDTO dccode =(CouponDTO) session.getAttribute("dcCode");
 	List<CartDTO> cartlist = (List<CartDTO>) session.getAttribute("orderCartlist");
 	MemberDTO mdto = (MemberDTO) session.getAttribute("login_member");
 	System.out.print(dccode);
 	System.out.print(cartlist);
 	
 	
 	
 	int totalPrice =0;
 	String dataCode="x";
 	String dataType="x";
 	String dataDiscount="x";
 	String dataContent="x";
 	if(dccode != null){
 		dataCode= dccode.getCode();
 		dataType= dccode.getType();
 		dataDiscount = dccode.getDiscount();
 		dataContent = dccode.getContent();
 	}
 	
 %>   
    
    
<!-- 시멘틱 css <- div로 다하지 말고, 구별하기 쉽게 의미있는 이름을 div 대신 쓰자!!  (main, header,section,footer 등등) -->
 
<main class="container">
	<h1 class="heading">
      <ion-icon name="cart-outline"></ion-icon> Order Page
    </h1>
 	<form action="#">
	<!-- 총 2개의 박스를 가지고 있다. checkout 섹션과 cart 섹션 -->
    <div class="item-flex"> 
		
		<!-- 1. checkout 섹션 -->
		<!-- 1.1 개인정보를 담은 박스(personal_data) 1.2신용카드/무통장 폼의 정보가 있는 absolutely 박스   -->
		<section class="checkout">
			<h2 class="section-heading">인적 사항</h2>	
			
			
				<!-- 1.1 개인정보를 담은 박스(personal_data) -->
				<div class="personal_data">
					<div class="card-number">
                    	<label for="mname"  class="label-default">이름</label>
                        <input type="text" name="mname"  class="input-default" id="mname" value="<%=mdto.getMname() %>" required>
                    </div>
                    
					<div class="card-number">
                        <label for="mphone1"  class="label-default">전화번호</label>
                        <div class="col-3">
                            <input type="text" name="mphone1"  class="input-default" id="mphone1" value="<%=mdto.getMphone1() %>" required>-
                            <input type="text" name="mphone2"  class="input-default" id="mphone2" value="<%=mdto.getMphone2() %>" required>-
                            <input type="text" name="mphone3"  class="input-default" id="mphone3" value="<%=mdto.getMphone3() %>" required>
                        </div>  
                    </div>
                    
					<div class="card-number">
                        <label for="mpost" class="label-default">우편번호</label>
                        <div class="col-2">
                            <input type="text" name="mpost"  class="input-default" id="mpost" value="<%=mdto.getMpost() %>" required>
                            <button type="button" class="btn btn-primary" onclick="sample4_execDaumPostcode()">주소찾기</button>
                        </div>
                    </div>
                    
                    <div class="card-number">
                        <label for="maddress1" class="label-default">상세 주소</label>
                        <div class="col-2">
                        	<input type="text" name="maddress1" id="maddress1" class="input-default" value="<%=mdto.getMaddress1()%>" required>
                        	<input type="text" name="maddress2" id="maddress2" class="input-default" value="<%=mdto.getMaddress2() %>" required>
                        </div>
                    </div>
				 </div><!--end personal_data -->
				
				<!-- 1.2신용카드/무통장 폼의 정보가 있는 absolutely 박스   -->
				<div class="absolutely">
					<!-- 첫번째 absolute 신용카드 부분 -->
					<div class="multi-1" >
						<h2 class="section-heading">결제(신용카드)</h2>
						
						<div class="payment-form">
							<!-- 1.2.1  신용카드 계좌이체 2개버튼   -->
							<div class="payment-method">
								<button type="button" class="method selected ">
									<ion-icon name="card"></ion-icon>
									<span>신용카드</span>
									<ion-icon class="checkmark fill" name="checkmark-circle"></ion-icon>
								</button>
								<button type="button" class="method " id="account">
                        			<ion-icon name="logo-paypal"></ion-icon>
                        			<span>계좌 이체</span>
                       				<ion-icon class="checkmark " name="checkmark-circle-outline"></ion-icon>
                      			</button>
							</div>
							
							<!-- 1.2.2 카드정보 나열부분  -->
							<div class="cardholder-name">
                        		<label for="cardCompany" class="label-default">카드 회사</label>
                        		<input type="text" name="cardCompany" id="cardCompany" class="input-default" >
                      		</div>
                      		
                      		<div class="card-number">
                        		<label for="card-number" class="label-default">카드 번호</label>
                        		<input type="number" name="card-number" id="card-number" class="input-default" >
                      		</div>
                      		<!-- 유효날짜 cvv  -->
                      		<div class="input-flex">
                      			<!-- 2칸으로 나뉜다.  -->
                      			<div class="expire-date">
                      				<label for="expire-date" class="label-default">유효 날짜</label>
                      				<div class="input-flex">
                      					<input type="number" name="day" id="expire-date" placeholder="1~31" min="1" max="31"
                              			class="input-default" >
                            			/
                            			<input type="number" name="month"  placeholder="1~12" min="1" max="12" id="expire-month"
                              			class="input-default" >
                      				</div>
                      			</div>
                      			
                      			
                      			<div class="cvv">
                      				<label for="cvv" class="label-default">CVV</label>
                          			<input type="number" name="cvv" id="cvv" class="input-default" >
                      			</div>
							</div><!-- end input-flex  -->
						</div><!-- end payment-form -->
						
						<button class="btn btn-primary" id="payButton1">
                    		<b>Pay</b> $ <span id="payAmount1">2.15</span>
                  		</button>
					</div><!-- end multi-1  -->
					
					
					<!-- 두번째 absolute 계좌이체 부분 -->
					<div class="multi-2">
						<h2 class="section-heading">결제(계좌이체)</h2>
						
						<div class="payment-form">
							<!-- 1.2.1  신용카드 계좌이체 2개버튼   -->
							<div class="payment-method">
								<button type="button" class="method" id="cradit">
									<ion-icon name="card"></ion-icon>
									<span>신용카드</span>
									<ion-icon class="checkmark " name="checkmark-circle-outline"></ion-icon>
								</button>
								<button type="button" class="method selected" >
                        			<ion-icon name="logo-paypal"></ion-icon>
                        			<span>계좌 이체</span>
                       				<ion-icon class="checkmark fill" name="checkmark-circle"></ion-icon>
                      			</button>
							</div>
							
							<!-- 1.2.2 계좌정보 나열부분  -->
							<div class="cardholder-name">
                        		<label for="account1" class="label-default">농협 계좌</label>
                        		<input type="text"  id="account1" class="input-default" value="16511-5468-46512" readonly>
                      		</div>
                      		
                      		<div class="card-number">
                       			<label for="account1name" class="label-default">예금주</label>
                        		<input type="text"  id="account1name" class="input-default" value="에이콘1조 프로젝트" readonly>
                      		</div>
                      		
                      		<div class="cardholder-name">
                        		<label for="account2" class="label-default">입금 계좌</label>
                        		<input type="text" name="account2" id="account2" class="input-default" >
                      		</div>

							<div class="input-flex input-flex2">
								<div class="cvv">
                          			<label for="account2name" class="label-default">입금주</label>
                          			<input type="text" name="account2name" id="account2name" class="input-default" >
                        		</div>
                        		
                        		<div class="cvv">
                          			<label for="bank" class="label-default">은행</label>
                          			<select name="bank" id="bank">
                            			<option value="농협">농협</option>
                            			<option value="우리은행">우리은행</option>
                            			<option value="신한은행">신한은행</option>
                         			</select>
                        		</div>
							</div><!-- end input-flex2 -->
							
						</div><!-- end payment-form -->
						
						<button class="btn btn-primary" id="payButton2">
                    		<b>Pay</b> $ <span id="payAmount2">2.15</span>
                  		</button>
				
					</div><!-- end multi-2  -->
					
				</div><!-- end absolutely  -->
				
			
		</section><!-- end checkout section  -->
		
		
		
		<!-- 2. cart 섹션-->
		<!-- 2.1 카트박스 2.2 쿠폰 박스 2.3 가격박스가 있다.  -->
		<section class="cart">
			<!--  2.1 카트박스-->
			<div class="cart-item-box">	
				<h2 class="section-heading">Order Summery</h2>
				
<!-- 여기부터 반복문~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --> 
<%if(cartlist != null){
	for(int i=0 ; i< cartlist.size() ; i++){
		CartDTO dto = cartlist.get(i);
		
		String color = dto.getGcolor();
		if( color.equals("OneColor") ){
			color="One";
		};
		
		totalPrice += dto.getCqty() * dto.getGprice();
		
%>


				<input type="hidden" name="cids" value="<%=dto.getCid()%>">
				<div class="product-card">
					<div class="card">	
						<div class="img-box">
                      		<img src="resources/images/items/<%=dto.getGimage()%>" alt="" width="80px" class="product-img">
                    	</div>
                    	<div class="detail">
                    		<h4 class="product-name"><%=dto.getGname()%> </h4>
                    		<div class="product-qty">
                    			<span ><%=dto.getCsize()%>-<%=color%>(<%=dto.getCqty()%>ea)</span>
                    			<span ><span class="productPrice" id="price<%=dto.getCid()%>"><%=dto.getGprice() * dto.getCqty()%></span>원</span>
                    		</div>	
                    	</div>
					</div><!-- end card  -->
				</div><!-- end product-card -->
<%}};%>				
<!-- 여기까지 반복문~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->				
			</div><!-- end cart-item-box -->
			
			<!-- 2.2와 2.3을 묶은 wrapper 미디어쿼리용.  -->
			<div class="wrapper">
				<!-- 2.2 쿠폰 박스 -->
          		<div class="discount-token">	
          			<label for="discount-token" class="label-default"><span id="couponStatus" ></span></label>
          			<div class="wrapper-flex">
          				<div id="couponDiv" data-code="<%=dataCode %>" data-type="<%=dataType %>" data-content="<%=dataContent %>"  data-discount="<%=dataDiscount%>"></div>
          				<input type="text" name="discount-token" id="discount-token" class="input-default"
          				 <%if(dccode !=null){ %>  value="<%=dccode.getCode() %>" readonly      <%}; %>	
          				>
          				<div class="btns">
                      		<button type="button" class="btn btn-outline redPoint
                      		<%if(dccode ==null){ %>  hidden<%}; %>" id="couponOut"
                      		>제거</button>
                      		<button type="button" class="btn btn-outline 
                      		<%if(dccode !=null){ %>  hidden<%}; %>" id="couponIn">등록</button>
                    	</div>
          			</div>
          		</div><!-- end discount-token  -->
          		
          		<!-- 2.3 가격 박스 -->
          		<div class="amount">
          			<div class="subtotal">
                    	<span>상품가격</span> <span> <span id="subtotal"><%=totalPrice%></span>원</span>
                  	</div>

                  	<div class="tax">
                    	<span>배송비</span> <span> <span id="tax">3000</span>원</span>
                  	</div>

                  	<div class="shipping">
                    	<span>할인<span id="shippingContent"></span></span> <span><span id="shipping"></span>원</span>
                  	</div>
                  
                  	<div class="total">
                    	<span>Total</span> <span><span id="total"></span>원</span>
                  	</div>
                  	
                  	<button class="btn btn-primary" id="payButton3" >
                    		<b>Pay</b>  <span id="payAmount3"></span>원
                  	</button>
                  	
          		
          		</div><!-- end amount -->	
          		
			</div><!-- end wrapper  -->
			
		</section><!-- end cart section -->
	</div><!-- end item-flex  -->
	</form>
</main>
 

<!-- 다음 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<!-- 제이쿼리 .. -->
<script src="resources/js/jquery-3.5.1.min.js"></script>
<script src="resources/js/memberPage/order.js"></script>
 

 
 
 
    