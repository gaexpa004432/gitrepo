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
<script type="text/javascript" src="/teamProject3/board/css/bootstrap.js"></script>
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
	text-align:center;
	
}

 .table-striped {
	margin-top: 50px;
} 


</style>
</head>
<body>
<%@include  file="/common/header.jsp" %>

<div class="container">
	<table class="table table-striped" >
		<thead>
		<tr>
			<th>번호</th>
			<th></th>
			<th>제목</td>
			<th>아이디</th>
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
			<td><a href="freeBoardView.do?board_no=${board.board_no }">${board.board_sub }</a></td>
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
	<a class="btn btn-default pull-right" onclick="checklogin()"
	style="margin-bottom:50px;">글쓰기</a>
	<my:paging paging="${paging}" jsfunc="gopage" />
<script>
   function gopage(p) {         // 검색 function
      searchFrm.p.value = p;      // 페이지번호 받아와서 submit에 넘김
      searchFrm.submit();
      
      // location.href="deptSelectAll?p=" + p;   // 이동되는 주소가 달라서 여러사람이 쓰기위해서는 매개값 p로 해줌
   }
   
   function checklogin() {
	 
	   
	   
	   if( ${empty sessionScope.id }){
		   alert("로그인 후 글쓰기가 가능합니다.");
		   location.href = '/teamProject3/member/memberLogin.jsp';
	   } else {
		   location.href = '/teamProject3/board/freeBoardWrite.jsp';
	   }
   }
    
</script>

<!-- 		<c:forEach items="${list}" var="board">
			<!-- 컨트롤러에서 보내준 리스트가 board로 이름만 바뀜 -->
			<!--db에서 들고온 리스트를 컨트롤러를 거쳐서 jsp페이지로 받아옴 -->

<!--  -	<tr>
				<td>${board.board_no }<td><a href="#">${board.board_no}</a></td>
				<td>${board.member_name}</td>
			<td>${board.board_sub}</td>
			<td>${board.board_date}</td>
			<td><a href="freeBoardDelete.do?board_no=${board.board_no}">삭제</a></td>
			<!-- ?뒤가 파라미터 -->
<!--  			</tr>
			</c:forEach>
			<tr>
				<td colspan="5"><a href="freeBoardWrite.do">글작성</a></td>
			</tr>	
	</table> -->
<%-- <div id="msg">
<<form id="frm" action="${pageContext.request.contextPath}/freeBoardUpdate.do" align="center">
</form>
</div>--%>
</div>
</body>

</html>