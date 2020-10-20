<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ansSelectOutput.jsp</title>
<script>
$(function() {
	$("#btnAns").on("click", function() {
		location.href='/teamProject3/ansList.do';
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
	                <h2>답변을 등록하셨습니다!${cnt}!</h2>
	            </div>
	        </div>
	        <div class="col-lg-12 text-center">
	                <button type="submit" id="btnAns" class="site-btn">답변내역</button>
           	</div>
        </div>
    </div>
</div>
</body>
</html>