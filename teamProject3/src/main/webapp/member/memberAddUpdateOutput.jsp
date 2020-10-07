<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberAddUpdateOutput.jsp</title>
</head>
<body>
	${cnt}건이 수정되었습니다.
	
<button type="button" id="btnMypage">마이페이지</button>
<script>
	btnMypage.addEventListener("click", goMypage);
	function goMypage() {
		location.assign("myPage.jsp");
	}
</script>
</body>
</html>