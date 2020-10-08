<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inqInsertOutput.jsp</title>
</head>
<body>
	문의 ${cnt}건이 등록 되었습니다.
<button type="button" id="btnMypage">마이페이지</button>
	
<script>
btnMypage.addEventListener("click", goMypage);

function goMypage() {
	location.assign("/teamProject3/member/myPage.jsp");
}
</script>
</body>
</html>