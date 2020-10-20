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
<div class="contact-form spad">
	<div class="container">
	    <div class="row">
	        <div class="col-lg-12">
	            <div class="contact__form__title">
	                <h2>${memberOne.member_name}님 회원 가입을 축하합니다!!</h2>
	            </div>
	        </div>
	        <div class="col-lg-12 text-center">
	                <button type="submit" class="site-btn">Login</button>
           	</div>
        </div>
    </div>
</div>
</form>
</body>
</html>