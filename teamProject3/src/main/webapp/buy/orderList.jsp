<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>주문자 정보</h3>
					<div>
							<span>${VO.member_name}</span>
							<span>${VO.member_tel}</span>
							<span>${VO.member_email}</span>
					</div>
					
	<h3>주문 정보</h3>
					<table border='1'>
						<thead>
							<tr>
							<td>주문번호</td>
							<td>주문일시</td>
							<td>재료 이름</td>
							<td>주문상태</td>
							<td>총 가격</td>
							</tr>
						</thead>
					
					
						<tbody>
						<c:forEach items="${list}" var="order">
							<tr>
							<td>${order.order_number}</td>
							<td>${order.order_date}</td>
							<td>${order.product_name}</td>
							<td>${order.order_status}</td>
							<td>${order.order_total}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
</body>
</html>