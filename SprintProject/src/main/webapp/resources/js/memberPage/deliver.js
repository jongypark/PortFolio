$(function() {
	
	//배송조회버튼
	$("#deliver").click(function(e) {
		e.preventDefault();
		
		let popUrl = "/deliver";
		let popOption = "width = 650px, height=700px, top=300px, left=300px, scrollbars=yes";
		
		window.open(popUrl,"배송조회",popOption);
	})//배송조회페이지 end
	
})