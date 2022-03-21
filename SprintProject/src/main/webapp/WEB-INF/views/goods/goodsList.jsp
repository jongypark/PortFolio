<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <link rel="stylesheet" href="resources/css/category.css">
 
 <%
 List<GoodsDTO> goodsList = (List<GoodsDTO>) request.getAttribute("goodsList");
 
 %>
 

<div class="image-container">
 	<h1 class="heading">our <%=goodsList.get(0).getGcategory() %> goods</h1>
	<div class="box-container">
	
<%
	for(int i =0 ; i < goodsList.size() ; i++){
		GoodsDTO dto = goodsList.get(i);		
%>
		 <div class="box">
			<div class="image">
				<img alt="" src="resources/images/items/<%=dto.getGimage1() %>">
			</div>
			<div class="image-content">
				<h3><%=dto.getGname() %></h3>		
				<p><span><%=dto.getGdetail() %></span>  </p>
				 <a href="goodsRetrieve?gid=<%=dto.getGid()%>" class="btn">read more</a><!-- href안에 	dto.getGid() -->
				<div class="image-icons">
					<span> 조회수:<%=dto.getGhit() %>   </span>
					<span> <%=dto.getGprice() %>원  </span>
				</div>
			</div>
		</div><!--end box  -->
				
<%}; %>		
	</div><!-- end box-container -->
</div><!-- end container -->



