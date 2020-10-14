<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<style>
th {
width:50px;
}
</style>
<head>
<link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
	<script
	src="//cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.col-sm-6 {
		text-align : left !important;
		float : left;
	}
</style>
<script type="text/javascript">
$(function(){
	$(document).ready( function () {
	    $('#tb').DataTable({
	    	info: false,
	    	"dom": 'lrt<"col-sm-5"p><"col-sm-6"f>',
	    	
	    });
	} );
	$(".qaboard").on("click",function(){
		location.href="/teamProject3/qaBoardView.do?board_no="+$(this).data("board");
	})
	
})
</script>
</head>
<body>
	<div class="container">
		<table id="tb" class="table table-striped table-bordered">
			<thead><tr><th>사진</th><th>글제목</th><th>글내용</th><th>날짜</th><th>작성자 ID</th></thead>
			<tbody>
	<c:forEach items="${ list }" var="board">
		<tr class="qaboard" data-board="${board.board_no }">
		<c:if test="${!empty board.member_name }">
		<td>${board.member_name }</td>
		</c:if>
		<c:if test="${empty board.member_name }">
		<td>답변 대기중</td>
		</c:if>
		<td>${board.board_sub }</td>
		<td>${board.board_content }</td>
		<td>${board.board_date }</td>
		<td>${board.member_id }</td>
		</tr>
	</c:forEach>
			</tbody>
		</table>
	</div>
	
</body>
</html>