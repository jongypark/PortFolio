<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    //1.소비자  회원가입 성공 실패 alert출력
    
    String loginfailed = (String) session.getAttribute("loginfailed"); 
    
    if(loginfailed !=null ){
    %>
<script>
    	alert("<%=loginfailed %>");
    </script>

<%}; session.removeAttribute("loginfailed"); %>





<!-- id, 패스워드 입력 검사 후 진행하도록  작성  -->
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


<div class="container-loginForm">
	<div class="forms-container">
		<div class="signin-ms">
			<!--1. 소비자 로그인 폼  -->
			<form action="loginM" class="signin-m-form" method="post">
				<h2>로그인</h2>
				<div class="input-field">
					<i class="fas fa-user"></i> 
					<input type="text" name="mid" placeholder="UserName">
				</div>
				<div class="input-field">
					<i class="fas fa-lock"></i> 
					<input type="password" name="mpw" placeholder="Password">
				</div>
				<div class="input-text">
					<a href="memberForm">회원가입</a> <!-- 수정~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
					 <a href="" class="passwd-selectM">비번찾기</a>
				</div>
				<input type="submit" value="Login Now" class="btn-loginForm solid1">

				<p class="social-text">Or Sign in with social platforms</p>
				<div class="social-media">
					<a href="#" class="social-icon"> 
						<i class="fab fa-facebook-f"></i>
					</a> 
					<a href="#" class="social-icon"> 
						<i class="fab fa-twitter"></i>
					</a> 
					<a href="#" class="social-icon"> 
						<i class="fab fa-google"></i>
					</a> 
					<a href="#" class="social-icon"> 
						<i class="fab fa-linkedin-in"></i>
					</a>
				</div>
			</form>	
				<!-- 2. 판매자 로그인 폼  -->
			<form action="loginS" class="signin-s-form" method="post">
				<h2>Sign in</h2>
				<div class="input-field">
					<i class="fas fa-user"></i> 
					<input type="text" name="sid" placeholder="판매자 아이디">
				</div>
				<div class="input-field">
					<i class="fas fa-lock"></i> 
					<input type="text" name="spw" placeholder="Password">
				</div>
				<div class="input-text">
					<a href="memberForm">회원가입</a> <!-- 수정~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
					<a href="" class="passwd-selectS">비번찾기</a>
				</div>
				<input type="submit" value="Login Now" class="btn-loginForm ">

				<p class="social-text">Or Sign in with social platforms</p>
				<div class="social-media">
					<a href="#" class="social-icon"> 
						<i class="fab fa-facebook-f"></i>
					</a> 
					<a href="#" class="social-icon"> 
						<i class="fab fa-twitter"></i>
					</a> 
					<a href="#" class="social-icon"> 
						<i class="fab fa-google"></i>
					</a> 
					<a href="#" class="social-icon"> 
						<i class="fab fa-linkedin-in"></i>
					</a>
				</div>
			</form>
		</div><!--end signin-ms  -->
		
	</div><!--end forms-container  -->
	
	 <div class="panels-container">
            <div class="panel left-panel">
                <div class="content">
                    <h3>환영합니다 고객님.</h3>
                    <p>저희 쇼핑몰을 이용해 주셔서 감사합니다.<br> Seller분은 아래 버튼을 눌러주세요 </p>
                    <button class="btn-loginForm transparent" id="signin-m-btn">판매자 화면</button>
                </div>

                <img src="resources/images/svg/shopping.svg" class="image" alt="">
            </div>

            <div class="panel right-panel">
                <div class="content">
                    <h3>감사합니다. Seller님</h3>
                    <p>저희 쇼핑몰을 이용해 주셔서 감사합니다. 귀사의 번창을 기원합니다. <br> 고객님은 아래 버튼을 눌러주세요 </p>
                    <button class="btn-loginForm transparent" id="signin-c-btn">소비자 화면</button>
                </div>
             
                <img src="resources/images/svg/seller.svg" class="image" alt="">
            </div>
        </div>
	
	
	
</div><!--end container-loginForm  -->

<script>

let sign_m_btn = document.querySelector("#signin-m-btn");
let sign_c_btn = document.querySelector("#signin-c-btn");
let container_m_l = document.querySelector(".container-loginForm");


//판매자 버튼 누르면 공이 오른쪽으로 움직이면서~
sign_m_btn.addEventListener("click" , function () {
    container_m_l.classList.add("sign-m-mode");   
});

//소비자 버튼 누르면 공이 왼쪽으로 움직이면서~~
sign_c_btn.addEventListener("click" , function () {
    container_m_l.classList.remove("sign-m-mode");   
});



</script>

