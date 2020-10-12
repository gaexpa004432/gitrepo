<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
	<script
	src="//cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$(document).ready( function () {
	    $('#tb').DataTable();
	} );
	
})
</script>
</head>
<body>
<div class="container">
	<table id="tb" class="table table-striped table-bordered">
		<thead><tr><th>id</th><th>name</th><th>adress</th><th>gender</th><th>birth</th><th>type</th><th>mileage</th><th>email</th><th></th></tr></thead>
	<tbody>
<c:forEach items="${list }" var="member">
	 <c:set var = "string" value = "${fn:substring(member.member_birth, 0, 10)}" />
	<tr>
		<td>${member.member_id }</td>
	<td>${member.member_name }</td>
	<td>${member.member_roadAddress }</td>
	<td>${member.member_gender }</td>
	<td>${string }</td>
	<td>${member.member_type }</td>
	<td>${member.member_mileage }</td>
	<td>${member.member_email }</td>
	<td align="center"><button class="btn btn-info">수정</button>&nbsp&nbsp<button class="btn btn-danger">삭제</button></td>
	</tr>
</c:forEach>
	</tbody>
	</table>
</div>
</body>
</html>