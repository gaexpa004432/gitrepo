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
		font-weight : bold;
	}
	
	.end1 {
		font-weight : bold;
	}

	.order-list-table {
		align : center;
	}
	
	
	#orderout {
	margin-left : auto;
	margin-right : auto;
	width : 1400px;
	}
	
	#go-list {
	margin-left : auto;
	margin-right : auto;
	}
	
	#btns {
		align : center;
	}
	
	#cartimg {
	margin-top : 5%;
	}
	
</style>
<script>
$(function() {
	$('#go-list').on("click", function() {
		location.href = '${pageContext.request.contextPath}/orderList.do';
	});
	
	$('#go-main').on("click", function() {
		location.href = '${pageContext.request.contextPath}/index.jsp';
	});
	
})
</script>
</head>
<body>
<%@include file="/common/buy.jsp" %>
<br>
<br>
<br>
<div id="orderout">
<div id="inline">
<img src="${pageContext.request.contextPath}/img/cart.png" id="cartimg">
<h1 align="center" class="end">주문이 완료되었습니다.</h1>
</div>
<h3 align="center" class="end1">${vo.member_id}님의 주문내역은 다음과 같습니다.</h3>
<hr>


<div id="btns">
	<button type="button" id="go-list" class="btn btn-warning btn-lg btn-radius">주문내역 확인</button>
	<button type="button" id="go-main" class="btn btn-warning btn-lg btn-radius">메인페이지</button>
</div>
</div>
</body>
</html>