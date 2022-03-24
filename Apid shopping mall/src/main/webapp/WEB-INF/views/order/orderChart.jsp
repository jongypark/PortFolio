<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dto.OrderDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function () {
		
		
			//배송조회버튼
	$(".deliver").click(function(e) {
		
			
			e.preventDefault();
			
			let popUrl = "deliver";
			let popOption = "width = 650px, height=700px, top=300px, left=300px, scrollbars=yes";
			
			window.open(popUrl,"deliver",popOption);
	});//배송조회페이지 end
		
	
 	$(".name").click(function() {
		
		var opindex = $(".opindex").val();
	});//구매자정보 조회
	
	//환불요청
	$(".ordercancel2").click(function () {
		
		var oid = $(this).attr("data-num");
		var oconfirmed = $(".ordercancel2").val();
		console.log(oid,oconfirmed);
	$.ajax({
		type:"POST",
		url:"return_goods2",
		data:{
			oid:oid,
			oconfirmed:oconfirmed
		},
		dataType:"text",
		success: function (data,status,xhr) {
			
			alert("환불요청이 완료되었습니다");
		},
		error: function(xhr,status,error) {
			console.log(error);
		}
	})//ajax end

});//환불요청 end
	
	
	})
	



</script>
<script rel="stylesheet" src="https://kit.fontawesome.com/c83e91760f.js"
	crossorigin="anonymous"></script>
</head>
<body>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>



	<form id="container" action="orderChart_info" method="post">
		<div id="contents">

			<div class="deliver_info">
				<div class="deliver_css" style="margin: 0 !important;"></div>

				<div class="orderlist">
					<center>
						<i class="fa-solid fa-receipt fa-4x"></i>
						<div class="ordertitle">OrderChart</div>
					</center>



					<table width="100%" class="ordertable">
						<colgroup>
							<col style="width: 34px;" />
							<col style="width: 92px;" />
							<col style="width: 100px;" />
							<col style="width: 85px;" />
							<col style="width: 85px;" />
							<col style="width: 65px;" />
							<col style="width: 60px;" />
						</colgroup>
						<thead>
							<tr style="text-align: center;">
								<th scope="col"><label>주문 번호</label></th>
								<th scope="col">이미지</th>
								<th scope="col">상품정보</th>
								<th scope="col">상품 구매금액</th>
								<th scope="col">배송상태</th>
								<th scope="col">비고</th>
							</tr>
						</thead>
						<tbody class="order_info">

							<c:forEach items="${orderChart}" var="dto" varStatus="status">
								<tr class="order_infolist">
									<td class="opindex">${dto.opindex}</td>
									<td class="thumb"><a href=""> <img alt=""
											src="resources/images/items/${dto.oimage}" id=image>
									</a></td>
									<td class="product"><a
										href="orderChart_info?oid=${dto.oid}" class="name"
										type="submit"><strong>${dto.oproductname}</strong> <span
											class="icon"></span></a>
										<ul class="option">

										</ul></td>
									<td class="price">
										<div class="">
											<strong>${dto.oprice} 원</strong>
										</div>
									</td>
									<td class="del"><c:choose>
											<c:when test="${dto.oconfirmed == 2}">
												<span>환불완료</span>
											</c:when>
											<c:when test="${dto.oconfirmed == 1}">
												<span>개별환불완료</span>
											</c:when>

											<c:when test="${dto.odelivery != 0 }">
												<span>${dto.deliverystatus}</span>
											</c:when>


											<c:when test="${dto.opaymentcheck == 1}">
												<span>결재 완료</span>
											</c:when>
											<c:when test="${dto.opaymentcheck == 0}">
												<span>결재 진행중</span>
											</c:when>

										</c:choose></td>
									<td class="button">
										<button class="ordercancel2" data-num="${dto.oid}" value="2">
											<span>반품요청</span>
										</button>
									</td>

								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>


		</div>
	</form>
</body>
</html>