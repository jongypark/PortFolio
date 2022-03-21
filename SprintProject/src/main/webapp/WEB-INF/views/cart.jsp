<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="resources/css/main2.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
        integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
    <!-- font awesome  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
        integrity="sha512-PgQMlq+nqFLV4ylk1gwUOgm6CtIIXkKwaIHp/PAIWHzig/lKZSEGKEysh0TCVbHJXCLN7WetD8TFecIky75ZfQ=="
        crossorigin="anonymous" />

<link rel="stylesheet" href="resources/css/cart.css">
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    


</head>
<body>

<jsp:include page="common/navbar.jsp" flush="true"></jsp:include>
	
카트 화면
<jsp:include page="member/cart.jsp" flush="true"></jsp:include>

    <!-- custom js file link? -->
    <script src="resources/js/m_event.js"></script>
</body>
</html>



<!-- 
-부트스트랩.. 
grid 는 row 당 12칸이 존재한다. 
사이즈(이사이즈 이상에서는~~~~X칸을 차지한다~~~~) : 
Extra small(스마트폰): .col-xs-*
Small(테블릿): .col-sm-*
Medium(노트북? 992px정도): .col-md-*
Large(데스크탑? ) .col-lg-*

M/P
M : Margin P : Padding

- t , b , l , r ,x , y
t : top / b : bottom / l : left / r : right / x : x축 -> left , right / y : y축 -> top , bottom

-0, 1, 2, 3, 4, 5, auto
0 : 0
1 : .25rem( font-size가 16px이면, 4px) 크기
2 : .5rem( font-size가 16px이면, 8px) 크기
3 : 1rem( font-size가 16px이면, 16px) 크기
4 : 1.5rem( font-size가 16px이면, 24px) 크기
5 : 3rem( font-size가 16px이면, 48px) 크기
auto : margin의 자동으로 세팅
n1, n2, n3, n4, n5
n : negative을 의미
n1 : -.25rem( font-size가 16px이면, -4px) 크기
n2 : -.5rem( font-size가 16px이면, -8px) 크기
n3 : -1rem( font-size가 16px이면, -16px) 크기
n4 : -1.5rem( font-size가 16px이면, -24px) 크기
n5 : -3rem( font-size가 16px이면, -48px) 크기 

-->
<!-- gx / gy는  거터라고 하는데 그리드 시스템의 콘텐츠의 컴럼 사이드 패딩.. gap이라고 생각하면 된다. gy가 특이점 위아래 패딩, -->

     <!-- data-toggle을 collapse로 해야 아래 class="collapse가 안보이고 추가로
                                        href에 collapse의 id(지금은collapseExample)를 적어줘야 동작한다.
                                        a 태그는 data-toggle 과 href 
                                        button은 data-toggle 과 data-target="#id값"

                                        aria-expanded: 열린부분은 "true" 닫힌부분은 "false" <-이부분은 시각장애인 전용 스크린리더에 필요한듯. 
                                        aria-controls: 속성값은 본문이 보여지게될 부분의 id와 일치해야 한다. 
                                        자세한 내용:https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=ksh81850&logNo=220423080597
                                        -->
                                   