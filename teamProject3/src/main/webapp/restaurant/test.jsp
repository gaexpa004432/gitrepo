<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
var a = "a";
	if(a=="a"){
		$("#img").text("a")
		
	}else{
		$("#img").text("b")
		a = "b";
	}
	
		
		$("#on").on("click",function(){
			if(a == "a"){
				console.log("ajax");
				$("#img").text("b")
				a="b";
			}else{
				console.log("delete ajax");
				$("#img").text("a")
				a="a";
			}
			
		})
		
	
})
</script>
</head>
<body>
	<button id="on">버튼</button>
	<h1 id="img"></h1>
</body>
</html>