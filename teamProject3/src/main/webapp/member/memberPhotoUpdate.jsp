<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberPhotoUpdate.jsp</title>
<style>
.img {
	align
}
</style>
</head>
<body>
<div>
<c:if test="${empty sessionScope.login.member_image}">
	<div>
		<img src="/teamProject3/img/face_icon.png" class="img-fluid rounded-circle img"/>
	</div>
</c:if>

<c:if test="${not empty sessionScope.login.member_image}">
	<div>
		<img src="/teamProject3/img/${sessionScope.login.member_image}" class="img-fluid rounded-circle"/>
	</div>
</c:if>
</div>
</body>
</html>