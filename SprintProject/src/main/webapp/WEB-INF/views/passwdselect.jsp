<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="resources/css/passwdselect.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		
		$("#close").on("click", function() {
			
			window.close(); // 자신의 창 닫기 
			
		})//창닫기 이벤트
		
		$("#btn-sub").on("click", function() {
			var mid = $("#mid").val(); // 회원의 아이디
			var mname = $("#mname").val(); // 회원이 성함
			var mphone1 = $("#mphone1").val(); // 회원의 핸드폰 첫번째자리
			var mphone2 = $("#mphone2").val(); // 회원의 핸드폰 두번쨰자리
			var mphone3 = $("#mphone3").val(); // 회원의 핸드폰 세번째자리
			
			$.ajax({
				
				url: "selectpasswdM",
				type: "get",
				dataType: "text",
				data:{
					mid: mid,
					mname: mname,
					mphone1: mphone1,
					mphone2: mphone2,
					mphone3: mphone3
				},
				
				success: function(data, status, xhr) {
					console.log(data);
					console.log(status);
					console.log(xhr);
					console.log("성공");
					alert(data);
				},//succes end
				error: function(xhr, status, error) {
					console.log(error);
				}//error end
				
			})//ajax end
			
		})//전송 번튼 이벤트
	
	})//end ready
	
</script>
</head>
<body>
	<div class="passwdselect-all">
		<div class="title"><h2>비밀번호 찾기</h2></div>
		<form action="">
		<div class="passwdselect-input">
		<div class="span-id">
		<span>아이디</span><input type="text" name="mid" id="mid" class="passwdselect-text" placeholder="아이디를 입력해주세요" ><br>
		</div>
		<div class="span-name">
		<span style="margin:18px">이름</span><input type="text" name="mname" id="mname" class="passwdselect-text" placeholder="이름을 입력해주세요" ><br>
		</div>
		<div class="span-selcet">
		<span>핸드폰 번호</span><select id="mphone1" name="mphone1" class="passwdselect-text">
								<option value="010">010</option>	
								<option value="011">011</option>	
								<option value="019">019</option>	
								<option value="018">018</option>	
								</select> - 
						 <input type="text" name="mphone2" id="mphone2" class="passwdselect-text" size="3"> -
						 <input type="text" name="mphone3" id="mphone3" class="passwdselect-text" size="3"><br>
		</div>
			</div>
			<div class="passwdselect-btn">
						 <input type="submit" value="확인" id="btn-sub">
						 <input type="button" value="닫기" id="close">
			</div>
		</form>
	</div>
</body>
</html>