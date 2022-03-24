

function reload(){  
       location.reload();
}

//아이디 중복 체크 시작
$("#gid").on("keyup", function() {
		var gid = $(this).val();
		
		$.ajax({
			
			url: "SellerGoodsIDCheck",
			type: "get",
			dataType : "text",
			data: {
				gid : gid
			},
			
			success: function(data, status, xhr) {
				if(data=="상품아이디 중복"){
				$(".idCheck").addClass("active");
				}else{
				$(".idCheck").removeClass("active");
				}
				$("#result").text(data);

			},//success
			error: function(xhr, status, error) {
				console.log(error);
			}//error
			
		})//ajax
		
	})//keyup
//아이디 중복 체크 끝	
	
	
//상품등록 공백 체크 시작	
	$("#sub").on("click", function() {
		var gid = $("#gid").val();
		var gname = $("#gname").val();
		var gprice = $("#gprice").val();
		var gimage = $("#gimage1").val();
		var gdetail = $("#gdetail").val();
		
		if (gid.length == 0 ) {
			alert("상품의 아이디를 입력해주세요");
			event.preventDefault();
		}else if (gname.length == 0 ) {
			alert("상품의 이름을 입력해주세요");
			event.preventDefault();
		}else if (gprice.length == 0 ) {
			alert("상품의 가격을 입력해주세요");
			event.preventDefault();
		}else if (gimage.length == 0) {
			alert("상품의 이미지를 입력해주세요");
			event.preventDefault();
		}else if (gdetail.length == 0) {
			alert("상품의 설명을 입력해주세요");
			event.preventDefault();
		}
		
	})//click
//상품등록 공백 체크 시작	 끝

	
	//상품 수정 시작
$(".update").on("click", function() {
			var gid = $(this).attr("data-num");
			var gname = $("#gname"+gid).val();
			var gprice = $("#gprice"+gid).val();
			var gdetail = $("#gdetail"+gid).val();
			var gcategory = $("#gcategory"+gid).val();
			var gprice2 = gprice.replace(",","");
		
		$.ajax({
			
			url: "SellerGoodsUpdate",
			type: "get",
			dateType :"text",
			data: {
				gid : gid,
				gname : gname,
				gprice : gprice2,
				gdetail : gdetail,
				gcategory : gcategory
				
			},
			
			success: function(data, status, xhr) {
				console.log(data);
				if (data = "1") {
					alert("정보가 수정되었습니다.");
				}
				reload();
			},//success
			error: function(xhar, status, error) {
				console.log(error);
			}//error
			
		})//ajax
		})//update
		//상품 수정 끝
		
		//상품 삭제 시작
		$(".delete").on("click", function() {
			var gid = $(this).attr("data-num");
			console.log(gid);
		$.ajax({
			
			url: "SellerGoodsDelete",
			type: "get",
			dateType :"text",
			data: {
				gid : gid,
				//key : value (데이터)
			},
			
			success: function(data, status, xhr) {
				if (data = 1) {
					alert("삭제되었습니다.")
				}
				reload();
			},//success
			error: function(xhar, status, error) {
				console.log(error);
			}//error
			
		})//ajax
		})//delete
			//상품 삭제 끝
		
	//팝업(모달창) 띄위기 
		$(".btn-open").on("click", function () {
			$(".modal, .overlay").addClass('active');
		})
	//팝업(모달창) 닫기 
			$(".btn-close, .overlay").on("click", function () {
			$(".modal, .overlay").removeClass('active');
		})
	