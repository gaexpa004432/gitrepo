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
<title>myPage.jsp</title>
</head>
<body>
<form>
<h1 align="center">마이페이지</h1> 
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
	<li><a href="${pageContext.request.contextPath}/mileageController.do">마일리지 조회</a>
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

	<li><a href="/teamproject3/member/memberDelete.jsp">탈퇴</a>

</ul>
</form>
</body>
</html>