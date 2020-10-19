<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<style>
.site-btn {
	font-family: 'Noto Sans KR';
	font-size: 15px;
	margin-bottom: 20px;
	padding-left: 30px;
}

td {
	font-size: 18px;
	font-family: 'Noto Sans KR';
	font color: "#000000";
}

</style>

</head>
<body>
 <%@include file="/common/song.jsp" %>
 <div class="container">
	<br><br>
	<div class="container">
	<table class="table table-striped" >
		<thead>
		
		</thead>
		<tbody>
		<c:forEach items="${list}" var="eventboard">
	
		<tr>
			<td>${eventboard.board_no}</td>
				<c:if test="${!empty eventboard.board_file}">
					<td>
					<a href="eventView.do?board_no=${eventboard.board_no}">
					<img src="/teamProject3/images/${ eventboard.member_name }" width="700" height="200">
					</a>
					</td>
				</c:if>
				
			<td><a href="eventView.do?board_no=${eventboard.board_no}">${eventboard.board_sub}</a></td>
			<!-- 제목 누르면 view페이지로 넘어감 --> 
		
			<%-- <td>${eventboard.board_date}</td> --%>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<hr/>
	<c:if test="${sessionScope.id == 'vegan'}">
	<a class = "btn site-btn" href ="/teamProject3/event/eventInsert.jsp" style="float: right;">등록</a>
	</c:if>
	<my:paging paging="${paging}" jsfunc="gopage" />
	</div>
<script>
   function gopage(p) {         // 검색
      searchFrm.p.value = p;    // 페이지번호 받아와서 submit에 넘김
      searchFrm.submit();
      // location.href="deptSelectAll?p=" + p;  
      // 이동되는 주소가 달라서 여러사람이 쓰기위해서는 매개값 p로 해줌
   }
   console.log("${sessionScope.id}");
   console.log("${sessionScope.login}");
</script>
</div>
&nbsp;&nbsp;
</body>
</html>