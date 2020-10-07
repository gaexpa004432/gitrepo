<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inqList.jsp</title>
<script>
/* $(function() {
	$("#btnInq").on("click", function(){
		location.href = "inqSellerId.do";
	});
}); */
</script>
</head>
<body>
	<h1>1:1문의 목록</h1>
	<hr> <!-- 기능 다 구현 할때까지 문의하기 버튼 일단 살려두기 -->
	<form action="inqSellerId.do" method="post">
		<button id="btnInq">1:1문의하기</button>
		<input type="text" name="member_id" value="user5"><!-- 테스트용으로 이 아이디로 보내기  -->
	</form>
	<hr>
	
	<table border="1" id="inqList">
		<thead>
			<tr>
				<th>제목</th>
				<th>날짜</th>
				<th>판매자</th>
				<th>답변여부</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="inq"> 
			<tr>
				<td><a href="inqSelect.do?inq_no=${inq.inq_no}">${inq.inq_title}</a></td>
				<td>
					<fmt:parseDate value="${inq.inq_regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parseDate"/>
					<fmt:formatDate value="${parseDate}" pattern="yyyy-MM-dd HH:mm"/>
				</td>
				<td>
				<sql:query var="rs" dataSource="jdbc/server" ><!-- 집에서는 server, 학원에서는 oracle -->
					select member_id from member where seller_code=${inq.seller_code} 
				</sql:query>
				<c:out value="${rs.rows[0].member_id}"/><!-- 행이 몇줄이나 나올줄은 사람인 나는 알지만, 컴퓨터는 모른다 그래서 몇번째의 행이 필요한지 알려주기 위해서 rows[0]을 사용 -->
				</td>
				<td>
				<c:choose>
					<c:when test="${not empty inq.inq_answer}">
						<a href="inqSelect.do?inq_no=${inq.inq_no}">답변완료</a>
					</c:when>
					<c:when test="${empty inq.inq_answer}">
						처리중
					</c:when>
				</c:choose>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
		
</body>
</html>