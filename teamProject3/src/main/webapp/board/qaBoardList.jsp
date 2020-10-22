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

form {
	text-align: center;
}

 .table-striped {
	margin-top: 50px;
} 

</style>
<script type="text/javascript">
$(function(){
	console.log("${sessionScope.id}" )
	console.log("${sessionScope.login}" )
	$(".secret").on("click",function(){
	var member = $(this).data("member")
		if($(this).data("member") == "${sessionScope.id}" ){
			var no =  $(this).data('no');
			location.href="qaBoardView.do?board_no="+no; 
		}else{
			alert("접근 권한이 없습니다.");
		}
	})
})
</script>
</head>
<body>
<%@include  file="/common/qa.jsp" %>
<div class="container">
	<table class="table table-striped" >
		<thead>
		<tr>
			<th>번호</th>
			
			<th>제목</td>
			<th>아이디</th>
			<th>작성일</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="board">
		<tr>
			<td>${board.board_no }</td>
			<c:if test="${board.board_passyn == null}"> <!-- if태그가 참일때 if태그 사이에 있는것을 문서에 삽입 -->
			<td><a href="qaBoardView.do?board_no=${board.board_no }">${board.board_sub }</a></td>
			</c:if>
			<c:if test="${board.board_passyn == 'on'}">
			<td><a class="secret" href="javascript:void(0);" data-no="${board.board_no}" data-member="${board.member_id}">
			<img src="/teamProject3/images/비밀글.png"
							style="max-width: 14px">&nbsp;&nbsp;비밀글입니다.
			</a></td>
			</c:if>
			<!-- 제목 누르면 view페이지로 넘어감 -->
			<td>${board.member_id }</td>
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
	<a class="btn btn-default pull-right" onclick="checklogin()">글쓰기</a>
	<my:paging paging="${paging}" jsfunc="gopage" />
<script>
   function gopage(p) {         // 검색 function
      searchFrm.p.value = p;      // 페이지번호 받아와서 submit에 넘김
      searchFrm.submit();     
   }
   
   function checklogin() {
	   if( ${empty sessionScope.id }){
		   alert("로그인 후 글쓰기가 가능합니다.");
		   location.href = '/teamProject3/member/memberLogin.jsp';
	   } else {
		   location.href = '/teamProject3/board/qaBoardWrite.jsp';
	   }
   }
   
</script>
</div>
<script type="text/javascript" src="/teamProject3/board/css/bootstrap.js"></script>
</body>
</html>