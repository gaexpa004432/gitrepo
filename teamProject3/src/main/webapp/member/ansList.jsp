<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ansList.jsp</title>
</head>
<body>
	<table border="1" id="inqList">
		<thead>
			<tr>
				<th>제목</th>
				<th>날짜</th>
				<th>작성자</th>
				<th>답변여부</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="inq"> 
			<tr>
				<td><a href="${pageContext.request.contextPath}/ansSelect.do?inq_no=${inq.inq_no}">${inq.inq_title}</a></td>
				<td>
					<fmt:parseDate value="${inq.inq_regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parseDate"/>
					<fmt:formatDate value="${parseDate}" pattern="yyyy-MM-dd HH:mm"/>
				</td>
				<td>${inq.member_id}</td>
				<td>
				<c:choose>
					<c:when test="${not empty inq.inq_answer}">
						답변완료
					</c:when>
					<c:when test="${empty inq.inq_answer}">
						<a href="${pageContext.request.contextPath}/ansSelect.do?inq_no=${inq.inq_no}">답변대기</a>
					</c:when>
				</c:choose>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>