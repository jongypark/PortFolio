<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dto.StockPageDTO"%>
<%@page import="com.dto.PageDTO"%>
<%@page import="com.dto.StockDTO2"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.dto.SellerDTO"%>
<%@page import="java.util.Set"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="com.dto.StockDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

   <jsp:include page="../common/topbar_s.jsp" flush="true"></jsp:include>  
	<link rel="stylesheet" href="resources/css/seller/stock.css">

  

<!-- 여기서부터 작성하면 됩니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
-->
<%
DecimalFormat f = new DecimalFormat(",###,###,###");//금액,수량 쉼표표시
StockPageDTO stockPage = (StockPageDTO)session.getAttribute("list"); // 등록 상품수
int Outofstockproduct = (int)session.getAttribute("Outofstockproduct"); // 재고부족한상품수 5개이하인
int totalinventorys = (int)session.getAttribute("totalinventorys");// 총재고수 
String yearmonthday = (String)session.getAttribute("yearmonthday");//년도,월,일 데이터
String year = yearmonthday.substring(0, 4);//년도만 자르기
String month = yearmonthday.substring(5, 7);//월만 자르기
String day = yearmonthday.substring(8, 10);//일만 자르기
int DayTotal = (int)session.getAttribute("DayTotal");// 금일 매출량
%>
<!-- 재고 관리 페이지 -->

<div class="cardBox">
	<div class="card">
		
		<div>
			<div class="numbers"><%=stockPage.getTotalCount()%>개</div>
			<div class="cardName">등록 상품 수</div>
		</div>
		<div class="iconBx">
			<ion-icon name="eye-outline"></ion-icon>
		</div>
	</div>
	<div class="card">
		<div>
			<div class="numbers"><%=Outofstockproduct %>개</div>
			<div class="cardName">재고 부족 상품</div>
		</div>
		<div class="iconBx">
			<ion-icon name="basket-outline"></ion-icon>
		</div>
		
	</div>
	<div class="card">
		<div>
			<div class="numbers"><%=f.format(DayTotal)%>원</div>
			<div class="cardName"><%=month %>월 <%=day %>일 매출</div>
		</div>
		<div class="iconBx">
			<ion-icon name="chatbubbles-outline"></ion-icon>
		</div>
		
	</div>
	<div class="card">
	
		<div>
			<div class="numbers"><%=totalinventorys %>개</div>
			<div class="cardName">총 재고량</div>
		</div>
		<div class="iconBx">
			<ion-icon name="cash-outline"></ion-icon>
		</div>
	</div>
</div>
<!-- end cardBox -->
<hr>

<hr>
<table  class="type07">
	<thead>
	<tr>
		<td class="category">카테고리</td>
		<td colspan="100" class="category">아이디 분류</td>
	</tr>
	</thead>
	<tbody>
	<tr>
		<th>Top</th>
	<%
	List<GoodsDTO> gidTlist = (List<GoodsDTO>)session.getAttribute("gDTO");
	String gidT =null; 
	for(GoodsDTO g : gidTlist){
		if(g.getGid().substring(0,1).equals("T")){
			gidT = g.getGid();
	%>
	<td><%=gidT %></td>
	<%
	}
	}
	%>
	</tr>
	<tr>
		<th>Bottom</th>
	<%
	List<GoodsDTO> gidBlist = (List<GoodsDTO>)session.getAttribute("gDTO");
	String gidB =null; 
	for(GoodsDTO g : gidBlist){
		if(g.getGid().substring(0,1).equals("B")){
			gidB = g.getGid();
	%>
	<td><%=gidB %></td>
	<%
	}
	}
	%>
	</tr> 
	<tr>
		<th>Dress</th>
	<%
	List<GoodsDTO> gidDlist = (List<GoodsDTO>)session.getAttribute("gDTO");
	String gidD =null; 
	for(GoodsDTO g : gidDlist){
		if(g.getGid().substring(0,1).equals("D")){
			gidD = g.getGid();
	%>
	<td><%=gidD %></td>
	<%
	}
	}
	%>
	</tr>
	<tr>
		<th>Outer</th>
	<%
	List<GoodsDTO> gidOlist = (List<GoodsDTO>)session.getAttribute("gDTO");
	String gidO =null; 
	for(GoodsDTO g : gidOlist){
		if(g.getGid().substring(0,1).equals("O")){
			gidO = g.getGid();
	%>
	<td><%=gidO %></td>
	<%
	}
	}
	%>
	</tr>
	</tbody>
</table>
<hr>
<!-- 재고현황 페이지  -->

<body>

<div class="modal"> <!-- 정중앙하는 센터링 역활 -->
	<div class="modal-content"><!-- 모달창이 된다  -->
		<div class="photo"></div> <!-- 이미지 구현 CSS -->
		<div class="desc"><!-- 내용구현 -->
			<div class="desc-header">
				<h2>- 재고 등록 -</h2><br>
				<button class="btn-close">&times;</button><!-- x특수기호 -->
			</div>
			<div class="desc-content">
			<form action="SellerStockAdd" method="get">
				<input type="text" name="gid" id="gid" placeholder="상품아이디를 입력해주세요">
				<input type="button" name="check" id="check" value="중복확인" size="10" >
				<select name="gsize" id="gsize" >
					<option>XS</option>
					<option>S</option>
					<option>M</option>
					<option>L</option>
					<option>XL</option>
				</select>
				<select name="gcolor" id="gcolor">
					<option>Black</option>
					<option>Navy</option>
					<option>Ivory</option>
					<option>White</option>
					<option>Gray</option>
					<option>Beige</option>
					<option>Pink</option>
				</select><br>
				<input type="text" name="gstock" id="gstock" placeholder="상품수량을 입력해주세요"><br>
				<button id="stockadd">재고 등록하기</button><br>
				</form>
				<h2>재고입력 주의사항</h2>
				<h3>아이디 중복값 주의!</h3>
			</div>
		</div>
	</div><!-- 모달창이 된다  -->
</div><!-- 정중앙하는 센터링 역활 -->
<div class="overlay"></div><!-- 모달창이열리면 바탕화면 어둡게 구현  -->
</body>






<html lang="en">
<div class="test">

<body>


<div class="container">

<section class="shopping-cart">

   <h1 class="heading">재고 현황</h1>
<form action="" method="get">
<form action="stock">
				<select name="search" class="search2">
					<option value="gname">상품이름</option>
				</select>
				<input type="text" name="stocksearch" size="20">
				<input type="submit" value="검색">
			</form>
				<button class="btn-open">재고등록하기</button>
			<div class="btn-open2">
			</div>
			
   <table>

      <thead>
         <th>상품 이미지</th>
         <th>상품 이름</th>
         <th>상품 사이즈</th>
         <th>상품 수량</th>
         <th>상품 색상</th>
         <th>비고</th>
      </thead>

      <tbody>


       
<%
 	List<StockDTO2> dto2 = stockPage.getList();
 	SellerDTO dto = (SellerDTO)session.getAttribute("login_seller");
 	String search = (String)session.getAttribute("search");
 	String stocksearch = (String)session.getAttribute("stocksearch");
 	
		String gid = "";
		String gname ="";
		String gSize ="";
		String gColor = "";
		int gStock =0;
		int num =0;
	 	String gimage = "";
			
if(dto != null){
	
	
	   for(int i=1; i<=dto2.size(); i++){
		StockDTO2 d = dto2.get(i-1);   
		gid = d.getGid();
		gname = d.getGname();
		gSize = d.getGsize();
		gColor = d.getGcolor();
		gStock = d.getGstock();
		num = d.getNum();
		gimage = d.getGimage1();
			 
%>	
  <tr>
  			<input type="hidden" name="sid" id="sid" value="<%=dto.getSid()%>">
  			<input type="hidden" name="num" id ="num" value="<%=num%>">
            <td><img src="resources/images/items/<%=gimage %>" height="100" alt=""></td>
            <td><input type="text" name="gname" id="gname<%=num %>"  value="<%=gname%>"></td>
            <td><input type="text" name="gsize" id="gsize<%=num %>" value="<%=gSize %>"></td>
            <td class="btn-by">
                  <input type="text" name="gstock" class="btn-stock" id="gstock<%=num %>" value="<%if(gStock <= 5 ){ %><%=gStock+" (재고발주 요청!) " %>
			<%}%><%=gStock%>">
                  <input type="submit" class="update btn-stock" data-num="<%=num%>" value="update">
            </td>
            <td><input type="text" name="gcolor" id="gcolor<%=num %>" value="<%=gColor %>"></td>
             <td><button  class="delete"  data-num="<%=num%>"> <i class="fas fa-trash"></i> remove</button></td>
         </tr>
         <tr class="table-bottom">
         </tr>
<%}
	   %>      
	   
	     <tr>
	  	<td colspan="6">
	  	<%
	  		int curPage = stockPage.getCurPage();
		   	int perPage = stockPage.getPerPage();
		   	int totalCount = stockPage.getTotalCount();
		   	int totalPage = totalCount/perPage; //총 필요 페이지
	  		if(totalCount%perPage != 0) totalPage++;
		   	for(int i = 1;  i<= totalPage; i++){
		   		if(i== curPage){
		   			out.print(i+"&nbsp;");
		   		}else{
		   			out.print("<a href='stockPage?curPage="+i+"&search="+search+"&stocksearch="+stocksearch+"'>"+i+"</a>&nbsp;");

		   		}
		   	}
	  	%>
	  	</td>
	  </tr>
</form>
<%
   }else{ ////sid,sid equals end 
%>
<br>
<h2>상품이 존재하지 않습니다.</h2>

    
 <%
		}
 %>     

      </tbody>

   </table>
</form>

</section>

</div>
   
<!-- custom js file link  -->
<script src="js/script.js"></script>

</body>
</div>
</html>
  
  
  
  
  
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js">
</script>
<script src="resources/js/seller/s_stock.js"></script>
   


    
    
    
    