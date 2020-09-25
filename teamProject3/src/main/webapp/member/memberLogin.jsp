<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberLogin.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	if("${errormsg}" != "") {
		alert("${errormsg}");
	}; 
	/* if("${errormsg}" != "") {
  		$("#btnLogin").on("click", function() {
  			alert("${errormsg}");
  		});
	}; */
}); 
</script>
</head>
<body>
	
	<form method="post" action="login.do">
		<div>
			<label>ID </label>
			<input type="text" name="member_id">
		</div>
		<div>
			<label>PW </label>
			<input type="password" name="member_pass" id="member_pass">
		</div>
		<button id="btnLogin">로그인</button>
	</form>
	
	
	
</body>
</html>