<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- 아이오닉 아이콘  -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<!-- 이미지 슬라이스 라이브러리  -->
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
 
<link rel="stylesheet" href="resources/css/main2.css">
<link rel="stylesheet" href="resources/css/mainpage.css">
    
    <%
    //1.소비자  회원가입 성공 실패 alert출력
    
    String memberAdd = (String) session.getAttribute("memberAdd"); 
    
    if(memberAdd !=null ){
    %>
    <script>
    	alert("<%=memberAdd %>");
    </script>
    
    <%}; session.removeAttribute("memberAdd"); %>
    
     <%
    //2. 판매자  회원가입 성공 실패 alert출력
    
    String sellerAdd = (String) session.getAttribute("sellerAdd"); 
    
    if(sellerAdd !=null ){
    %>
    <script>
    	alert("<%=sellerAdd %>");
    </script>
    
    <%}; session.removeAttribute("sellerAdd"); %>
    
    
     <%
    //3.로그아웃 성공 메세지 띄우기
    
    String logout = (String) request.getAttribute("logout"); 
    
    if(logout !=null ){
    %>
    <script>
    	alert("<%=logout %>");
    </script>
    
    <%};  %>
    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- font awesome cdn link -->

</head>
<body>

<jsp:include page="common/navbar.jsp" flush="true"></jsp:include>
	

<jsp:include page="member/main.jsp" flush="true"></jsp:include> 
    <!-- custom js file link? -->
    <script src="resources/js/m_event.js"></script>

</body>
</html>