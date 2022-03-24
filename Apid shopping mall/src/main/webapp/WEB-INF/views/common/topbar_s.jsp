<%@page import="com.dto.SellerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
       
<%
	SellerDTO dto = (SellerDTO)session.getAttribute("login_seller");
	String name = null;
	if ( dto !=null){
		name = dto.getSname() + "님 ";
	}
%>



<!-- 건들면 안되는 부분~~~~~~~~~~~~~~~~~~` -->

  <div class="seller-topbar">

	<!-- 햄버거 버튼 -->
	<div class="seller-toggle">
		<ion-icon name="menu-outline"></ion-icon>
	</div>
	<!-- search -->
	<div class="search">
		<label> <input type="text" placeholder="Search here">
			<ion-icon name="search-outline"></ion-icon>
		</label>
	</div>
	<!-- userImg -->

	<div class="userInfo">
		<span><%=name %></span>
		<div class="user">
			<img src="resources/images/user_s/user.jpg" alt="">
		</div>
	</div>

 </div><!-- end seller-topbar -->

<!--end 건들면 안되는 부분~~~~~~~~~~~~~~~~~~` -->
   