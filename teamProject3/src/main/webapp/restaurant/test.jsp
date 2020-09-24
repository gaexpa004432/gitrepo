<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>





<script>

	$(function(){
		
		$("#files").on("click",function(){
			$("#gg").show();
			$("#ff").hide();
		})
		
	})

</script>
</head>
<body>
	<input type="button" id="files" name="name" >
	<input id="gg" placeholder="gg" hidden="hidden">
	<input id="ff" >
</body>
</html>