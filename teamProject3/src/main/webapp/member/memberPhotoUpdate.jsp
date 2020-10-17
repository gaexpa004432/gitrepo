<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberPhotoUpdate.jsp</title>
<style>
.photo  {
	text-align:center;
}

#photo {
	max-width : 1000px;
}

</style>
<script>
$(function() {
	$("#photo").css("cursor","pointer").click(function() {
		console.log($(this));
	});	  
});
</script>
</head>
<body>
<div>
<c:if test="${empty sessionScope.login.member_image}">
	<div class="photo">
		<img src="/teamProject3/img/face_icon.png" id="photo" style="width:500px" class="img-fluid rounded-circle img"/>
	</div>
</c:if>

<c:if test="${not empty sessionScope.login.member_image}">
	<div class="photo">
		<img src="/teamProject3/img/${sessionScope.login.member_image}" id="photo" class="img-fluid rounded-circle"/>
	</div>
</c:if>
</div>
</body>
</html>