<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<!-- 데이터테이블 -->
<link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script src="//cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>

<title>sellTest.jsp</title>
<style>
    	.row{
		    margin-top:40px;
		    padding: 0 10px;
		}
		.clickable{
		    cursor: pointer;   
		}

		.panel-heading div {
			margin-top: -18px;
			font-size: 15px;
		}
		.panel-heading div span{
			margin-left:5px;
		}
		.panel-body{
			display: none;
		}
</style>
<script>
$(function(){
	$(document).ready( function () {
	    $('#task-table').DataTable({
			columnDefs: [
				{ targets: 1 , render: $.fn.dataTable.render.number( ',' , '.' , 0 , '' , '원' ) }]
		});
	} );
	
	var order_number = $("#btnAccept").parent().parent().eq(0).find("td").eq(0).html()
	$("#btnAccept").on("click", function() {
		
		$.ajax({
			url:"/teamProject3/ajaxSellRequest.do",
			data:{}
		})
	})
	
});
/* (function(){
    'use strict';
	var $ = jQuery;
	$.fn.extend({
		filterTable: function(){
			return this.each(function(){
				$(this).on('keyup', function(e){
					$('.filterTable_no_results').remove();
					var $this = $(this), 
                        search = $this.val().toLowerCase(), 
                        target = $this.attr('data-filters'), 
                        $target = $(target), 
                        $rows = $target.find('tbody tr');
                        
					if(search == '') {
						$rows.show(); 
					} else {
						$rows.each(function(){
							var $this = $(this);
							$this.text().toLowerCase().indexOf(search) === -1 ? $this.hide() : $this.show();
						})
						if($target.find('tbody tr:visible').size() === 0) {
							var col_count = $target.find('tr').first().find('td').size();
							var no_results = $('<tr class="filterTable_no_results"><td colspan="'+col_count+'">No results found</td></tr>')
							$target.find('tbody').append(no_results);
						}
					}
				});
			});
		}
	});
	$('[data-action="filter"]').filterTable();
})(jQuery);

$(function(){
    // attach table filter plugin to inputs
	$('[data-action="filter"]').filterTable();
	
	$('.container').on('click', '.panel-heading span.filter', function(e){
		var $this = $(this), 
			$panel = $this.parents('.panel');
		
		$panel.find('.panel-body').slideToggle();
		if($this.css('display') != 'none') {
			$panel.find('.panel-body input').focus();
		}
	});
	$('[data-toggle="tooltip"]').tooltip();
	
}); */
</script>
</head>
<body>
<div class="container">
    <h1>판매내역</h1>
    	<div class="row">
			<div class="col-md-12">
				<div class="panel panel-success">
					<!-- <div class="panel-heading">
						<h3 class="panel-title">검색</h3>
						<div class="pull-right">
							<span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
								<i class="glyphicon glyphicon-filter"></i>
							</span>
						</div>
					</div> 
					<div class="panel-body">
						<input type="text" class="form-control" id="task-table-filter" data-action="filter" data-filters="#task-table" placeholder="Filter Tasks" />
					</div> -->
					<table class="table table-hover" id="task-table">
						<thead>
							<tr>
								<th>주문번호</th>
								<th>가격</th>
								<th>주문하신분</th>
								<th>날짜</th>
								<th>승인여부</th>
								<th>상태</th>
								<th>거절사유</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.order_number}</td>
								<td>${list.order_total}</td>
								<td>${list.member_id}</td>
								<td>${list.order_date}</td>
								<c:choose>
									<c:when test="${list.order_status == 'ow'}">
										<td><button id="btnAccept">승인</button><button id="btnReject">거절</button></td>
									</c:when>
									<c:when test="${list.order_status == 'oa'}">
										<td>승인됨</td>
									</c:when>
									<c:when test="${list.order_status == 'or'}">
										<td>거절됨</td>
									</c:when>																
								</c:choose>
								<td>${list.order_status}</td>
								<td>${list.order_reason}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>