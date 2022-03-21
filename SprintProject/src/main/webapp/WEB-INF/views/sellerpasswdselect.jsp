<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		$("#btn-subS").on("click", function() {
			var sid = $("#sid").val(); // 회원의 아이디
			var sname = $("#sname").val(); // 회원이 성함
			var sphone1 = $("#sphone1").val(); // 회원의 핸드폰 첫번째자리
			var sphone2 = $("#sphone2").val(); // 회원의 핸드폰 두번쨰자리
			var sphone3 = $("#sphone3").val(); // 회원의 핸드폰 세번째자리
			console.log(sid);
			
			$.ajax({
				
				url: "selectpasswdS",
				type: "get",
				dataType: "text",
				data:{
					sid: sid,
					sname: mname,
					sphone1: sphone1,
					sphone2: sphone2,
					sphone3: sphone3
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

	<div class="passwdselectS-all">
		<form action="">
			<div class="passwdselectS-input">
		<span>아이디 : </span><input type="text" name="sid" id="sid" class="passwdselect-text" placeholder="아이디를 입력해주세요" ><br>
		<span>이름 : </span><input type="text" name="sname" id="mname" class="passwdselect-text" placeholder="이름을 입력해주세요" ><br>
		<span>핸드폰 번호 : </span><select id="sphone1" name="sphone1">
								<option value="010">010</option>	
								<option value="011">011</option>	
								<option value="019">019</option>	
								<option value="018">018</option>	
								</select> - 
						 <input type="text" name="sphone2" id="sphone2" class="passwdselect-text" size="3"> -
						 <input type="text" name="sphone3" id="sphone3" class="passwdselect-text" size="3"><br>
						 <input type="submit" value="확인" id="btn-subS">
						 <input type="button" value="닫기" id="close">
			</div>
		</form>
	</div>
</body>
</html>
