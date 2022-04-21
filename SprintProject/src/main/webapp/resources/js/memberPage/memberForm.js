
// 여기부터 주소 api~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


// <!-- parser-blocking via document.writhe 관련 문제 해결 방법 -->

// <!-- 주신 링크로 들어가보니 cross site 이슈에 대한 답변이 있었습니다. 
// 두번째의 경우 저희 API의 기본적인 로딩 방식은 postcode.v2.js 파일을 불러올때 코어스크립트의 로딩 동기화를 위해 document.write방식을 사용하고 있습니다.
//  바로 이점 때문에 나오는 경고 메세지인데요. document.write의 경우 페이지가 순차적으로 렌더링 되다가 이 로직을 만나면 블락이 되고 이 부분이 
//  모두 완료되기 전까진 페이지 로딩 맟 파싱이 정지됩니다. 그래서 poor network coonnectivity 라는 부분처럼, 느린 네트워크 환경에서 document.write를 
//  통해 이용하면 페이지가 멈춘것처럼 보여 서비스 장애처럼 보이니 주의하라는 것인데요.
// 이것에 대한 해결책은 두가지가 있습니다.
// 저희 가이드 페이지의 동적로딩 방식을 이용한다 (가이드 페이지 기본 사용법 참고)
// < / b o d y > 바로 위에 script src=postcode.v2.js를 넣는다. 이 방식은 보통 서비스 개발시 통상적으로 head에 스크립트 로딩을 넣는 것으로 알려주는데요,
//  이것은 document.write가 아니더라도 부르는 스크립트 수가 늘어나면 페이지가 좀 늦게 뜨게 됩니다. 그래서 이에 대한 트릭으로, 스크립트 로딩이나 사전 
//  프로세싱이 필요한 것들은 < / b o d y > 바로 앞, 즉 페이지의 맨 하단에 위치시키는데요. 이 경우 본문 페이지는 페이지대로 로딩이 다 되고 스크립트의 
//  경우에는 보통 DOM처리때문에 모든 다큐먼트가 파싱된 이후에 처리하는게 기본이므로, 페이지 렌더링 흐름이 자연스럽게 연결이 됩니다. 다만 애초에 페이지 
//  설계를 이렇게 하지 않고 중간중간 스크립트를 삽입하여 비지니스 로직을 설계하셨다면 안맞는 방법일 수도 있습니다. -->

// <!--?autoload=false 이거랑  daum.postcode.load(function(){ 이걸 추가하니까  정상적으로 해결됬다. -->

function sample4_execDaumPostcode() {
	daum.postcode
			.load(function() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

								// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
								var extraRoadAddr = ''; // 도로명 조합형 주소 변수

								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraRoadAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraRoadAddr += (extraRoadAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraRoadAddr !== '') {
									extraRoadAddr = ' (' + extraRoadAddr + ')';
								}
								// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
								if (fullRoadAddr !== '') {
									fullRoadAddr += extraRoadAddr;
								}

								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
								document.getElementById('sample4_roadAddress').value = fullRoadAddr;
								document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

								// 이부분도 null포인트 익셉션 에러가 났는데 그냥 주석처리했다. 
								// // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
								// if(data.autoRoadAddress) {
								//     //예상되는 도로명 주소에 조합형 주소를 추가한다.
								//     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
								//     document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

								// } else if(data.autoJibunAddress) {
								//     var expJibunAddr = data.autoJibunAddress;
								//     document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

								// } else {
								//     document.getElementById('guide').innerHTML = '';
								// }
							}
						}).open();
			});
}//end sample4_execDaumPostcode

//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode1() {
	daum.postcode
			.load(function() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

								// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
								var extraRoadAddr = ''; // 도로명 조합형 주소 변수

								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraRoadAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraRoadAddr += (extraRoadAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraRoadAddr !== '') {
									extraRoadAddr = ' (' + extraRoadAddr + ')';
								}
								// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
								if (fullRoadAddr !== '') {
									fullRoadAddr += extraRoadAddr;
								}

								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('sample4_postcode1').value = data.zonecode; //5자리 새우편번호 사용
								document.getElementById('sample4_roadAddress1').value = fullRoadAddr;
								document
										.getElementById('sample4_jibunAddress1').value = data.jibunAddress;

								// // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
								// if(data.autoRoadAddress) {
								//     //예상되는 도로명 주소에 조합형 주소를 추가한다.
								//     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
								//     document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

								// } else if(data.autoJibunAddress) {
								//     var expJibunAddr = data.autoJibunAddress;
								//     document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

								// } else {
								//     document.getElementById('guide').innerHTML = '';
								// }
							}
						}).open();
			});
}// end sample4_execDaumPostcode1

// 여기까지 주소 api~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


// 제이쿼리로 이벤트 처리
$(function() {

	//이부분이 svg파일들 자동으로 슬라이드 되게하는 api, 형식을 지키면된다. 
	$(".owl-carousel").owlCarousel({
		loop : true,
		autoplay : true,
		autoplayTimeout : 2000,
		autoplayHoverPause : true,
		items : 1
	});

	// 여기부터~~~~~~~~ 소비자 판매자 step 회원가입 이벤트 
	// Form1~6은 왼쪽이동 , FromM/S는 위아래이동 , progress는 width증가 , 버튼은 이벤트 트리거 
	var Form1 = $("#Form1");
	var Form2 = $("#Form2");
	var Form3 = $("#Form3");
	var Form4 = $("#Form4");
	var Form5 = $("#Form5");
	var Form6 = $("#Form6");

	// 버튼이 10개, 이벤트도 10개
	var Next1 = $("#Next1");
	var Next2 = $("#Next2");
	var Next3 = $("#Next3");
	var Next4 = $("#Next4");
	var Back1 = $("#Back1");
	var Back2 = $("#Back2");
	var Back3 = $("#Back3");
	var Back4 = $("#Back4");
	var toSeller = $("#toSeller");
	var toMember = $("#toMember");

	var progress = $("#progress");
	var progress2 = $("#progress2");

	var FormM = $("#Form-M");
	var FormS = $("#Form-S");

	// next1누르면 form1이 왼쪽으로 form2가 본위치로 progress가 늘어난다
	Next1.on("click", function() {
		Form1.css({"left" : "-450px"});
		Form2.css({"left" : "20px"});
		progress.css({"width" : "300px"});
	});
	// Back1누르면 form1이 본위치로  progress가 1단계로
	Back1.on("click", function() {
		Form1.css({"left" : "20px"});
		Form2.css({"left" : "450px"});
		progress.css({"width" : "150px"});
	});
	// next2누르면 form3이 본위치로 progress가 더 늘어난다
	Next2.on("click", function() {
		Form2.css({"left" : "-450px"});
		Form3.css({"left" : "20px"});
		progress.css({"width" : "450px"});
	});
	// Back2누르면 form2이 본위치로  progress가 2단계로    
	Back2.on("click", function() {
		Form2.css({"left" : "20px"});
		Form3.css({"left" : "450px"});
		progress.css({"width" : "300px"});
	});

	// next3누르면 form4 왼쪽으로 form5가 본위치로 progress2가 늘어난다
	Next3.on("click", function() {
		Form4.css({"left" : "-450px"});
		Form5.css({"left" : "20px"});
		progress2.css({"width" : "300px"});
	});
	// Back3누르면 form4이 본위치로  progress2가 1단계로
	Back3.on("click", function() {
		Form4.css({"left" : "20px"});
		Form5.css({"left" : "450px"});
		progress2.css({"width" : "150px"});
	});
	// next4 누르면 form5 본위치로 progress2가 더 늘어난다
	Next4.on("click", function() {
		Form5.css({"left" : "-450px"});
		Form6.css({"left" : "20px"});
		progress2.css({"width" : "450px"});
	});
	// Back4르면 form5이 본위치로  progress2가 2단계로    
	Back4.on("click", function() {
		Form5.css({"left" : "20px"});
		Form6.css({"left" : "450px"});
		progress2.css({"width" : "300px"});
	});

	// 소비자 버튼 -> 판매자로 변한다
	toSeller.on("click", function() {

		// form 은 위아래로 움직인다
		FormS.css({"top" : "0"});
		FormM.css({"top" : "500px"});

		// form전체가 움직였으니 step1로 초기화한다
		Form1.css({"left" : "20px"});
		Form2.css({"left" : "450px"});
		Form3.css({"left" : "450px"});
		progress.css({"width" : "150px"});

		// 소비자 버튼 -> 판매자로 변한다
		toSeller.css({"right" : "-500px"});
		toMember.css({"right" : "30px"});
	});
	// 판매자 버튼 -> 소비자로 변한다
	toMember.on("click", function() {
		// form 은 위아래로 움직인다
		FormM.css({"top" : "0"});
		FormS.css({"top" : "500px"});

		// form전체가 움직였으니 step1로 초기화한다
		Form4.css({"left" : "20px"});
		Form5.css({"left" : "450px"});
		Form6.css({"left" : "450px"});
		progress2.css({"width" : "150px"});

		// 판매자 버튼 -> 소비자로 변한다
		toSeller.css({"right" : "30px"});
		toMember.css({"right" : "-500px"});
	});
	
	
	
	
//	여기부터 ajax email부분 , 비번일치 등 자잘한 기능들~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	
	//1. 비번이 8글자 이상이여야 하는거.. trigger를 이용해서 비번확인이 더스마트하게
	$("#passwdM").on("keyup", function name() {
		
		var value = $(this).val();
		
		if ( value.length >=8){
			$("#passwd1MR").val("사용가능").css("color","blue");
			$("#passwd2M").trigger("keyup");
		}else{
			$("#passwd1MR").val("8글자이하").css("color","red");
			$("#passwd2M").trigger("keyup");
		}
		
	});
	//1-1. 판매자 비번이 8글자 이상이여야 하는거.. trigger를 이용해서 비번확인이 더스마트하게
	$("#passwdS").on("keyup", function name() {
		
		var value = $(this).val();
		
		if ( value.length >=8){
			$("#passwd1SR").val("사용가능").css("color","blue");
			$("#passwd2S").trigger("keyup");
		}else{
			$("#passwd1SR").val("8글자이하").css("color","red");
			$("#passwd2S").trigger("keyup");
		}
		
	});
	
	//2. 비번일치 확인
	$("#passwd2M").on("keyup", function() {
		
		var value1 = $("#passwdM").val();
		var value2 = $(this).val();
		
		if ( value1.length >=8){
			if( value1 == value2){
				$("#passwd2MR").val("사용가능").css("color","blue");
			}else{
				$("#passwd2MR").val("확인 X").css("color","red");
			}
		}else{
			$("#passwd2MR").val("비번 사용X").css("color","red");
		}
	});
	

	//2-1.  판매자 비번일치 확인
	$("#passwd2S").on("keyup", function() {
		
		var value1 = $("#passwdS").val();
		var value2 = $(this).val();
		
		if ( value1.length >=8){
			if( value1 == value2){
				$("#passwd2SR").val("사용가능").css("color","blue");
			}else{
				$("#passwd2SR").val("확인 X").css("color","red");
			}
		}else{
			$("#passwd2SR").val("비번 사용X").css("color","red");
		}
	});
	
	//3. 이메일 선택.. 
	$("#memail3").on("change", function() {
		$("#email2M").val( $(this).val());	
	});
	
	//3-1. 판매자 이메일 선택.. 
	$("#semail3").on("change", function() {
		$("#email2S").val( $(this).val());	
	});
	
	
	//4. ajax로 아이디 중복검사..
	
	$("#useridM").on("keyup", function() {
		var value = $(this).val();
		
		//ajax부분
		$.ajax({
			url:"idDuplicateCheckM",
			type:"post",
			datatype:"text",
			data: {mid :value} ,// json객체를 문자열로 전송
			success: function(data, status , xhr  ) {
			
				// 중복
				if (data == "duplicate"){
					$("#useridMR").val("사용 X").css("color","red");
				}else if( data == "success"){
				// 사용가능	
					$("#useridMR").val("사용 가능").css("color","blue");
				}else{
					$("#useridMR").val("");
				}
			},
			error: function(xhr , status , error  ) {
				console.log(error);
			}
		});		
	});//end 4. ajax중복검사
	
	//4.1 판매자 ajax로 아이디 중복검사..
	
	$("#useridS").on("keyup", function() {
		var value = $(this).val();
		
		//ajax부분
		$.ajax({
			url:"idDuplicateCheckS",
			type:"post",
			datatype:"text",
			data: {sid :value} ,// json객체를 문자열로 전송
			success: function(data, status , xhr  ) {
			
				// 중복
				if (data == "duplicate"){
					$("#useridSR").val("사용 X").css("color","red");
				}else if( data == "success"){
				// 사용가능	
					$("#useridSR").val("사용 가능").css("color","blue");
				}else{
					$("#useridSR").val("");
				}
			},
			error: function(xhr , status , error  ) {
				console.log(error);
			}
		});		
	});//end 4-1. 판매자 ajax중복검사
	
	//5. submit하기전에 id,비번2개가 빨강색이 아닌지 확인후 
	$("#Form-M").on("submit", function() {
	
		var mid = $("#useridMR").css("color");
		var mpw1 = $("#passwd1MR").css("color");
		var mpw2 = $("#passwd2MR").css("color");
		if( (mid == "rgb(0, 0, 255)") && (mpw1 == "rgb(0, 0, 255)") && (mpw2 == "rgb(0, 0, 255)") ){
			console.log("파란색");
		}else{
			console.log("빨간색 있음");
			alert("아이디&비번 확인하세요");
			event.preventDefault();
		}
		
	});
	
	//5-1.판매자 submit하기전에 id,비번2개가 빨강색이 아닌지 확인후 
	$("#Form-S").on("submit", function() {
	
		var sid = $("#useridSR").css("color");
		var spw1 = $("#passwd1SR").css("color");
		var spw2 = $("#passwd2SR").css("color");
			if( (sid == "rgb(0, 0, 255)") && (spw1 == "rgb(0, 0, 255)") && (spw2 == "rgb(0, 0, 255)") ){
			console.log("파란색");
		}else{
			console.log("빨간색 있음");
			alert("아이디&비번 확인하세요");
			event.preventDefault();
		}
		
	});
	
	
	
	

});//end jquery ready
