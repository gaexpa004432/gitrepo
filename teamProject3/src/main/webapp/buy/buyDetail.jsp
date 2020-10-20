<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/api/addressApi.js"></script>
  <!-- jQuery -->
  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
<style>
h3 {
	font-size: 23px;
	padding-left: 15%;
}

.steps {
	float: right;
	font-color: #bbb;
	font-weight: bold;
}

.container {
	display : block;
}

.order_detail_buyimformation {
	display : inline-block;
	padding-left : 15%;
}

.location_input {
	padding-left : 15%;
}

.location_memo {
	padding-left : 15%;
}

.miliege-imformation {
	padding-left : 68%;
}

.location_radio {
	padding-left : 15%;
}

.order_detail_buytable {
	border : 1px solid gray;
	text-align : center;
	margin : auto;
	border-collapse: collapse;
    font-size: 0.9em;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.order_detail_buytable thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: center;
}

.order_detail_buytable th,
.order_detail_buytable td {
    padding: 12px 15px;
}

.order_detail_buytable tbody tr {
    border-bottom: 1px solid #dddddd;
}

.order_detail_buytable tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.order_detail_buytable tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}

.order_detail_buytable tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}

.payment {
	display : inline-block;
	padding-left : 68%;
}

.payment_button {
	margin : auto;
}

#mileage_input {
	text-align : right;
}

h3 {
	color : green;
	font-weight : bold;
	font-size : 32px; 
	text-shadow : 3px 3px 3px gray;

}

.order_detail_buyimformation {
	display : inline-block;
}

input {
	outline:none;
	border: solid 1px #adadad;
	transition: all 2s ease-in-out;
	border-radius: 8px;
    text-align : center;
    width : auto;
		
}

.shoping__checkout {
	padding-right : 20%;
}

.miliege-imformation {
	display : block;
}

.lay {
	margin-left : auto;
	margin-right : auto;
}


</style>
<script>
$(function() {
	
	sum();
	 $('#newbtn').on("click", function() {
			var valuecheck = $('#newbtn:checked').val();
			$('#sample4_postcode').val("");
			$('#sample4_roadAddress').val("");
			$('#sample4_detailAddress').val("");
			$('#sample4_extraAddress').val("");
	 });
	 
	 $('#oldbtn').on("click", function() {
			var valuecheck = $('#oldbtn:checked').val();
			$('#sample4_postcode').val("${vo.member_postcode}");
			$('#sample4_roadAddress').val("${vo.member_roadAddress}");
			$('#sample4_detailAddress').val("${vo.member_detailAddress}");
			$('#sample4_extraAddress').val("${vo.member_extraAddress}");
	 });
	 
	
	 
	//마일리지 구하기
	$('.mileage_input').val($('#all_price_put').html() * 0.01);
	var allprice = $('#all_price_put').text();
	var mileage = $('.mileage_have').val()
	$(".all_price_last").text(allprice);
	$('.final').text(parseInt(allprice - mileage))
	m_sum();
	
	//삭제
	$('.cart_delete').on("click", function(){
		$(this).closest('tr').remove();
	});
	
	//전액사용
	$('#mileage_all_button').on("click", function() {
		$('.mileage_use').val($('.mileage_have').val());
		m_sum();
	});
	
	/*$('#payment_button').on("click", function() {
	});*/
	
	$('.mileage_use').on("change", m_sum);
	
	
	$('#payment_button').on("click", function() {
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp40069131'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 100,
		    buyer_email : '${member_email}',
		    buyer_name : '${member_name}',
		    buyer_tel : '${member_tel}',
		    buyer_addr : '${member_address}'
		    //m_redirect_url : 'http://localhost/teamProject3/orderDetailController.do
		},
		function(rsp) {
			console.log(rsp);
			//넘겨주는값
			alert(rsp.success);
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        alert(msg);
				location.href='${pageContext.request.contextPath}/orderOutput.do';
				frm.submit();
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
 	})
	})
});

	function sum() {
		var total =	$('.total');
		var sum_all = 0;
		for (var i=0; i<total.length; i++) {
			var tr = $(total[i]).closest('tr')
			sum_all += parseInt(tr.find('.total').text());
		}
		$('#all_price_put').text(sum_all);		
	} 
	
	function m_sum() {
		var mileage = $('.mileage_use');
		var m_all = 0;
		$('.all_mileage').text(mileage.val());
		
		updateSum();
	}
	
	function updateSum(){
		var all_price_last = parseInt($('.all_price_last').text());
		var all_mileage = parseInt($('.all_mileage').text());
 		var fi = all_price_last - all_mileage;  
 		$('.final').text(fi);
 		$('.final-p').val(fi);
	}
	
</script>
</head>
<body>
 <section class="breadcrumb-section set-bg" data-setbg="./img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>구매/결제</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>

		<div class="lay">
			<h3 class="order_detail_producttitle">상품 정보</h3>
	<form action="${pageContext.request.contextPath}/orderOutputInsert.do" id="frm" name="frm" method="post">
		<table border='1' class="order_detail_buytable">
		<colgroup>
		<col style="width:auto;">
		<col style="width:auto;">
		<col style="width:175px;">
		<col style="width:102px;">
		<col style="width:102px;">
		<col style="width:auto;">
		</colgroup>
		<thead class="">
		<tr>
		<th scope="col">상품</th>
		<th scope="col">상품명</th>
		<th scope="col">재료명</th>
		<th scope="col">가격</th>
		<th scope="col">수량</th>
		<th scope="col">결제금액</th>
		</tr>
		</thead>
		<tbody>
		<c:set var="all_price" value="0"/>
		<c:forEach items="${array}" var="orderlist">
		<tr class="active-row">
		<td><input type="hidden" name="product_number" value="${orderlist.product_number}">${orderlist.main_img}</td>
		<td>${orderlist.recipe_name}</td>
		<td><input type="hidden" name="product_name" value="${orderlist.product_name}">${orderlist.product_name}</td>
		<td><input type="hidden" name="product_price" value="${orderlist.product_price}">${orderlist.product_price}</td>
		<td>
			<input type="hidden" name="product_quantity" value="${orderlist.product_quantity}">${orderlist.product_quantity}
		</td>
		<td class="total">
			<c:set var="pay_total" value="0"/>
			<c:set var="pay_total" value="${pay_total + (orderlist.product_price * orderlist.product_quantity)}" />
			${pay_total}
		</td>
		</tr>
		<c:set var="all_price" value="${all_price + orderlist.order_total}"/>
		</c:forEach>
		</tbody>
		</table>
		<input type="hidden" name="recipe_number" value="${list.recipe_number}">
		<input type="hidden" name="seller_code" value="${resultVO.seller_code}">
		<input type="hidden" name="member_id" value="${vo.member_id}">
		<div class="payment">
		<strong>최종결제금액 : </strong>
		<input type="hidden" value="${all_price}">
		<h2 id="all_price_put" data-allprice="${all_price}">
		</h2>
		</div>

		<hr width=30%>

		<div>
			<h3 class="order_detail_buytitle">주문자 정보</h3>
		</div>

		<div class="order_detail_buyimformation">
			<span>이 름 : </span><input type="text" id="name" name="member_name" value="${vo.member_name}"/><span>휴대폰
				: </span><input type="text" id="tel" name="member_tel" value="${vo.member_tel}"/> <span>이메일 : </span><input
				type="text" name="member_email" id="emial" value="${vo.member_email}" />
		</div>
		<hr width=30%>
			<h3 class="order_detail_locationtitle">배송지 정보</h3>
			<div class="location_radio">
		<input type="radio" id="oldbtn" name="radio1" value="old" onclick="click()" checked>원래 주소
		<input type="radio" id="newbtn" name="radio1" value="new" onclick="click()">새 배송지
		<br>
		</div>
			
		<div class="location_input">
			<label>주소</label><br> <input type="text" name="member_postcode"
				id="sample4_postcode" placeholder="우편번호" value="${vo.member_postcode}"> <input
				type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" name="member_roadAddress" id="sample4_roadAddress"
				placeholder="도로명주소" value="${vo.member_roadAddress}" 
				size=50 maxlength=100> <input type="hidden"
				name="member_jibunAddress" id="sample4_jibunAddress"
				placeholder="지번주소" > <span id="guide"
				style="color: #999; display: none"></span> <input type="text"
				name="member_detailAddress" id="sample4_detailAddress"
				placeholder="상세주소" value="${vo.member_detailAddress}" > <input type="text"
				name="member_extraAddress" id="sample4_extraAddress"
				placeholder="참고항목" value="${vo.member_extraAddress}">
		</div>
		
		<hr width=30%>
		<h3>적립금</h3> 
		<div class="miliege-imformation">
		<c:set  var="my_mileage" value="0" />
			보유 마일리지 :
			<input type="text" value="${mil.remaining}" class="mileage_have" readonly>
			<input type="button" class="btn btn-outline-success btn-lg" id="mileage_all_button" value="전액사용" onclick="click()"> <br> <br> 적립 마일리지 :
		<input type="text" class="mileage_input" name="mileage_cost" readonly><br>
		<c:set var="my_mileage" value="${mil.remaining}"/>
		사용 마일리지: <input type="text" name="mileage_use" class="mileage_use">
		</div> 
		<hr width=30%>
		
		 <div class="col-lg-3">
                    <div class="shoping__checkout">
                    <c:set var="fianl_order_price" value="0"/>
                       <h5>Cart Total</h5>
                       <hr>
                        <ul>
                       		<li> 상품 총 금액:<span class="all_price_last">${all_price}</span> </li>
                            <li>사용 마일리지:<span class="all_mileage"></span></li>
                            <c:set var="final_order_price" value="${all_price - my_mileage}"/>
                            <li>구매 총 금액: <span class="final"></span><input type="hidden" class="final-p" name="order_total"></li>
                        </ul>
						<button type="button" class="btn btn-danger btn-block" id="payment_button">결제하기</button>
                    </div>
               	</div>
		</form>
		</div>
	
</body>
</html>