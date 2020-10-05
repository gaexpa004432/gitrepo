<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qaDirectInsert.jsp</title>
<style>
.container {
	display : block;
	margin: 0 auto;
}


#text-title {
	display : inline-block;
		
}

#title-label {
	background-color : yellow;
	margin-right : 50%
}

#inq_title {
	background-color : red;
	
}


</style>
</head>
<body>
	<div class="container">
	
		
		<form action="" method="post">
		<h1 >1:1 문의</h1>
		<hr>
			<div id="text-title">
				<label id="title-label">제목</label>
				<input type="text" id="inq_title" name="inq_title">
			</div>		
		<hr>
			<div>
				<label>문의하실 내용</label>
			</div>
			<div>
				<textarea rows="18" cols="80" id="inq_content" name="inq_content"></textarea>
			</div>
			
			
		
		</form>

	</div>
</body>
</html>