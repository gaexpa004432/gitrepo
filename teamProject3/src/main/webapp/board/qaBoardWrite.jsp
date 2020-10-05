<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/qaBoardWrite.do">
<!-- form태그안에 있는 데이터를 보내는 기능  -->
	제목<input type="text" name="qaboard_sub">
	내용<input type="text" name="qaboard_content">
	첨부파일<input type="file" name="qaboard_file">
	비밀글여부<input type="checkbox" name="qaboard_passyn">
	<button>등록</button>
	</form> 
</body>
</html>