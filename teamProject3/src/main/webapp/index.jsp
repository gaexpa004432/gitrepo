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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<!-- <style>
.bxslider li { width:500px; }
</style> -->
</head>
<body>
<div class="container">
<ul class="bxslider"> 
<li><img src="images/샐러드레시피.jpg" /></li>
<li><img src="images/채식정의.png" /></li>
<li><img src="images/적립금.png" /></li>
<li><img src="images/커피.jpg" /></li>
</div>
<script type="text/javascript"> 
$(document).ready(function(){ 
	$('.bxslider').bxSlider({
		auto: true,
		autoControls: true
	});
	});
</script>

</body>
</html> 