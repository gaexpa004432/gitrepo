<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/teamProject3/board/css/bootstrap.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<style>
tr:nth-child(even)
{ background-color:#f5F5f5;
}

table {
  border-width : 1px;
  border-style : solid;
  border-color : #F5F5F5;
}

h1,table {font-family: 'Noto Sans KR', sans-serif;}
</style>


<title>Insert title here</title>


<script>
$(function(){
	$("#delbtn").on("click",function (){
	
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
	<div align="center">
		<br><br>
		<h1 style="background-color:#dcdcdc; width:400px; font-size:15px;"><strong>글보기</strong></h1>
		<table style="width:400px">
		<tr>
		 <th>제목</th>
		  <td>${board.board_sub}</td>
		 </tr>
		 <tr>
		  <th>작성자</th>
		  <td>${board.member_name}</td>
		 </tr>
		 <tr>
		  <th>작성일</th>
		  <td>${board.board_date}</td>
		  </tr>
		  <tr>
		  <th>내용</th>
		  <td>${board.board_content}</td>
		  </tr>			  
		 </table>
		 <br><br>
		 <button type="button" class="btn" onclick="location.href='/teamProject3/freeBoardList.do'">목록</button>
		 <!-- 게시물 목록이 안나옴 ?? -->
		 <button type="button" class="btn" style="display:none" onclick="location.href='/teamProject3/freeBoardUpdate.do?board_no=${board.board_no}'">수정</button>
		 <button type="button" class="btn" style="display:none" id="delbtn">삭제</button>
		 <a id="gg"></a>
	</div>
</body>
</html>