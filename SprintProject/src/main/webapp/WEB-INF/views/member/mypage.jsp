<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- 배경역할을 하는 이미지 파일..  -->
<img class="wave" src="resources/images/svg/wave.png" alt="">


<!-- container는 2개박스를 가지고있다. img부분과 login-container gird로 2:1비율-->
<div class="container">
	<!-- 1번째 박스 , 이미지(svg) 슬라이드 , 외부 api(owl-carousel)사용했다. -->
	<div class="img">
		<!-- 클래스명은 정해져 있다. 마치 폰트 icon 이 클래스명이 정해진거처럼 -->
		<div class="owl-carousel owl-theme">
			<img src="resources/images/svg/bg10.svg" alt="" class="login_img">
			<img src="resources/images/svg/bg11.svg" alt="" class="login_img">
			<img src="resources/images/svg/bg12.svg" alt="" class="login_img">
			<img src="resources/images/svg/bg13.svg" alt="" class="login_img">
		</div>

	</div>
	<!-- 2번째 회원가입 step 폼형식 , 폼은 2개 존재한다. 소비자 회원가입, 판매자 회원가입.  -->
	<div class="login-container">
	
		<!-- 요기가 step 회원가입  부분, mypage랑 다른점은 이부분이 다르다.  -->
		<jsp:include page="subFile/mypageUpdateForm.jsp" flush="true"></jsp:include>

	</div>
</div>
<!-- end container -->



<!-- 다음 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<!-- 제이쿼리 .. -->
<script src="resources/js/jquery-3.5.1.min.js"></script>
<!-- 이게 svg 이미지들 자동 이동 api   -->
<!-- Owl-Carousel script-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
	integrity="sha256-pTxD+DSzIwmwhOqTFN+DB+nHjO4iAsbgfyFq5K5bcE0="
	crossorigin="anonymous"></script>

<!-- 코드가 너무 많아서 script문은 다 여기로 , 이미지 슬라이드 , 다음주소 , 버튼이벤트 , ajax , 비번확인 , email 이벤트 등이 있다 -->
<script src="resources/js/memberPage/mypage.js"></script>











