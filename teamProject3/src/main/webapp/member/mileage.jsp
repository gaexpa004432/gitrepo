<%@page import="model.orderVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
	.mileage {
	border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
	}

</style>
<body>
		<h3>마일리지 현황</h3>
			<hr>
	<form action="${pageContext.request.contextPath}/mileageController.do">
	<div id="mileage-table">
		<table border='1' class="mileage">
		
			<thead>
				<tr>
					<th>구분</th>
					<th>내용</th>
					<th>금액</th>
					<th>날짜</th>
					<th>잔여</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${mil_list}" var="mil">
				<tr>
					<td class="group_code">${mil.group_code}</td>
					<td class="mileage_contents">${mil.mileage_contents}</td>
					<td class="mileage_cost">${mil.mileage_cost}</td>
					<td>${mil.mileage_date}</td>
					<td class="remaining">${mil.remaining}</td>
				</tr>
			</c:forEach> 
			</tbody>
		</table>	
	</div>	
	</form>
</body>
</html>