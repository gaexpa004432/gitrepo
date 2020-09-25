<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInsertOutput.jsp</title>
</head>
<body>
	
<form action="${pageContext.request.contextPath}/member/memberLogin.jsp">
	${memberOne.member_name}님 회원 가입을 축하합니다!!<br>
	로그인페이지로 이동 <button>로그인이동</button>
</form>
</body>
</html>