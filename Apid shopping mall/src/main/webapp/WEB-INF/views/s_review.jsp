<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="resources/css/seller/main_s.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- font awesome cdn link -->
<!-- icons모음  -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>


</head>
<body>

<!-- 컨테이너 시작 네비게이션과 main으로 나눈다.-->
<div class="seller-container">
<!-- 1. 네비게이션 -->
  <div class="seller-navigation">
 	<jsp:include page="common/navigation_s.jsp" flush="true"></jsp:include>
  </div><!-- end navigation -->	
<!-- 2. 메인 컨텐츠  -->	
  <div class="seller-main">	
		<jsp:include page="seller/s_review.jsp" flush="true"></jsp:include> 	
  </div> <!-- end seller-main  -->
</div><!-- end container  -->

<script type="text/javascript" src="resources/js/s_event.js"></script>
<script >

//0. 현재 페이지의 글자색깔 바꾸기 1.dashboard 2.상품등록 3.재고관리 4.리뷰관리 5.Q&A 6.반품정보 7.배송관리 
let list_a = document.querySelectorAll('.seller-navigation li a');

(function activePageLink(){

	list_a.forEach( function(item){ item.classList.remove('activePage') });

	// 이부분을 바꾸면 되겠다. 1.dashboard 2.상품등록 3.재고관리 4.리뷰관리 5.Q&A 6.반품정보 7.배송관리 
	list_a[4].classList.add('activePage');
})();

</script>



</body>
</html>