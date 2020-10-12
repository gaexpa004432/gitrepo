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
	
		var chk = 0;
	$(".updatetr").dblclick(function(){
		var tis = $(this);
		if(chk == 0){
			chk++;
		var name = $(this).children().eq(0).data("name");
		$(this).children().eq(0).text("");
		$(this).children().eq(0).append($("<input>").css("width","70px").css("height","15px").val(name));
		var price = $(this).children().eq(1).data("price");
		$(this).children().eq(1).text("");
		$(this).children().eq(1).append($("<input>").css("width","70px").css("height","15px").val(price));
		var unit = $(this).children().eq(2).data("unit");
		$(this).children().eq(2).text("");
		$(this).children().eq(2).append($("<input>").css("width","70px").css("height","15px").val(unit));
		
		$(this).children().eq(7).hide();
		$(this).append($("<td>").append($("<button>").text("수정").attr("class","btn btn-primary")
				.on("click",function(){
					var update = $(this);
		var upname =	tis.children().eq(0).children().val();
		var upprice =	tis.children().eq(1).children().val();
		var upunit	=	tis.children().eq(2).children().val();
		var upnumber = tis.data("number");
					$.ajax({
						 url: "/ajaxRecipeupdate", 
						    data: {product_number:upnumber,product_name:upname,product_price:upprice,product_unit:upunit},
						    method : "POST",
					    success: function() { 
					    	update.parent().remove();
					    	tis.children().eq(7).show();
							tis.children().eq(0).text(upname);
							tis.children().eq(1).text(upprice);
							tis.children().eq(2).text(upunit);
							chk = 0;
					    },
					    error:function(xhr, status, message) { 
					        alert(" status: "+status+" er:"+message);
					    }
					   
				})
				}
				)).append(" ").append($("<button>").text("취소").attr("class","btn btn-danger")
		.on("click",function(){
			$(this).parent().remove()
			tis.children().eq(7).show();
			tis.children().eq(0).text(name);
			tis.children().eq(1).text(price);
			tis.children().eq(2).text(unit);
			chk = 0;
		})		
		))
		
		
		}
	})
	
	$(".btn-success").on("click",function(){
		var result = confirm("승인하시겠습니까?");
		var tis = $(this);
		if(result){
			var accnumber = $(this).parent().parent().data("number");
			console.log(accnumber);
			$.ajax({
				 url: "/ajaxRecipeAccept", 
				    data: {product_number:accnumber},
				    method : "POST",
			    success: function() { 
			    	alert("승인되었습니다")
			    	tis.parent().parent().remove();
					
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    }
			   
		})
		}
	})
	
	$(".btn-danger").on("click",function(){
		var result = confirm("삭제하시겠습니까 관련 레시피와 함께 삭제 됩니다.");
		var tis = $(this);
		if(result){
			var accnumber = $(this).parent().parent().data("recipe");
			console.log(accnumber);
			$.ajax({
				 url: "/ajaxRecipeDelete", 
				    data: {recipe_number:accnumber},
				    method : "POST",
			    success: function() { 
			    	alert("삭제 되었습니다.")
			    	tis.parent().parent().remove();
					
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    }
			   
		})
		}
	})
})
</script>
</head>
<body>
	<div class="container">
		<table id="tb" class="table table-striped table-bordered">
			<thead><tr><th>상품 이름</th><th>가격</th><th>단위</th><th>승인 여부</th><th>판매자 번호</th><th>레시피 번호</th><th>판매여부</th><th></th></tr></thead>
			<tbody>
	<c:forEach items="${ list }" var="recipe">
		<tr class="updatetr" data-number="${recipe.product_number }" data-recipe="${recipe.recipe_number }">
		<td class="val" data-name="${recipe.product_name }">${recipe.product_name }</td>
		<td class="val" data-price="${recipe.product_price }">${recipe.product_price }</td>
		<td class="val" data-unit="${recipe.product_unit }">${recipe.product_unit }</td>
		<td class="val">${recipe.product_status }</td>
		<td class="val">${recipe.seller_code }</td>
		<td class="val">${recipe.recipe_number }</td>
		<td class="val">${recipe.product_code }</td>
		<td align="center"><button class="btn btn-success">승인</button>&nbsp&nbsp<button class="btn btn-danger">삭제</button></td>
		</tr>
	</c:forEach>
			</tbody>
		</table>
		
	</div>
	 
</body>
</html>