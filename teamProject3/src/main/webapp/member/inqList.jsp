<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inqList.jsp</title>
<script>
$(function() {
	$("#btnInq").on("click", function(){
		location.href = "inqInsert.jsp";
	});
});
</script>
</head>
<body>
	<h1>1:1문의 목록</h1>
	<hr>
	<button id="btnInq">1:1문의하기</button>
	<hr>
	<table border="1" id="inqList">
		<thead>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>답변여부</th>
				<th>답변인</th>
			</tr>
		</thead>
		<tbody>
		<%-- <c:forEach items="${list}" var="member"> 
			<tr>
				<td><a href="memberSelect.jsp">${member.getId()}</a></td>
				<td>${member.getPw()}</td>
				<td>${member.job}</td>
				<td>
					<c:if test="${member.mailyn == 'y'}">
						<button type="button">메일발송</button>
					</c:if>
				</td>
				<td>${member.gender}</td>
				<td>${member.reason}</td>
				<td>${member.hobby}</td>
				<td>
					<fmt:parseDate value="${member.regdate}" pattern="yyyy-MM" var="parseDate"/>
					<fmt:formatDate value="${parseDate}" pattern="yyyy/MM"/>
				</td>
			</tr>
		</c:forEach> --%>
		</tbody>
	</table>
		
</body>
</html>