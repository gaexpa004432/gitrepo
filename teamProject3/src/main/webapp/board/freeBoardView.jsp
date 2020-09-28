<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC *-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<link rel="stylesheet" href="/teamProject3/board/css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/teamProject3/board/css/site.css">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
<script type="text/javascript" src="script/board.js"></script>
<script>
$(function(){
	$("#gg").on("click",function (){
	
		var result = confirm('정말로 삭제하시겠습니까?');
		if (result) {
		location.href="/teamProject3/freeBoardDelete.do?board_no=${board.board_no}"
		}
	})
	
	if (${id == board.member_id}){
		$(".btn").show();
	}
})
</script>
</head>
<body>
	<div id="wrap" align="center">
		<h1>게시글 상세보기</h1>
		<table>
		<tr>
		  <th>작성자</th>
		  <td>${board.member_name}</td>
		 </tr>
		 <tr>
		  <th>제목</th>
		  <td colspan="3">${board.board_sub}</td>
		  </tr>
		  <tr>
		  <th>내용</th>
		  <td colspan="3">${board.board_content}</td>
		  </tr>	
		  
		  
		 </table>
		 <br><br>
		 <button type="button" class="btn" onclick="location.href='/teamProject3/freeBoardList.do'"/>목록</button>
		 <!-- 게시물 목록이 안나옴 ?? -->
		 <button type="button" class="btn" style="display:none" onclick="location.href='/teamProject3/freeBoardUpdate.do?board_no=${board.board_no}'"/>수정</button>
		 <button type="button" class="btn" style="display:none">삭제</button>
		 <a id="gg"></a>
		 
</div>
</body>
</html>
