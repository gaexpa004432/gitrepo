<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberOutput.jsp</title>
</head>
<body>
	${sessionScope.login.member_id}님     <a href="logout.do">로그아웃</a>
	<a href="myPage.jsp">마이페이지</a> 
</body>
</html>