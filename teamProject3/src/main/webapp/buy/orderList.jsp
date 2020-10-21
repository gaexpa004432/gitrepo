<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css ">
      <script src="//cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script>

$(document).ready(function() {
	   $("#orderlist").DataTable({
	      lengthMenu: [ 5, 10, 20, 30, 50 ],
	   
	         // 기본 표시 건수를 50건으로 설정
	         displayLength: 5, 
	      });
	});

</script>
<style>
	#orderid {
		text-align : center;
		font-weight : bold;
		font-size : 20px;
	}
	
	#spanid {
		margin-left : auto;
		margin-right : auto;
	}
</style>
</head>
<body>
<%@include file="/common/buy.jsp" %>
<br>

					<div id="spanid">
							<span id="orderid">${VO.member_name}님의 주문내역입니다.</span>
							<br>
							<br>

					</div>
					
					<table id="orderlist">
						<thead align="center">
							<tr bgcolor="#99FFCC">
							<th>주문번호</th>
							<th>주문일시</th>
							<th>재료 이름</th>
							<th>주문상태</th>
							<th>가격</th>
							</tr>
						</thead>
					
					
						<tbody align="center">
						<c:forEach items="${list}" var="order">
							<tr>
							<td>${order.order_number}</td>
							<td>${order.order_date}</td>
							<td>${order.product_name}</td>
							<c:if test="${order.order_status == 'ow'}">
							<td>처리 중</td>
							</c:if>
							<c:if test="${order.order_status == 'oa'}">
							<td>주문 완료</td>
							</c:if>
							<c:if test="${order.order_status == 'or'}">
							<td>주문 거절</td>
							</c:if>
							<td>${order.product_price}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
</body>
</html>