<%@page import="com.dto.ReturnDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.SellerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../common/topbar_s.jsp" flush="true"></jsp:include>
<%
	List<ReturnDTO> list = (List<ReturnDTO>)session.getAttribute("return");

	
%>


<h1 class="h2">반품 현황</h1>
<hr>


<div class="return" style="padding: 20px;">

	<table class="return_table">

		<tr>
			<th>주문번호</th>
			<th>반품자이름</th>
			<th>상품정보</th>
			<th>주문가격</th>
			<th>반품처리 현황</th>
		</tr>
		<%for(int i =0 ; i < list.size() ; i++){
			 ReturnDTO dto = list.get(i);%>
		<%if(dto.getConfirmed()==1 || dto.getOconfirmed() == 2 ) {%>
		<tr>
			<td><%=dto.getOid() %></td>
			<td><%=dto.getOname() %></td>
			<%if(dto.getConfirmed() == 1) {%>
			<td><strong><%=dto.getGname() %></strong> [주소 <%=dto.getOaddress1() %>]</td>
			<%} else if(dto.getOconfirmed() == 2){%>

			<td><strong><%=dto.getOproductname() %></strong> [주소 <%=dto.getOaddress1() %>]</td>
			<%} %>

			<td><%=dto.getOprice() %></td>
			<td>
				<%if(dto.getConfirmed() == 1) {%> 개별반품 <%} else if(dto.getOconfirmed() == 2){%>
				묶음반품 <%} %>
			</td>
		</tr>
		<%} %>
		<%} %>
	</table>
</div>



