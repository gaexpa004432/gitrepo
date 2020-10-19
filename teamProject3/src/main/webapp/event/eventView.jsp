<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/teamProject3/board/css/bootstrap.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<style>



tr:nth-child(even) {
	background-color: #f5F5f5;
}

table {
	border-width: 1px;
	border-style: solid;
	border-color: #F5F5F5;
}

h1, table {
	font-family: 'Noto Sans KR', sans-serif;
}

th {
	width: 70px
}

#review:hover {
	background-color: #f2f2f2;
}


td, th {
	padding: 0.5em;
	padding-top: 0.5em;
	padding-right: 1em;
	padding-left: 1em;
}


h1 {
	padding: 0.1em;
	padding-top: 0.1em;
	padding-right: 0.1em;
	padding-left: 0.1em;
}


</style>


<title>Insert title here</title>


<script>
	$(function(){
	$("#delbtn").on("click",function (){
	
		var result = confirm('정말로 삭제하시겠습니까?');
		if (result) {
		location.href="/teamProject3/eventDelete.do?board_no=${board.board_no}"
		}
	})
	console.log("${sessionScope.id}")
	if (${sessionScope.id == "vegan"}){
		$(".btn").show();
	}
})

</script>

</head>
<body>
	<div align="center" class="container">
		<br> <br>
		<h1 style="background-color: #a7cd80; width: 820px; font-size: 20px;">
			<strong>Event</strong>
		</h1>
		<table style="width: 820px">
			<tr>
				<th width=>작성일</th>
				<td>${board.board_date}</td>
			</tr>
			<tr>
			
				<th></th>
				<td>
				<C:if
						test="${ !empty board.board_file}">
						<img src="/teamProject3/images/${ board.board_file }"
							style="max-width: 90%; margin-top:40px">
				<br>
				${board.board_content}<br> 
					</C:if>

				</td>
			</tr>
		</table>
		<br><br>
		<button type="button" class="btn site-btn"
			onclick="location.href='/teamProject3/eventBoardList.do'">목록</button>&nbsp;&nbsp;
		<!-- 게시물 목록이 안나옴 ?? -->
		<button type="button" class="btn site-btn" style="display: none"
			onclick="location.href='/teamProject3/eventViewUpdate.do?board_no=${board.board_no}'">수정</button>&nbsp;&nbsp;
		<button type="button" class="btn site-btn" style="display: none" id="delbtn">삭제</button>
		<a id="gg"></a> <br> <br> <br>
		<!-- 댓글 리스트 -->
		<!-- <div class="re"></div>
		<br>
		<textarea cols="100" rows="3" id="commentcontent"></textarea>
		<button type="button" id="btnInsert"
			style="width: 60px; border: 0px; height: 65px; vertical-align: top; background-color: #a7cd80;">등록</button>
		<br> <br> <br> <br> <br> -->



	</div>
</html>