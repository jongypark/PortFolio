<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dto.OrderDTO"%>
<%@page import="com.dto.OrderChartDTO"%>
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
	$(function() {

		//배송조회버튼
		$(".deliver")
				.click(
						function(e) {
							e.preventDefault();

							let popUrl = "deliver";
							let popOption = "width = 650px, height=700px, top=300px, left=300px, scrollbars=yes";

							window.open(popUrl, "배송조회", popOption);
						})//배송조회페이지 end

		//환불요청페이지
		$(".ordercancle").click(function() {

			var gid = $(this).attr("data-num");
			var confirmed = $(".ordercancle").val();
			console.log(gid, confirmed);
			$.ajax({
				type : "POST",
				url : "return_goods",
				data : {
					gid : gid,
					confirmed : confirmed
				},
				dataType : "text",
				success : function(data, status, xhr) {

					alert("환불요청이 완료되었습니다");
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			})//ajax end

		});//환불요청 end

	});//ready end
</script>
</head>
<body>
	<c:forEach var="odto" items="${info}" begin="0" end="0">

		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="container">
			<div>주문상세내역</div>
			<span>[주문날짜 :${odto.ordate}]</span>
	</c:forEach>
	<hr>
	<div id="deliverly">


		<div id="container">
			<div id="contents">

				<div class="deliver_info">
					<div class="deliver_css" style="margin: 0 !important;"></div>

					<div class="orderlist">


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
									<th scope="col">수량</th>
									<th scope="col">상품 구매금액</th>
									<th scope="col">배송상태</th>
									<th scope="col">비고</th>
								</tr>
							</thead>
							<tbody class="order_info">

								<c:set var="total" value="0" />
								<c:forEach var="odto" items="${info}" varStatus="status">
									<tr class="order_infolist">
										<td>${odto.opindex}</td>
										<td class="thumb"><img alt=""
											src="resources/images/items/${odto.gimage}"></td>
										<td class="product"><a href=""><strong><class="name">${odto.gname}</strong>
												<span class="icon"></span></a>
											<ul class="option">[옵션:
												색상:${odto.gcolor},사이즈:${odto.gsize}]
											</ul></td>
										<td><label>${odto.gamount} 개</label></td>
										<td class="price">

											<div class="">
												<strong>${odto.gprice * odto.gamount} 원</strong>
											</div> <c:set var="total"
												value="${total + (odto.gprice * odto.gamount)}" />
										</td>
										<td class="del"><strong> <c:choose>
													<c:when test="${odto.oconfirmed != 0 }">
														<span>환불완료</span>
													</c:when>
													<c:when test="${odto.odelivery != 0 }">
														<a href="" class="deliver"><span>${odto.deliverystatus}</span></a>
													</c:when>

													<c:when test="${odto.opaymentcheck == 1}">
														<span>결재 완료</span>
													</c:when>
													<c:when test="${odto.opaymentcheck == 0}">
														<span>결재 진행중</span>
													</c:when>


												</c:choose>
										</strong></td>
										<td class="button">

											<button class="ordercancle" data-num="${odto.gid}" value="1">
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
		</div>

		<!-- orderChart -->

	</div>
	<div>
		<div class="infomation_delivery">
			<div class="info_deli">배송지정보</div>
			<table class="info_table" border="0" width="400">
				<c:forEach var="odto" items="${info}" begin="0" end="0">
					<tr>

						<th>이름</th>

						<td>${odto.oname}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${odto.ophone1}-${odto.ophone2}-${odto.ophone3}</td>
					</tr>
					<tr>
						<th>배송지 주소</th>
						<td>${odto.oaddress1}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<!-- 배송지정보 -->
		<div class="information_cuopon">
			<div class="info_coupon">쿠폰정보</div>
			<table class="coupon_table" border="0" width="400">
				<c:forEach var="odto" items="${info}" begin="0" end="0">

					<tr>
						<th>쿠폰코드</th>
						<td>${odto.code}</td>
					</tr>
					<tr>
						<th>할인율</th>
						<td>${odto.discount}%</td>
					</tr>
				</c:forEach>
				<c:forEach var="odto" items="${info}" begin="0" end="0">
					<tr>
						<th>할인금액</th>
						<td>${total - odto.oprice }원</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!-- 쿠폰정보 -->
		<div class="information_sign">
			<div class="info_sign">결재수단</div>
			<table class="sign_table" border="0" width="400">
				<c:forEach var="odto" items="${info}" begin="0" end="0">
					<tr>
						<th>상품합계</th>
						<td>${total}원</td>
					</tr>
					<tr>
						<th>할인금액</th>
						<td><c:out value="${total - odto.oprice}" />원</td>
					</tr>
					<tr>
						<th>최종결재금액</th>
						<td>${odto.oprice}원</td>
					</tr>
					<c:if test="${!empty odto.used}">
						<tr>
							<th>결재수단</th>
							<td>카드결재</td>
						</tr>
					</c:if>
					<c:if test="${empty odto.used}">
						<tr>
							<th>결재수단</th>
							<td>계좌이체</td>
						</tr>
						<tr>
							<th>계좌번호</th>
							<td>농협 16511-5468-46512(예금주: 에이콘 1조 프로젝트)</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
		<!-- 결재정보 -->
	</div>
	</div>

</body>
</html>