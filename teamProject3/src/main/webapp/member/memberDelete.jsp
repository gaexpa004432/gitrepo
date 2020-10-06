<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

p {font-size: 13px;}
table {
   border-collapse: collapse;
   text-align: left;
   line-height: 1.5;
   border-top: 1px solid #ccc;
   border-left: 3px solid #369;
   margin: 20px 10px;
}
table th {
   width: 147px;
   padding: 10px;
   font-weight: bold;
   vertical-align: top;
   color: #153d73;
   border-right: 1px solid #ccc;
   border-bottom: 1px solid #ccc;
}
table td {
   width: 200px;
   padding: 10px;
   vertical-align: top;
   border-right: 1px solid #ccc;
   border-bottom: 1px solid #ccc;
}
tr:hover {
   background-color: lightgrey;
}

h2 {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container" align="center">
	
	<h2>회원탈퇴</h2>
	<br>
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="member_id"></td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><input type="text" name="member_pass"></td>
			</tr>
	</table>
	<p>*회원탈퇴를 원하시는 경우, 본인확인을 위해 비밀번호를 한 번 더 입력해 주세요.</p>
	 <input class="btn1" type="submit" value="확인" align="center";>&nbsp;&nbsp;
     <input class="btn1" type="button" value="취소" onclick="javascript:history.back()">
	</div>
	<br><br><br><br>
</body>
</html>