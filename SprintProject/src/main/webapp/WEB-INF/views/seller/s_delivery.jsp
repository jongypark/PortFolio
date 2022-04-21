<%@page import="com.dto.SellerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  <jsp:include page="../common/topbar_s.jsp" flush="true"></jsp:include>  



<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>

<script type="text/javascript">
$(function() {
	
	
	//배송현황 업데이트
	$(".del_submit").on("click",function () {
		var oid = $(this).attr("data-num");
		var odelivery = $("#status_form option:selected").val();
		console.log(odelivery,oid);
		 //콘솔에 데이터 파싱 확인
		 $.ajax({
			type:"POST",
			url:"deliveryupdate",
			data:{
				odelivery:odelivery,
				oid:oid
			},
			dataType:"text",
			success: function (data,status,xhr) {
				console.log(data);
				alert("배송현황이 수정되었습니다.");
				location.reload();		
			},
			error: function (xhr,status,error) {
				console.log(error);
			}
			
			
		});//ajax end 
		 
		
	});//업데이트 end
	
				
})//update end
	

</script>


<!-- 여기서부터 작성하면 됩니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <hr>
<h1 class="h2">판매 현황</h1>



<div class="table-responsive" style="padding: 20px;">

	<table class="table">
	
			<tr>
				<th>주문번호</th>
				<th>상품명</th>
				<th>주문가격</th>
				<th>배송현황</th>
				<th>배송현황수정</th>
			</tr>

	
	
			<c:forEach var="del" items="${del}" varStatus="status">
			<tr>
				<td class="oid+${del.oid}" id="oid">${del.oid}</td>
				<td>${del.oproductname}</td>
				<td>${del.oprice}</td>
				<c:choose>
					
						<c:when test="${del.odelivery != 0 }"><td>${del.deliverystatus}</td></c:when>					
						<c:when test="${del.opaymentcheck == 1}"><td>결재 완료</td></c:when>
						<c:when test="${del.opaymentcheck == 0}"><td>결재 진행중</td></c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				
				<td>
				<form id="status_form">
				<select name="status" class="status" id="status_del"${del.oid}>
				<option value="none" selected>==선택==</option>
				<option value="1">상품인수</option>
				<option value="2">배송준비중</option>
				<option value="3">상품이동중</option>
				<option value="4">배송중</option>
				<option value="5">배송완료</option>
				</select>
				 <input type="submit" class="del_submit" value="update"  data-num="${del.oid}">
				</form>
				</td>
				
			</tr>
			</c:forEach>	

	
	</table>
</div>


