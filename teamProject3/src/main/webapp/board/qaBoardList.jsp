<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/teamProject3/board/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="jquery-ui.js"></script>
<style>
 #divPaging {
          clear:both; 
        margin:0 auto; 
        width:220px; 
        height:50px;
}

    #divPaging > div {
        float:left;
        width: 30px;
        margin:0 auto;
        text-align:center;
}


</style>
</head>
<body>
<div class="container">
	<table class="table table-striped" >
		<thead>
		<tr>
			<th>번호</th>
			<th></th>
			<th>제목</td>
			<th>이름</th>
			<th>작성일</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="board">
		<tr>
			<td>${board.board_no }</td>
				<c:if test="${!empty board.board_file }">
			<td><img src="/teamProject3/images/${ board.board_file }" style="width: 50px; height: 50px;"></td>
				</c:if>
				<c:if test="${empty board.board_file }">
					<td></td>
				</c:if>
			<td><a href="qaBoardView.do?board_no=${board.board_no }">${board.board_sub }</a></td>
			<!-- 제목 누르면 view페이지로 넘어감 -->
			<td>${board.member_name }</td>
			<td>${board.board_date }</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	<form name="searchFrm">      <%-- 검색 폼 생성 --%>
   <input type="hidden" name="p" value="1">
   <input name="board_search">
   <button>검색</button>
</form>
	<hr/>
	<a href ="/teamProject3/board/qaBoardWrite.jsp" class="btn btn-default pull-right">글쓰기</a>
	<my:paging paging="${paging}" jsfunc="gopage" />
<script>
   function gopage(p) {         // 검색 function
      searchFrm.p.value = p;      // 페이지번호 받아와서 submit에 넘김
      searchFrm.submit();     
   }
</script>
</div>
<script type="text/javascript" src="/teamProject3/board/css/bootstrap.js"></script>
</body>
</html>