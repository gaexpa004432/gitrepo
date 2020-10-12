<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
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
	    	columnDefs: [{ targets: 1 , render: $.fn.dataTable.render.number( ',' , '.' , 0 , '' , '원' ) }]
	    });
	} );
	
})
</script>
</head>
<body>
	<div class="container">
		<table id="tb" class="table table-striped table-bordered">
			<thead><tr><th>상품 이름</th><th>가격</th><th>단위</th><th>승인 여부</th><th>판매자 번호</th><th>레시피 번호</th><th>판매여부</th></tr></thead>
			<tbody>
	<c:forEach items="${ list }" var="recipe">
		<tr>
		<td>${recipe.product_name }</td>
		<td>${recipe.product_price }</td>
		<td>${recipe.product_unit }</td>
		<td>${recipe.product_status }</td>
		<td>${recipe.seller_code }</td>
		<td>${recipe.recipe_number }</td>
		<td>${recipe.product_code }</td>
		</tr>
	</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>