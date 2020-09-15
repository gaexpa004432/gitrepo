<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberLogin.jsp</title>
</head>
<body>
	${errormsg}
	<form method="post" action="login.do">
		<div>
			<label>ID </label>
			<input type="text" name="member_id">
		</div>
		<div>
			<label>PW </label>
			<input type="password" name="member_pass">
		</div>
		<button>로그인</button>
	</form>
</body>
</html>