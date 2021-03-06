<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderList</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/orderList.do">
<img src="">
<h1 align="center" class="end">주문내역</h1>
<hr>
	<table>
		<thead>
		<tr>
			<td>구매자이름</td>
			<td>구매자번호</td>
			<td>구매자이메일</td>
		<tr>
		</thead>
		<tbody>
		<tr>
			<td>${list.member_name}</td>
			<td>${list.member_tel}</td>
			<td>${list.member_address}</td>
		</tr>
		</tbody>
	</table>
	
	<hr>

	<table class="order-list-table" border="1">
		<colgroup>
		<col style="width:auto;">
		<col style="width:175px;">
		<col style="width:102px;">
		<col style="width:102px;">
		</colgroup>
	<thead align="center">
		<tr>
		<th scope="col">상품명</th>
		<th scope="col">수량</th>
		<th scope="col">판매자ID</th>
		<th scope="col">주문상태</th>
		<th scope="col">주문일/결제금액</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="result">
	<tr>
	<td class="product">
		<div class="product-block">
		<div class="product-content"></div>
		<div class="product-order-num">${result.order_number}</div>
		<div class="product-name">${result.product_name}</div>
		</div>
	</td>
	
	<!-- 수량 -->
	<td class="product-quantity">
	${result.recipe_name}
	</td>
	
	<!-- 판매자 -->
	<td class="seller-td">
	<span class="seller-code">
	${result.product_price}
	</span>
	</td>
	
	<td class="datetotal">
	<div class="order-date">주문날짜 : ${result.order_date}</div>
	<div class="total-charge">구매금액 : ${result.order_total} 
	<strong class="charge"><span></span>원</strong>
	</div>
	</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	<hr>
</form>
</body>
</html>