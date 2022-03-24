



$(function() {
	

	function totalPrice() {
		
		var couponflag = $("#couponDiv").attr("data-code");
		console.log("couponflag:" + couponflag);
		
			var total = 0;
			var totalamount =0;
			var delivery = parseInt($("#shipping_charge").text());
			$(".itemval").each(function(idx,data) {
				total += parseInt($(this).text());
			});
			
			$("#product_total_amt").text(total);
			if( total ==0){
				$("#total_cart_amt").text(0);
			}else{
				$("#total_cart_amt").text(total + delivery);
				totalamount = total + delivery;
			}
			
			if(couponflag !="x"){
				var type = $("#couponDiv").attr("data-type");
				var discount = $("#couponDiv").attr("data-discount");
				var price = totalamount;
				
				console.log("계산하는곳:" + price);
				if( type == "delivery"){
					var rrr = price -3000
					$("#dccodeDiscount").text(rrr  +"원");
				}else if( type == "total"){
					
					var dcRaTe =100 - parseInt ($("#couponDiv").attr("data-discount"));
					var mmm = price *dcRaTe / 100;
					$("#dccodeDiscount").text(mmm +"원");
				}else{
					alert("totalprice함수 에러");
				}
			
			}	
		
			var totalCart = $("#totalCart").text();
			
			if( totalCart == "0"){
				$("#coupon_delete").trigger("click");
			}
			
	}//end totalprice
	
	
	totalPrice();
	
	//1. minus 버튼
	$(".minus").on("click", function() {
		var cid = $(this).attr("data-this");
		var cqty = parseInt($("#textbox1"+cid).val());
		var price = $(this).attr("data-price");
		var i = cqty;
	
		
		if(cqty <= 1){
			i =0;
			$(this).css({"background":"red", "color":"white"});
			$("#textbox1"+cid).css({"background":"red", "color":"white"}).val(i);
			$("#textbox2"+cid).text(i);
			
			$("#itemval1"+cid).text(i);
			
			$("#itemval2"+cid).css("text-decoration","line-through").text(i);
			$("#itemval2line"+cid).css("text-decoration","line-through");
			
			totalPrice();
		}else{
			i--;
			$("#plus"+cid).css({"background":"white", "color":"black"});
			$("#textbox1"+cid).css({"background":"white", "color":"black"}).val(i);
			$("#textbox2"+cid).text(i);
			$("#itemval1"+cid).text(i * price);
			$("#itemval2"+cid).text(i * price);
			totalPrice();
		}
	});//end 1. minus
	
	//2. plus 버튼
	$(".plus").on("click", function() {
		var cid = $(this).attr("data-this");
		var stock = parseInt($(this).attr("data-stock"));
		var cqty = parseInt($("#textbox1"+cid).val());
		var price = $(this).attr("data-price");
		var i = cqty;
	
		
		if(cqty >= stock-1){
			i =stock;
			$(this).css({"background":"red", "color":"white"});
			$("#textbox1"+cid).css({"background":"red", "color":"white"}).val(i);
			$("#textbox2"+cid).text(i);
			$("#itemval1"+cid).text(i * price);
			$("#itemval2"+cid).text(i * price);
			totalPrice();
		}else{
			$("#itemval2"+cid).css("text-decoration","none");
			$("#itemval2line"+cid).css("text-decoration","none");
			
			i++;
			$("#minus"+cid).css({"background":"white", "color":"black"});
			$("#textbox1"+cid).css({"background":"white", "color":"black"}).val(i);
			$("#textbox2"+cid).text(i);
			$("#itemval1"+cid).text(i * price);
			$("#itemval2"+cid).text(i * price);
			totalPrice();
		}
	});//end 2. minus
	
	
	//3. ajax로 제거..
	$(".remove").on("click", function() {
		var cid = $(this).attr("data-this");
		console.log("cid"+cid);
		
		
		//ajax부분
		$.ajax({
			url:"cartdelete",
			type:"post",
			datatype:"text",
			data: {cid :cid} ,// json객체를 문자열로 전송
			success: function(data, status , xhr  ) {
			
				if( data =="success"){
					console.log("db제거 성공");
					$("#removeDiv1"+cid).remove();
					$("#removeDiv2"+cid).remove();
					$("#totalCart").text( parseInt($("#totalCart").text())-1  );
					totalPrice();
				}else{
					alert("제거실패");
				}
			
			},
			error: function(xhr , status , error  ) {
				console.log(error);
			}
		});		
	});//end 3.ajax로 제거..
	
	
	
	
	
	//4. 구매하기 버튼 업데이트 ajax한 후 이동하기... 
	$("#order").on("click", function() {
		var cids = [];
		$(".ordervalue").each(function(date , i) {
			var cid = $(this).attr("data-this");
			var cqty = parseInt($(this).val());
			if( cqty !=0){
				console.log(cid + " " + cqty);
				var str = cid +":"+cqty;
				cids.push(str);
			}
			
			
		});//end each
		
		if( cids.length != 0){
			console.log(cids);
			var code = $("#couponDiv").attr("data-code");
			console.log(code);
			location.href ="loginCheck/ordercheck?cids="+cids +"&code="+ code;
		}else{
			alert("선택된 항목이 없습니다");
		}
		
		
		
	});//end 4 구매하기 버튼
	
	
	//5. apply 쿠폰버튼
	// 쿠폰 정책은 회사내규에 따른것. 여기서는 간단하게 쿠폰은 선착순 으로 쓰면 효력이 정지
	//되게 하는것으로 결정.  쿠폰은 다음의 절차를 가지고 ajax로 작성한다. 
	$("#coupon").on("click", function() {
		var dccode = $("#dcCode").val();
		var test = $("#total_cart_amt").text();
		// 0. 코드가 빈칸이다. 
		if( dccode =="" ){
			console.log("비었다");
		}else if( test == "0"){
			console.log("상품 선택 안했다");
		}else{
			//1. 할인코드를 ajax로 넘기기. 
			//ajax부분
			$.ajax({
				url:"loginCheck/coupon",
				type:"post",
				datatype:"json",
				data: 
					{ dccode :dccode}
				,
				success: function(data, status , xhr  ) {
					var errorCode ="";
					if ( data.code == "failed"){
						errorCode ="코드를 잘못 입력했습니다.";
					}else if( data.code =="TXerror"){
						alert("tx오류");
					}else if( data.code == "failed2"){
						errorCode ="모두 사용해서 등록하수 없는 쿠폰입니다.";
					}else if( data.code == "used"){
						errorCode ="이미 사용한 쿠폰입니다.";
					}else if(data.code == "test"){
						//이게 나오면 버그 있음 						
						alert("에러");
					}else{
						// 정상적으로 서버에서 데이터를 받았다. <-~~~~~~~
						
						console.log(data.code , data.content , data.type , data.discount);
						// 1. 할인율 계산 부분.. 
						var total_price = parseInt($("#total_cart_amt").text());
						var dcPrice = 0;
						var dcRate =0;
						//1.1. 쿠폰 종류가 전체할인이다
						if( data.type == "total"){
							dcRate = 100 - parseInt(data.discount);
							$("#shipping_charge").css({"color":"#6c757d","text-decoration":"none" });
							dcPrice = total_price * dcRate / 100; 
						//1.2. 쿠폰 종류가 배달할인이다. 	
						}else if(data.type == "delivery"){				
							dcPrice = total_price -3000;
							$("#shipping_charge").css({"color":"red","text-decoration":"line-through" });	
						//1.3. 쿠폰type버그 .. 	
						}else{
							alert("coupn type 에러");
						}
						
						//2. 계산끝나면 브라우져에 표시 및 각종 css 
						// 2.1css
						$("#couponDiv").css("display" , "block");
						$("#total_cart_amt").css({"color":"red","text-decoration":"line-through" });
						//2.2  쿠폰 할인정보 유저에게 알려주기
						$("#dccodeContent").text(data.content);
						$("#dccodeDiscount").text(dcPrice +"원");
						
						//3. 쿠폰을 사용중이란걸 어디다 기록해야 한다. 그래야 구매할때도, 가격변경시도 참고할수있다. 
						$("#couponDiv").attr("data-code",data.code);
						$("#couponDiv").attr("data-type",data.type);
						$("#couponDiv").attr("data-discount",data.discount);
						
						errorCode ="사용 가능한 쿠폰입니다";
						$("#coupon_delete").css("display","block");
					}//end success 분기... 
					
					// 4. 현상태 유저에게 알려주기
					$("#error_trw").text(errorCode);
					// 4.1 input창 초기화
					$("#dcCode").val("");
					
				},
				error: function(xhr , status , error  ) {
					console.log(error);
				}
			});	//end ajax 	
			
		}//end dccode 아무것도 입력안한경우 
		
	});//end 5. apply 쿠폰버튼
	
	
	//6. coupon_delete 버튼 누를시
	$("#coupon_delete").on("click", function() {
		
		// 1.할인정보 이전으로 돌리기
		$("#dccodeContent").text("");
		$("#dccodeDiscount").text("");		
		$("#couponDiv").css("display" , "none");//왜 안먹지? 
		//관통밑줄 제거 등등.. 
		$("#total_cart_amt").css({"color":"#6c757d","text-decoration":"none" });
		$("#shipping_charge").css({"color":"#6c757d","text-decoration":"none" });
		$("#error_trw").text("dc코드를 입력해주세요");
		//현재 쿠폰사용안한하는걸 어디다 기록해야 한다. 
		$("#couponDiv").attr("data-code","x");
		$("#couponDiv").attr("data-type","x");
		$("#couponDiv").attr("data-discount","x");
		
	
		
		//2. 다시 버튼 숨기기
		$(this).css("display","none");
		
		
		
		
		
	});//end 6.coupon_delete 버튼
	
	
	
});//end ready




