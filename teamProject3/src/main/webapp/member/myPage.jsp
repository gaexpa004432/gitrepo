<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	
	/* div {
		border : 1px solid black;
	}
	 */
</style>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<title>myPage.jsp</title>
</head>
<body>
<form>
<h1 align="center">마이페이지</h1> 
<!-- <div class="container">
	<div class="row">
		<div class="col-md-4">first
			<div class="row">
				<div id="a"class="col-md-4">first1</div>
				<div class="col-md-4">second1</div>
				<div class="col-md-4">third1</div>
			</div>
		</div>
		
		<div class="col-md-4">second</div>
		<div class="col-md-4">third</div>
	</div>
</div> -->
<ul>
	<li><a href="#">주문 내역 조회</a>
	<li><a href="#">나의활동</a>
	<li><a href="${pageContext.request.contextPath}/favList.do?fav=fs">나의 즐겨찾기</a>
	<c:choose>
		<c:when test="${sessionScope.login.seller_code != 0}">
			<li><a href="${pageContext.request.contextPath}/ansList.do">1:1문의</a>
		</c:when>
		<c:when test="${sessionScope.login.seller_code == 0}">
			<li><a href="${pageContext.request.contextPath}/inqList.do">1:1문의</a>
		</c:when>
	</c:choose>
	<li><a href="${pageContext.request.contextPath}/select.do">내정보 조회 및 수정</a>
	<li><a href="#">마일리지 조회</a>
	<c:choose>
		<c:when test="${sessionScope.login.seller_code != 0}">
			<li><a href="${pageContext.request.contextPath}/member/memberAddUpdate.jsp">소상공인 정보 수정 및 조회</a>
			<!-- <li><a href="${pageContext.request.contextPath}/sellList.do">판매내역</a> -->
			<li><a href="${pageContext.request.contextPath}/sellList.do">판매내역</a>
		</c:when>
		<c:when test="${sessionScope.login.seller_code == 0}">
			<li><a href="${pageContext.request.contextPath}/member/memberAddInsert.jsp">소상공인 추가정보 등록</a>
		</c:when>
	</c:choose>
	<li><a href="#">탈퇴</a>
</ul>
</form>
</body>
</html>