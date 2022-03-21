<%@page import="com.dto.MemberDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 소비자 로그인일 경우 
	
	MemberDTO login_member = (MemberDTO )session.getAttribute("login_member");
	
%>

<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		
		$(".passwd-selectM").on("click", function() {//소비자용
			
			window.open("passwdselect", 
						"passwdselect",
						"width=476px height=315px"); //비밀번호 찾기위해 새로운창 열림 
		})
		$(".passwd-selectS").on("click", function() {//판매자용
			
			window.open("sellerpasswdselect", 
						"sellerpasswdselect",
						"width=400px height=250px"); //비밀번호 찾기위해 새로운창 열림 
		})
	
	})//end ready
	
</script>
<!-- header section starts -->
<div class="nav-container">

	<header class="header">
	
		 <a href="/shopMiniMallProject_chul/" class="logo"><i class="fas fa-bug"></i>Aphid</a>
		 <nav class="navbar">
	         <div id="close-navbar" class="fas fa-times"></div>
	         <a href="/shopMiniMallProject_chul/">Home</a>
	         <a href="goodsList?gCategory=top">Top</a>
	         <a href="goodsList?gCategory=dress">Dress</a>
	         <a href="goodsList?gCategory=outer">Outer</a>
	         <a href="goodsList?gCategory=bottom">Bottom</a>
	      </nav>
		
		  <!-- 로그인과 메뉴바 아이콘 -->
	      <div class="icons">      
	       <!-- 로그인 성공시 -->
	    
	          <div id="account-btn" class="fas fa-user <%if( login_member != null){ %> hide <%} %>"></div>   
			  <a href="loginCheck/cart"><div id="cart-btn" class="fas fa-shopping-cart <%if( login_member == null){ %> hide <%} %>"></div></a>
			  <div id="member-btn" class="fas fa-user-plus <%if( login_member == null){ %> hide <%} %>" ></div> 
			  <a href="loginCheck/logout"><div id="logout-btn" class="fas fa-sign-out-alt <%if( login_member == null){ %> hide <%} %>"></div></a>
				 
			 <div id="menu-btn" class="fas fa-bars"></div>
	      </div>
	
	</header>
	
	<!-- account form section starts 로그인 아이콘 클릭시~~~-->
	
	    <div class="account-form">
	
	        <div id="close-form" class="fas fa-times"></div>
	
	        <div class="buttons">
	            <span class="btn-main login-btn active">소비자</span>
	            <span class="btn-main seller-btn">판매자</span>
	        </div>
	
	<!-- 소비자 로그인폼 처음에는 active 상태이다.  -->
	        <form action="loginM" class="login-form active" method="post">
	            <h3>login form</h3>
	            <input type="text" name="mid" placeholder="아이디를 입력하세요" class="login-box">
	            <input type="password" name="mpw" placeholder="enter your password" class="login-box">
	            <div class="flex">
	                <a href="memberForm">회원가입</a>
	                <a href="#" class="passwd-selectM">비번찾기</a>
	            </div>
	            <input type="submit" value="login now" class="btn-main">
	        </form>
	<!-- 판매자 로그인 폼 -->
	        <form action="loginS" class="seller-form" method="post">
	            <h3>login form</h3>
	            <input type="text" name="sid" placeholder="판매자 아이디를 입력하세요" class="login-box">
	            <input type="text" name="spw" placeholder="enter your password" class="login-box">
	            <div class="flex">
	                <a href="memberForm">회원가입</a>
	                <a href="#" class="passwd-selectS">비번찾기</a>
	            </div>
	            <input type="submit" value="login now" class="btn-main">
	        </form>
	    </div>
	
	
	
	<!-- account form section ends -->	
		
		
	<!-- 로그인 성공시 member-btn 시작~~~~~ -->
	
	<div class="member-form">
	
	    <div id="close-member" class="fas fa-times"></div>
	    <nav class="navbar2">
	        <a href="loginCheck/cart">장바구니</a>
	        <a href="loginCheck/mypage">마이페이지</a>
	        <a href="loginCheck/orderChart">주문확인</a>
	        <a href="singleTetris">테트리스(싱글)</a>
	        <a href="multiTetris">테트리스(멀티)</a>	        
	        <a href="loginCheck/logout">로그아웃</a>
	    </nav>
	
	
	</div>

<!-- 로그인 성공시 member-btn 끝~~~~~ -->
	
</div>
	
	
	
	
	