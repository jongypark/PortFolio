


// 재고등록 공백 체크 시작
$("#check").on("click", function() {
		var gid = $("#gid").val();
		var gsize = $("#gsize").val();
		var gcolor = $("#gcolor").val();
		var gstock = $("#gstock").val();
		
		if (gid == "") {
			alert("아이디를 입력해주세요");
		}else if (gstock == "") {
			alert("재고수량을 입력해주세요");
		}
		
		if(gid != "" && gstock != 0){
		$.ajax({
			
			url: "SellerStockCheck",
			type: "get",
			dataType : "text",
			data: {
				gid : gid,
				gsize : gsize,
				gcolor : gcolor
			},
		success: function(data, status, xhr) {
				console.log(data);
				if (data == 0) {
					alert("등록 가능한 상품입니다.");
				}else if(data == 1){
					alert("중복된 상품입니다.");
				}
				
				
		},
		error : function(xhr, status, error) {
					console.log(error);			
		}
		
			
		})//ajax
		}
	})//keyup
	
	// 재고등록 공백 체크 끝
function reload(){  
       location.reload();
}
		//재고수정 시작
 	 $(".update").on("click", function() {//수정 ajax 처리 
			var num = $(this).attr("data-num");
			var gsize = $("#gsize"+num).val();
			var gcolor = $("#gcolor"+num).val();
			var	gstock = $("#gstock"+num).val();
 		 
 		 $.ajax({
 		
 			 url :"SellerStockUpdate",
 			 type :"get",
 			 dateType :"text",
 			 data : {
 				 num : num,
 				 gsize : gsize,
 				 gcolor : gcolor,
 				 gstock : gstock
 			 },
 			 success: function(data, status, xhr) {
				if (data = 1) {
					alert("수정되었습니다.");
				}
 				 	reload();
 			 },
			error: function(xhr, status, error) {
				console.log(error);
			}
 			 
 		 })//ajax
 
 	 })//click
 	 
 	 //재고수정 끝
 	 
 	 /* ------------------------------------------------- */
 	 
 	 //재고 삭제 시작
 	 $(".delete").on("click", function() {//삭제 ajax 처리 
			var num = $(this).attr("data-num");
 		 
 		 $.ajax({
 		
 			 url :"SellerStockDelete",
 			 type :"get",
 			 dateType :"text",
 			 data : {
 				 num : num,
 			 },
 			 success: function(data, status, xhr) {
 				if (data = 1) {
					alert("삭제되었습니다.");
				}
 				 	reload();
			},
			error: function(xhr, status, error) {
				console.log(error);
			}
 			 
 		 })//ajax
 	 
 	 })//click 
	//재고 삭제 끝
 	 
 	 //중복체크  시작
 	 $("#stockadd").on("click", function () {
		var gid = $("#gid").val();
		var gsize = $("#gsize").val();
		var gcolor = $("#gcolor").val();
		var gstock = $("#gstock").val();
 		 
		if (gid == "") {
			alert("아이디를 입력해주세요");
			event.preventDefault();
		}else if (gstock == "") {
			alert("재고수량을 입력해주세요");
			event.preventDefault();
		}
		
	
			
		})
	 //중복체크  끝	
	
		
	//팝업(모달창) 띄위기 
		$(".btn-open").on("click", function () {
			$(".modal, .overlay").addClass('active');
		})
	//팝업(모달창) 닫기 
			$(".btn-close, .overlay").on("click", function () {
			$(".modal, .overlay").removeClass('active');
		})
		
		
		
 	 
 	 