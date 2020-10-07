<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.order-list-table {
		padding : 3px;
	}
	
	.end {
		font-size : 60px;
	}

	.order-list-table {
		align : center;
	}
</style>
</head>
<body>
<form action="${pageContext.request.contextPath}/orderOutput.do" name="frm" id="frm">
<img src="">
<h1 align="center" class="end">구매가 완료되었습니다.</h1>
<h3 align="center" class="end1">더 나은 서비스와 질로 보답하겠습니다.</h3>
<hr>
	<table class="order-list-table">
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
		<div class="product-name"><a href="">${result.product_name}</a></div>
		<div class="product-order-num">${result.order_number}</div>
		</div>
	</td>
	
	<!-- 수량 -->
	<td class="product-quantity">
	${reuslt.order_Detail_no}
	</td>
	
	<!-- 판매자 -->
	<td class="seller-td">
	<span class="seller-code">
	${result.seller_code}
	</span>
	</td>
	
	<!-- status -->
	<td class="status">
	${result.order_status}
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