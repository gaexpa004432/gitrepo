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
	   $("#Mildata").DataTable({
	      lengthMenu: [ 5, 10, 20, 30, 50 ],
	   
	         // 기본 표시 건수를 50건으로 설정
	         displayLength: 5, 
	      });
	});

</script>
</head>
<style>
	#Mildata {
		text-align : center;
	}
	
	#tr_font h5{
		color : blue;
	}	

</style>

<body>
<%@include file="/common/mileage.jsp" %>

			<hr>
	<div id="mileage-table">
		<table id="Mildata" >
		
			<thead align="center" >
				<tr id="tr_font" bgcolor="#99FFCC">
					<th>구분</th>
					<th>내용</th>
					<th>금액</th>
					<th>등록일</th>
					<th>잔여금액</th>
				</tr>
			</thead>
			
			<tbody align="center">
			<c:forEach items="${mil_list}" var="mil">
				<tr class="active-row">
					<td class="group_code">${mil.group_code}</td>
					<td class="mileage_contents">${mil.mileage_contents}</td>
					<td class="mileage_cost">${mil.mileage_cost}P</td>
					<td>${mil.mileage_date}</td>
					<td class="remaining">${mil.remaining}</td>
				</tr>
			</c:forEach> 
			</tbody>
		</table>	
	</div>	
	</body>
</html>