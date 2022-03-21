<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="resources/css/main2.css">   
<link rel="stylesheet" href="resources/css/muitiTetris.css">   
     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멀티 테트리스 </title>
</head>
<body>

<jsp:include page="common/navbar.jsp" flush="true"></jsp:include>
	

<jsp:include page="socket/multiTetris.jsp" flush="true"></jsp:include>

    <!-- custom js file link? -->
    <script src="resources/js/m_event.js"></script>

</body>
</html>