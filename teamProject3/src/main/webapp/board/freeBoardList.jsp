<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="jquery-ui.js"></script>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
		<c:forEach items="${list}" var="board">
			<!-- 컨트롤러에서 보내준 리스트가 board로 이름만 바뀜 -->
			<!--db에서 들고온 리스트를 컨트롤러를 거쳐서 jsp페이지로 받아옴 -->

			<tr>
				<td>${board.board_no }<td><a href="#">${board.board_no}</a></td>
				<td>${board.member_name}</td>
			<td>${board.board_sub}</td>
			<td>${board.board_date}</td>
			<td><a href="freeBoardDelete.do?board_no=${board.board_no}">삭제</a></td>
			<!-- ?뒤가 파라미터 -->
			</tr>
			</c:forEach>
			<tr>
				<td colspan="5"><a href="freeBoardWrite.do">글작성</a></td>
			</tr>	
	</table>
<%-- <div id="msg">
<<form id="frm" action="${pageContext.request.contextPath}/freeBoardUpdate.do" align="center">
</form>
</div>--%>
</body>

</html>