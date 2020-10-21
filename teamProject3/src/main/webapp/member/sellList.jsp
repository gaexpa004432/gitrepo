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

<title>sellList.jsp</title>
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
		td button {
			margin : 5%;
		}
</style>
<script>
$(function(){
	
	//sellList(); 아작스를 써서 DataTable이 써지지 않음. 그래서 아작스로 list를 불러 오는 것이 아니라 forEach로 list를 가져옴
	
   $("#task-table").DataTable({
		columnDefs: [
			{ targets: 1 , render: $.fn.dataTable.render.number( ',' , '.' , 0 , '' , '원' ) }]
	});
	
	
	//목록조회
	/*function sellList(){
		$.ajax("../ajaxSellList.do" , {
			dataType : "json",
			type : "post",
			success : function(datas) { //ajaxSellList.do 에서 받아온 전체결과가 변수 datas에 들어 온다, 변수는 아무거나 상관 없음
				var a ="";
				for(var i=0; i<datas.length; i++) {
				if (datas[i].order_status=='ow') {
					a = "<button class='btnAccept' value='oa'>승인</button><button class='btnReject' value='or'>거절</button>";
				} else if (datas[i].order_status =='oa') {
					a = "승인"
				} else if (datas[i].order_status =='or') {
					a = "거절"
				}
					
				$("<tr>").data("order_number", datas[i].order_number)
						 .append($("<td>").html(datas[i].order_number))
						 .append($("<td>").html(datas[i].order_total))
						 .append($("<td>").html(datas[i].member_id))
						 .append($("<td>").html(datas[i].order_date))
						 .append($("<td>").html(a))
						 .append($("<td>").html(datas[i].order_status))
						 .append($("<td>").html(datas[i].order_reason))
						 .appendTo($("#task-tbody"));			
				}
			}
		})
	}*/
	
	
	$("#task-table").on("click", ".btnReject", function() {
		$(this).parent().append($("<input>").attr("name","order_reason").attr("id","order_reason"))
						.append($("<button>").attr("class","btnSub")
											 .on("click", function() {
																	 	var order_number = $(this).parent().parent().data("order_number");//tr태그가 가지고 있는 data의 order_number의 값
																	 	var order_reason = $(this).prev();//td>input를 의미, this는 버튼이고 버튼의 이전 태그는 input임 
																	 	//order_status = $(this).val();
																		console.log(order_number)
																		console.log(order_reason.val())
																		//console.log(order_status)
																		var confirmMsg = confirm('거절 하시겠습니까?');
																		alert(confirmMsg);
																		var aa=$(this);//td>#btnSub의 버튼을 의미함
																		if(confirmMsg == true) {
																			$.ajax ("/teamProject3/ajaxSellRequest.do", { //절대경로로 줘야지 ajax가 실행됨(forEach로 실행시에)
																				method : "post",
																				dataType : "json",
																				data : {
																						order_number : order_number,
																						order_reason : order_reason.val()
																						//order_status : order_status,
																						},
																				success : function(data) {
																					aa.parent().next().html(data.order_reason);
																					console.log(aa.parent().next().html())
																					console.log(order_reason.parent())
																					order_reason.parent().html("거절")//위에서 선언한 order_reason은 td>input태그를 의미함
																					aa.remove();
																				}
																			});
																		}	
																	}).html("확인"));
		$(this).prev($(".btnAccept")).remove();
		$(this).remove();
	});
	
	$("#task-table").on("click", ".btnAccept", function() {
		var order_number = $(this).parent().parent().data("order_number");
		var td = $(this).parent();
		console.log(order_number);
		console.log(td);
		$.ajax ("/teamProject3/ajaxSellRequest.do", {
			method : "post",
			dataType : "json",
			data : {order_number : order_number},
			success : function(data) {
				td.html("승인");
			}
		});
		$(this).next($(".btnReject")).remove();
		$(this).remove();
	})
	
	$("#task-table").on("dblclick",".select_order", function(){
		location.href = "/teamProject3/sellSelect.do?order_number=" + $(this).data("order_number");
		console.log($(this).data("order_number"));
	});
	
});
</script>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="/teamProject3/img/KakaoTalk_20201015_173926849.jpg" style="background-image:url('/teamProject3/img/sd.jpg')"> <!-- ì¬ê¸°ìë ì´ë¯¸ì§ ê²½ë¡ë¥¼ ë°ê¾¸ìë©´ ë©ëë¤. -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>판매내역</h2>
                        <div class="breadcrumb__option">
                            <a href="/teamProject3/member/myPageMain.jsp">마이페이지</a>
                            <span >판매내역</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<%-- <section class="checkout spad">
	<%@include file="/member/myPageMenu.jsp" %>
	<div class="col-lg-8 col-md-7"> --%> 
		<div class="container">
		    <h1>판매내역</h1>
		    	<div class="row">
					<div class="col-md-12">
						<div class="panel panel-success">
							<table class="table table-hover" id="task-table">
								<thead>
									<tr>
										<th>주문번호</th>
										<th>레시피</th>
										<th>가격</th>
										<th>주문하신분</th>
										<th>날짜</th>
										<th>승인여부</th>
										<th>거절사유</th>
									</tr>
								</thead>
								<tbody id="task-tbody">
								<c:forEach items="${list}" var="list">
							<tr class="select_order" data-order_number="${list.order_number}"><!-- data에 이름 주고 값을 넣으려면 왼쪽과 같이 하면 된다. -->
								<td>${list.order_number}</td>
								<td>${list.recipe_name}</td>
								<td>${list.order_total}</td>
								<td>${list.member_id}</td>
								<td>${list.order_date}</td>
								<c:choose>
									<c:when test="${list.order_status == 'ow'}">
										<td><button class='btnAccept' value='oa'>승인</button><button class='btnReject' value='or'>거절</button></td>
									</c:when>
									<c:when test="${list.order_status == 'oa'}">
										<td>승인</td>
									</c:when>
									<c:when test="${list.order_status == 'or'}">
										<td>거절</td>
									</c:when>																
								</c:choose>
								<td>${list.order_reason}</td>
							</tr>
						</c:forEach> 
							</tbody>
						</table> 
					</div>
				</div>
			</div>
		</div>
<!-- 	</div>
</section> -->			
</body>
</html>