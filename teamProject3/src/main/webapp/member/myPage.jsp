<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<style>
	
	/* div {
		border : 1px solid black;
	}
	 */
</style>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<title>myPage.jsp</title>
</head>
<body>
<form>
<h1 align="center">마이페이지</h1> 
<div class="container">
	<div class="row">
		<div class="col-md-4">first
			<div class="row">
				<div id="a"class="col-md-4">first1</div>
				<div class="col-md-4">second1</div>
				<div class="col-md-4">third1</div>
			</div>
		</div>
		
		<div class="col-md-4">second</div>
		<div class="col-md-4">third</div>
	</div>
</div>
<ul>
	<a href="#"><li>주문 내역 조회</a>
	<a href="#"><li>나의활동</a>
	<a href="#"><li>나의관심글</a>
	<a href="#"><li>1:1문의</a>
	<div>
		
		<a href="select.do">
		<li>내정보 조회 및 수정</a>
		${sessionScope.login.member_id}
	</div>
	<a href="#"><li>마일리지 조회</a>
	<a href="#"><li>탈퇴</a>
</ul>
</form>
</body>
</html>