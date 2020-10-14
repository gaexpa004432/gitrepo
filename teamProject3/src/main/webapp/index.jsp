<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
console.log("${sessionScope.id}")
if(${sessionScope.id eq 'vegan'}){
	location.href="/"; 
}
	
</script>
</head>
<body>

</body>
</html> 