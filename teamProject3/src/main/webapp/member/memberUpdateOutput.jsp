<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberUpdateOutput.jsp</title>
<script>
$(function() {
	$("#btnMypage").on("click", function() {
		location.href='/teamProject3/member/myPageMenu.jsp';
	});	
});
</script>
</head>
<body>
<div class="contact-form spad">
	<div class="container">
	    <div class="row">
	        <div class="col-lg-12">
	            <div class="contact__form__title">
	                <h2>정보수정이 정상적으로 처리 됐습니다!${cnt}!</h2>
	            </div>
	        </div>
	        <div class="col-lg-12 text-center">
	                <button type="submit" id="btnMypage" class="site-btn">mypage</button>
           	</div>
        </div>
    </div>
</div>
</body>
</html>