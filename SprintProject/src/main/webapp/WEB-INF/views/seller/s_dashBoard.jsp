<%@page import="com.dto.GoodsDTO"%>
<%@page import="com.dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dto.SellerDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
 <jsp:include page="../common/topbar_s.jsp" flush="true"></jsp:include>  


<%
	DecimalFormat f = new DecimalFormat(",###,###,###");//금액,수량 쉼표표시
	int MonthTotal = (int)session.getAttribute("MonthTotal"); // 현재 달 매출량
	int DayTotal = (int)session.getAttribute("DayTotal");// 금일 매출량
	String Month = (String)request.getAttribute("month"); // 현재 달 표시
	String yearmonthday = (String)session.getAttribute("yearmonthday");//년도,월,일 데이터
	String year = yearmonthday.substring(0, 4);//년도만 자르기
	String month = yearmonthday.substring(5, 7);//월만 자르기
	String day = yearmonthday.substring(8, 10);//일만 자르기
	int TotalGamount = (int)session.getAttribute("TotalGamount");
	int TodaySaleMoney = (int)request.getAttribute("TodaySaleMoney");	
	List<OrderDTO> Recentorderstatus = (List<OrderDTO>)request.getAttribute("Recentorderstatus");
	int TotalUserCount =(int)request.getAttribute("TotalUserCount");
	List<OrderDTO> Rank = (List<OrderDTO>)request.getAttribute("Rank");
	List<GoodsDTO> Salesbycategory = (List<GoodsDTO>)request.getAttribute("Salesbycategory");
	List<OrderDTO> monthlysales = (List<OrderDTO>)request.getAttribute("monthlysales");
%>

<!-- 여기서부터 작성하면 됩니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<div class="cardBox">
	<div class="card">
		
		<div>
			<div class="numbers"><%=f.format(MonthTotal)%>원</div>
			<div class="cardName"><%=year%>년<%=month %>월 매출</div>
		</div>
		<div class="iconBx">
			<ion-icon name="eye-outline"></ion-icon>
		</div>
	</div>
	<div class="card">
		<div>
			<div class="numbers"><%=f.format(DayTotal)%>원</div>
			<div class="cardName"><%=month %>월<%=day %>일 매출</div>
		</div>
		<div class="iconBx">
			<ion-icon name="basket-outline"></ion-icon>
		</div>
		
	</div>
	<div class="card">
		<div>
			<div class="numbers"><%=TotalGamount %>개</div>
			<div class="cardName">금일 판매수량</div>
		</div>
		<div class="iconBx">
			<ion-icon name="chatbubbles-outline"></ion-icon>
		</div>
	</div>
	<div class="card">
	
		<div>
			<div class="numbers"><%=f.format(TodaySaleMoney)%>원</div>
			<div class="cardName">금일 할인 금액</div>
		</div>
		<div class="iconBx">
			<ion-icon name="cash-outline"></ion-icon>
		</div>
	</div>
</div>
<!-- end cardBox -->




 <!-- 차트 추가부분 -->

                <div class="graphBox">
                    
                    <div class="box">
                        <canvas id="myChart" ></canvas>
                    </div>
                    <div class="box">
                        <canvas id="earning" ></canvas>
                    </div>
                </div>
    
    
                <!-- 차트 추가부붑ㄴ 끝 -->

            <!-- order details list -->
            <div class="details">
                <!-- order details list -->
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>Recent Orders</h2>
                        <a href="#" class="btn">상품을 구매한 고객의 수 <%=TotalUserCount %>명</a>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <td>성함</td>
                                <td>주문금액</td>
                                <td>결제현황</td>
                                <td>배송현황</td>
                            </tr>
                        </thead>
                        <tbody>
                        <%for(OrderDTO dto : Recentorderstatus){
                        	String oname =dto.getOname();//주문자이름
                        	int oprice = dto.getOprice(); //가격
                        	String opay = dto.getOpaymentcheckstatus();//결제 상태
                        	String delivery = dto.getDeliverystatus();//배송상태
                        	
                        	String color = "";//조건문에 배송현황에 맞는 상태에 CSS클래스를 적용한거 담을 변수
                        	
                        	String  prepared = "Product being prepared"; // 상품 준비중 분홍색
                        	String acquisition = "product acquisition"; // 상품인수 초록색
                        	String preparing = "preparing for delivery";//배송준비중 노랑색
                        	String motion = "Product in motion"; //상품 이동중 주황색
                        	String shipping = "shipping"; //배송중 하늘색
                        	String completed = "Delivery completed";//배송완료 빨강색
                        	
                        	if(delivery.equals("상품인수")){
                        		color = acquisition;
                        	}else if(delivery.equals("배송준비중")){
                        		color = preparing;
                        	}else if(delivery.equals("상품이동중")){
                        		color = motion;
                        	}else if(delivery.equals("배송중")){
                        		color = shipping;
                        	}else if(delivery.equals("배송완료")){
                        		color = completed;
                        	}else if (delivery.equals("상품준비중")){
                        		color = prepared;
                        	}
                        	
                        	%>
                        	<tr>
                        		<td><%=oname %></td>
                        		<td><%=f.format(oprice) %></td>
                        		<td><%=opay %></td>
                        		<td><span class="<%=color%>"><%=delivery%></span></td>
                        	</tr>
                        <%} %>
                        </tbody>
                    </table>

                </div>
                <!-- New Customer -->
                <div class="recentCustomers">
                    <div class="cardHeader">
                        <h2>Recent Customers</h2>
                        <!-- <a href="#" class="btn">View All</a> -->
                    </div>
                    <table>
                        <tr>
                        <%for(OrderDTO ordto : Rank){%>
                            <td width="60px"><div class="imgBx"><img src="resources/images/user_s/img1.jpg" alt=""></div></td>
                            <td><h4><%=ordto.getOname() %><br><span>총 <%=f.format(ordto.getSum()) %>원</span></h4></td>
                        </tr>
                        <% } %>
                    </table>

                </div><!-- end recentCustomers -->

            </div><!-- end details  -->

        </div><!-- end seller-main  -->

    </div><!-- end seller-container  -->


<!-- icons모음  -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<!-- charts js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>
<!-- 그래프 출력  여기서부터-->
<%for(GoodsDTO dto : Salesbycategory){ 
	String category = dto.getGcategory();
	int gsell = dto.getGsell();%>
<div id="<%=category%>"  data-category="<%=category %>"  data-gsell="<%= gsell%>"></div>
<% }  %>

<%for(OrderDTO dto : monthlysales){
	String mth = dto.getOrdate();
	int sum = dto.getSum();
%>
<div id="<%=mth %>" data-sum="<%=sum%>"></div>
<%} %>
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
<script src="resources/js/my_chart.js" ></script>
<script>
$(function() {
	console.log($("#category").text());
})

</script>






