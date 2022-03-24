<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<link rel="stylesheet" href="resources/css/main2.css">
<link rel="stylesheet" href="resources/css/memberForm.css">

<!-- Owl-Carousel --><!-- 이게 svg 이미지들 자동 이동 api 링크   -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
integrity="sha256-UhQQ4fxEeABh4JrcmAJ1+16id/1dnlOEVCFOxDef9Lw=" crossorigin="anonymous" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
integrity="sha256-kksNxjDRxd/5+jGurZUJd1sdR2v+ClrCl3svESBaJqw=" crossorigin="anonymous" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    

</head>
<body>

<jsp:include page="common/navbar.jsp" flush="true"></jsp:include>
	


<jsp:include page="member/memberForm.jsp" flush="true"></jsp:include>


    <!-- custom js file link? -->
    <script src="resources/js/m_event.js"></script>

</body>
</html>