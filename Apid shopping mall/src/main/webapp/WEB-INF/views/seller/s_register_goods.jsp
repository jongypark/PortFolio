<%@page import="com.sun.java.swing.plaf.motif.resources.motif"%>
<%@page import="com.dto.PageDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.SellerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:include page="../common/topbar_s.jsp" flush="true"></jsp:include>  
  	<link rel="stylesheet" href="resources/css/seller/s_register_goods.css">
  
  
<%

DecimalFormat f = new DecimalFormat(",###,###,###");//금액,수량 쉼표표시
int count = (int)session.getAttribute("listcount"); //상품현황 
int TotalGamount = (int)session.getAttribute("TotalGamount"); // 금일 판매수량
int MonthTotal = (int)session.getAttribute("MonthTotal"); // 현재 달 매출량
int DayTotal = (int)session.getAttribute("DayTotal");// 금일 매출량
String yearmonthday = (String)session.getAttribute("yearmonthday");//년도,월,일 데이터
String year = yearmonthday.substring(0, 4);//년도만 자르기
String month = yearmonthday.substring(5, 7);//월만 자르기
String day = yearmonthday.substring(8, 10);//일만 자르기
%>
	
<div class="cardBox">
	<div class="card">
		
		<div>
			<div class="numbers"><%=TotalGamount %></div>
			<div class="cardName">금일 판매수량</div>
		</div>
		<div class="iconBx">
			<ion-icon name="eye-outline"></ion-icon>
		</div>
	</div>
	<div class="card">
		<div>
			<div class="numbers"><%=count %></div>
			<div class="cardName">상품현황</div>
		</div>
		<div class="iconBx">
			<ion-icon name="basket-outline"></ion-icon>
		</div>
		
	</div>
	<div class="card">
		<div>
			<div class="numbers"><%=f.format(DayTotal)%></div>
			<div class="cardName"><%=month %>월 <%=day %>일 매출</div>
		</div>
		<div class="iconBx">
			<ion-icon name="chatbubbles-outline"></ion-icon>
		</div>
		
	</div>
	<div class="card">
	
		<div>
			<div class="numbers"><%=f.format(MonthTotal)%></div>
			<div class="cardName"><%=year %>년 <%=month %>월 매출</div>
		</div>
		<div class="iconBx">
			<ion-icon name="cash-outline"></ion-icon>
		</div>
	</div>
</div>
<hr>


<!-- 여기서부터 작성하면 됩니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<%
	SellerDTO seller = (SellerDTO)session.getAttribute("login_seller");
%>

<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script>
    var cnt = 0;
    function fn_addFile(){
       
       cnt++;
       for (var i = 0; i <5; i++) {
        if (i <= 5 ){ 
        $("#d_file").append("<br>" + "<input type='file' name='file" + i + "' />");
        }else if(i >= 5){
           break;
         alert("최대 5개까지 가능합니다.");
        }
       }
    }
</script>


<div class="modal"> <!-- 정중앙하는 센터링 역활 -->
	<div class="modal-content"><!-- 모달창이 된다  -->
		<div class="photo"></div> <!-- 이미지 구현 CSS -->
		<div class="desc"><!-- 내용구현 -->
			<div class="desc-header">
				<h2>- 상품 등록 -</h2><br>
				<button class="btn-close">&times;</button><!-- x특수기호 -->
			</div>
			<div class="desc-content">
			<form action="SellerGoodsAdd" method="post" enctype="multipart/form-data">
				<input type="text" name="gid" id="gid" placeholder="상품아이디를 입력해주세요">
				<input type="hidden" name="sid" id="sid" value="<%=seller.getSid()%>">
				<span id="result" class="idCheck"></span>
				
				<select name="gcategory" id="gcategory">
				<option>Select Category</option>
				<option>top</option>
				<option>bottom</option>
				<option>outer</option>
				<option>dress</option>
				</select>
				
				<input type="text" name="gname" id="gname" placeholder="상품이름을 입력해주세요 "><br>
				<input type="text" name="gprice" id="gprice" placeholder="상품가격을 입력해주세요 "><br>
				
				<input type="file" class="fileselect" name="image1" value="파일 선택"><br>
          		<input type="file" class="fileselect" name="image2" value="파일 선택"><br>
           		<input type="file" class="fileselect" name="image3" value="파일 선택"><br>
          	 	<input type="file" class="fileselect" name="image4" value="파일 선택"><br>
          	  	<input type="file" class="fileselect" name="image5" value="파일 선택"><br>
          	  	
          	  	<textarea type="text" name="gdetail" id="gdetail" rows="5" cols="30" placeholder="상품설명을 입력해주세요" ></textarea><br>
				<input type="submit" class="btn-style" id="sub" value="상품등록">
				</form>
			</div>
		</div>
	</div><!-- 모달창이 된다  -->
</div><!-- 정중앙하는 센터링 역활 -->
<div class="overlay"></div><!-- 모달창이열리면 바탕화면 어둡게 구현  -->
  

<%
	if(seller != null){
		
	  	String mesg = (String)session.getAttribute("mesg");
    	if(mesg != null){
    %>
    <script type="text/javascript">
    	alert("<%=mesg%>");
    </script>

    <%
    	} session.removeAttribute("mesg");
    %>
    
<html lang="en">
<div class="test">

<body>


<div class="container">
<section class="shopping-cart">
   <h1 class="heading">총 상품현황</h1>
				<form action="registerGoods">
					<select name="search">
						<option value="gcategory">카테고리(top,bottom,outer,dress)</option>
						<option value="gname" selected="selected">상품이름</option>
					</select>
					<input type="text" name="goodsSearch" size="50">
					<input type="submit" value="검색">
				</form>
				<button class="btn-open">상품등록하기</button>
				
   <table>

      <thead>
        <th>상품이미지</th>
		 	<th>상품 아이디</th>
		 	<th>상품이름</th>
		 	<th>상품가격</th>
		 	<th>상품 설명</th>
		 	<th>상품 카테고리</th>
		 	<th>수정/삭제</th>
      </thead>

      <tbody>
   <%
/*    	List<GoodsDTO> dto = (List<GoodsDTO>)session.getAttribute("list");
 */	PageDTO pdto = (PageDTO)session.getAttribute("pdto");
	List<GoodsDTO> dto = pdto.getList();
	String search = (String)session.getAttribute("search");
	String goodsSearch = (String)session.getAttribute("goodsSearch");
   
   for(int i=1; i<=dto.size(); i++){
	   GoodsDTO d = dto.get(i-1);
	   String gid = d.getGid();
	   String gcategory = d.getGcategory();
	   String gname = d.getGname();
	   int gprice = d.getGprice();
	   String gdetail = d.getGdetail();
	   String grdate = d.getGrdate();

   %>	
   

		 <tr>
		 	<td><img alt=""  height="100" src="resources/images/items/<%=d.getGimage1() %>"></td><!-- 수정구현 필 -->
			<td><input type="text" name="gid" id="gid<%=gid %>" value="<%=gid %>"></td>
			<td><input type="text" name="gname" id="gname<%=gid%>" value="<%=gname %>"></td>
			<td><input type="text" name="gprice" id="gprice<%=gid%>" value="<%=f.format(gprice) %>">
			<input type="submit" name="update" class="update" data-num ="<%=gid%>" value="update"></td>
			<td><input type="text" name="gdetail" id="gdetail<%=gid%>" value="<%=gdetail %>"></td>
			<td><input type="text" name="gcategory" id="gcategory<%=gid%>" value="<%=gcategory %>"></td>
		    <td><button  class="delete"  data-num="<%=gid%>"> <i class="fas fa-trash"></i> remove</button></td>
		</tr>
		 <tr class="table-bottom">
         </tr>

<%
   } //end for
%>
 <tr>
     <td colspan="7">
   	<%
   	int curPage = pdto.getCurPage();//3 
    int perPage = pdto.getPerPage();//2 
	int totalCount = pdto.getTotalCount();//13
	int totalPage = totalCount/perPage;//총필요페이지 
	if(totalCount%perPage!= 0) totalPage++;//나머지페이지 추가 
    for(int i=1; i<= totalPage; i++){
      	if(i== curPage){//3 인경우 
      		out.print(i+"&nbsp;");
    }else{
  		out.print("<a href='registerGoodsPage?curPage="+i+"&search="+search+"&goodsSearch="+goodsSearch+"'>"+i+"</a>&nbsp;");
    }
    }
%>
</td>
</tr>
	
</table>
</form>
 <%
	}else{
 %>  
 <h2>상품이 존재하지 않습니다.</h2>  
   <%
	}
   %>
   </section>
   </div>
	</body>
   </div>
  </html>
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js">
</script>
<script src="resources/js/seller/s_register_goods.js"></script>

