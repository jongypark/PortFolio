

// 여기부터 주소 api~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
	daum.postcode.load(function() { // 추가 부분
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



$(function() {

	//이부분이 svg파일들 자동으로 슬라이드 되게하는 api, 형식을 지키면된다. 
	$(".owl-carousel").owlCarousel({
		loop : true,//무한반복
		autoplay : true,//자동으로 이미지 움직임
		autoplayTimeout : 2000,//움직이는 시간 간격
		autoplayHoverPause : true,//마우스 올리면 정지
		items : 1
	});

	
	
	// 여기부터 자잘한 검증 하기.. 
	// 1. 비번수정 누르면.. readonlu제거하기. 비번, 비번확인 검증 함수 trigger하기.. 버튼 없애기.. 
	$("#update1").on("click", function() {
		alert("비번수정합니다!!");
		$("#passwdM").removeAttr("readonly");//readonly 제거
		$("#passwd2M").removeAttr("readonly");
		$("#passwd2MR").text("");// 검은색 read only제거
		$(this).css("display","none");//본인은 사라지고
		$("#passwdM").trigger("keyup");//비번검증
		$("#passwd2M").trigger("keyup");//비번검증2
	});
	
	
	//2. 비번이 8글자 이상이여야 하는거.. trigger를 이용해서 비번확인이 더스마트하게
	$("#passwdM").on("keyup", function name() {
		
		var value = $(this).val();
		
		if ( value.length >=8){
			$("#passwd1MR").text("사용가능").css("color","blue");
			$("#passwd2M").trigger("keyup");
		}else{
			$("#passwd1MR").text("8글자이하").css("color","red");
			$("#passwd2M").trigger("keyup");
		}
		
	});
	
	//3. 비번일치 확인
	$("#passwd2M").on("keyup", function() {
		
		var value1 = $("#passwdM").val();
		var value2 = $(this).val();
		
		if ( value1.length >=8){
			if( value1 == value2){
				$("#passwd2MR").text("사용가능").css("color","blue");
			}else{
				$("#passwd2MR").text("확인 X").css("color","red");
			}
		}else{
			$("#passwd2MR").text("비번 사용X").css("color","red");
		}
	});
	
	//4. submit은 막아놓고 ajax로 바꿈, 모든 조건을 만족한경우  flag가 true가 되서 ajax진행한다. 
	$("form").on("submit", function() {
		event.preventDefault();//submit 을 막아놨다. 원래 form지워야 하는데 css를 form을 기준으로 잡은게 많아서 그냥 막았다. 
		
		var flag = true;
		var readonly = $("#passwd2MR").text();
		if( readonly =="read only"){
			console.log("readonly~~~~");
		}else{
		// 사실 여기만 검사하면 되는게 브라우저차원에서 공백검사를 해주기 때문이다. 빨강색이 하나라도 있으면 false
			var mpw1 = $("#passwd1MR").css("color");
			var mpw2 = $("#passwd2MR").css("color");
			if( (mpw1 == "rgb(0, 0, 255)") && (mpw2 == "rgb(0, 0, 255)") ){
				console.log("파란색");
			}else{
				console.log("빨간색 있음");
				alert("비번 확인하세요");
				flag = false;
			}
		}
		//브라우져 차원에서 공백검사 제공.. 
		var mid =$("#userid").val();
		var mpw =$("#passwdM").val();
		var mname =$("#mname").val();
		var mpost =$("#sample4_postcode").val();
		var maddress1 =$("#sample4_roadAddress").val();
		var maddress2 =$("#sample4_jibunAddress").val();
		var mphone1 =$("#mphone1").val();
		var mphone2 =$("#mphone2").val();
		var mphone3 =$("#mphone3").val();
		var memail1 =$("#memail1").val();
		var memail2 =$("#email2M").val();
		var mbirth =$("#mbirth").val();
		
		//점검사항 모두 이상없으면 ajax 전송 하기
		if(flag){
			//ajax 전송 하기
			
			//ajax부분
			$.ajax({
				url:"memberUpdate",
				type:"post",
				datatype:"text",
				data: 
					{mid :mid, 
					mpw :mpw, 
					mname :mname, 
					mpost :mpost, 
					maddress1 :maddress1, 
					maddress2 :maddress2, 
					mphone1 :mphone1, 
					mphone2 :mphone2, 
					mphone3 :mphone3, 
					mphone3 :mphone3, 
					memail1 :memail1, 
					memail2 :memail2, 
					mbirth :mbirth}
				,
				success: function(data, status , xhr  ) {
					alert("수정성공");
					
					// 다시 비번수정 버튼 나오게 하자~~
					$("#passwdM").attr("readonly" , "readonly");
					$("#passwd2M").attr("readonly" , "readonly");
					$("#passwd1MR").text("");
					$("#passwd2MR").text("read only").css("color","black");
					$("#update1").css("display","block");
				
				},
				error: function(xhr , status , error  ) {
					console.log(error);
				}
			});		
		}
	});//end 4. 수정하기
	
	//5. 이메일 
	$("#memail3").on("change", function() {
		$("#email2M").val( $(this).val());	
	});
	
	
	
});//end jquery ready



