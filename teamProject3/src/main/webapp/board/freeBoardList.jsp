<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/
html14/loose.dtd">
<html>
<head>
<meta http-eqiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp게시판 웹사이트</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
</head>
<body>
	<div id="wrap" align="center">
		<h1>게시글 리스트</h1>
		<table id="board">
		<thead>
			<tr>
				<th>no</th>
				<th>name</th>
				<th>content</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="member">
			<tr>
				<td><a href="#">${member.name}</a></td>
				<td>${board.getNo()}</td>
				<td>${member.getId()}</td>
				
				<td>
					${member.getMailyn()}
					<button type="button">메일발송</button>
					</td>
				<td>${member.getGender()}</td>
				<td>${member.getRegdate()}</td>
				
				
			</tr>
			</c:forEach>
		</tbody>	
		
		</table>
	</div>
</body>
</html>