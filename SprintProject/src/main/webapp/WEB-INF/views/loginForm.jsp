<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="resources/css/main2.css">
<link rel="stylesheet" href="resources/css/loginForm.css">
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<jsp:include page="common/navbar.jsp" flush="true"></jsp:include>
<h1>로그인폼 화면입니다.</h1>

	<jsp:include page="member/loginForm.jsp" flush="true"></jsp:include>



 <!-- custom js file link? -->
    <script src="resources/js/m_event.js"></script>

</body>
</html>