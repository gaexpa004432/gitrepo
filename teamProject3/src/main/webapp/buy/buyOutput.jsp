<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아웃풋</title>
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
<script>
	$('#go-list').on("click", function() {
		location.href = "${pageContext.request.contextPath}/orderList.do?member_id=" + ${vo.member_id};
	});
	
	function golist() {
		location.href = "${pageContext.request.contextPath}/orderList.do?member_id=" + ${vo.member_id};
	}
</script>
</head>
<body>

<img src="">
<h1 align="center" class="end">구매가 완료되었습니다.</h1>
<h3 align="center" class="end1">더 나은 서비스와 질로 보답하겠습니다.</h3>
<hr>
	${vo.member_id}
	<button id="go-list"  onclick='golist()'>주문상세 페이지로!</button>
	
</body>
</html>