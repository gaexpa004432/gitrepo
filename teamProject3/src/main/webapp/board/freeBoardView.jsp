<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap" align="center">
	<h1>게시글 상세보기</h1>
	<table>
		<tr>
			<th>이름</th>
			<td>${board.member_name}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${board.board_sub}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><pre>${board.board_content}</pre>
		</tr>
		
	</table>
	<br> <br>
	</div>
</body>
</html>