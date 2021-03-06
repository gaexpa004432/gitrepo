<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<!-- 데이터테이블 -->
<link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script src="//cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<meta charset="UTF-8">
<title>sellOrderSelect.jsp</title>
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
   $("#task-table").DataTable({
		
		// 검색 기능 숨기기
		searching: false,
		
		
		columnDefs: [
			{ targets: 1 , render: $.fn.dataTable.render.number( ',' , '.' , 0 , '' , '원' ) }]
	});
	
   
})
</script>	
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="/teamProject3/img/KakaoTalk_20201015_173926849.jpg" style="background-image:url('/teamProject3/img/sd.jpg')"> <!-- ì¬ê¸°ìë ì´ë¯¸ì§ ê²½ë¡ë¥¼ ë°ê¾¸ìë©´ ë©ëë¤. -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2 >판매 상세 내역</h2>
                        <div class="breadcrumb__option">
                            <a href="/teamProject3/member/myPageMain.jsp">마이페이지</a>
                            <span >판매내역</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
	<div class="container">
    <h1>주문  ${orderOne.order_number}의 ${orderOne.recipe_name} 레시피</h1>
    	<div class="row">
			<div class="col-md-12">
				<div class="panel panel-success">
					<h3>${orderOne.member_id}님의 주문입니다.</h3>
					<h4>배송지 : ${orderOne.member_roadAddress} ${orderOne.member_detailAddress} ${orderOne.member_extraAddress} , 우편번호 : ${orderOne.member_postcode }</h4>
					<table class="table table-hover" id="task-table">
						<thead>
							<tr>
								<th>재료</th>
								<th>가격</th>
								<th>수량</th>
								<th>단위</th>
							</tr>
						</thead>
						<tbody id="task-tbody">
						<c:forEach items="${list}" var="list">
							<tr><!-- data에 이름 주고 값을 넣으려면 왼쪽과 같이 하면 된다. -->
								<td>${list.product_name}</td>
								<td>${list.product_price}</td>
								<td>${list.product_quantity}</td>
								<td>${list.product_unit}</td>
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