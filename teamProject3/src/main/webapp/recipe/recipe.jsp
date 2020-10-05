<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>

</head>
<body>
		<c:forEach items= "${cnt}" var="content">
			<td>${content.recipe_number} || "|" || ${content.recipe_name}</td><br>
			<td>${content.member_id} || "|" || ${content.recipe_date}</td>
			<hr>
			<td>${content.recipe_content}</td>
		</c:forEach>
</body>
</html>