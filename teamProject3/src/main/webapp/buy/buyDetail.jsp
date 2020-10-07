<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/Temp/buy/addressApi.js"></script>
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
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
</style>
<script>
$(function() {
	 $('#newbtn').on("click", function() {
			var valuecheck = $('#newbtn:checked').val();
			$('#sample4_postcode').val("");
			$('#sample4_roadAddress').val("");
			$('#sample4_jibunAddress').val("");
			$('#sample4_detailAddress').val("");
			$('#sample4_extraAddress').val("");
	 });
	$('#mileage_input').val($('#all_price_put').html() * 0.01);
	 
	$('#payment_button').on("click", function() {
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp40069131'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : $('#all_price_put').html(),
		    buyer_email : '${member_email}',
		    buyer_name : '${member_name}',
		    buyer_tel : '${member_tel}',
		    buyer_addr : '${member_address}'
		    //m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}),
		
		function(rsp) {
			//넘겨주는값
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
	    }
	});
});
</script>
<script>
	function mileageUse() {
		if(parseInt($(''))
		
	}

</script>
</head>
<body>
	<div class="container">
		<div>
			<h2 class="order_detail_title">주문/결제 페이지</h2>
		</div>
		<hr width=70%>
	<form id="frm" action="${pageContext.request.contextPath}/orderDetailController.do">
		<div class="lay">
			<h3 class="order_detail_producttitle">상품 정보</h3>
		</div>

		<table border='1' class="order_detail_buytable">
		<colgroup>
		<col style="width:auto;">
		<col style="width:175px;">
		<col style="width:102px;">
		<col style="width:102px;">
		</colgroup>
		<thead class="">
		<tr>
		<th scope="col">상품 정보</th>
		<th scope="col">가격</th>
		<th scope="col">수량</th>
		<th scope="col">결제금액</th>
		</tr>
		</thead>
		<tbody>
		<c:set var="all_price" value="0"/>
		<c:forEach items="${array}" var="orderlist">
		<tr>
		<td>${orderlist.product_name}</td>
		<td>${orderlist.product_price}</td>
		<td>${orderlist.order_detail_no}</td>
		<td>${orderlist.order_total}</td>
		</tr>
		<c:set var="all_price" value="${all_price + orderlist.order_total}"/>
		</c:forEach>
		</tbody>
		</table>
		<!-- 최종결제금액 수정 요망 -->
		<div class="payment">
		<strong>최종결제금액 : </strong>
		<h2 id="all_price_put">${all_price}</h2>
		</div>
		</form>
		
			
		<hr width=30%>
		<form action="">
		<div>
			<h3 class="order_detail_buytitle">주문자 정보</h3>
		</div>

		<div class="order_detail_buyimformation">
			<span>이 름 : </span><input type="text" disabled /><br> <span>휴대폰
				: </span><input type="text" disabled /><br> <span>이메일 : </span><input
				type="text" disabled />
		</div>
		<hr width=30%>
			<h3 class="order_detail_locationtitle">배송지 정보</h3>
			<div class="location_radio">
		<input type="radio" id="oldbtn" name="radio1" value="old" checked>원래 주소
		<input type="radio" id="newbtn" name="radio1" value="new" onclick="click()">새 배송지
		<br>
		</div>
			
		<div class="location_input">
			<label>주소</label><br> <input type="text" name="member_postcode"
				id="sample4_postcode" placeholder="우편번호"  > <input
				type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" name="member_roadAddress" id="sample4_roadAddress"
				placeholder="도로명주소"  > <input type="text"
				name="member_jibunAddress" id="sample4_jibunAddress"
				placeholder="지번주소"  > <span id="guide"
				style="color: #999; display: none"></span> <input type="text"
				name="member_detailAddress" id="sample4_detailAddress"
				placeholder="상세주소" > <input type="text"
				name="member_extraAddress" id="sample4_extraAddress"
				placeholder="참고항목" >
		</div>
		
		<div class="location_memo">
			배송 메모 : <input type="text" placeholder="욕하지마라">
		</div>		
		<hr width=30%>

		<h3>적립금</h3>
		<div class="miliege-imformation">
			보유 마일리지 :
			<!-- 넣기 -->
			P <br> <br> 적립 예상 마일리지 :
		<input type="text" id="mileage_input" disabled> P
		</div> 
		<hr width=30%>

		<div class="final_pay_imforamtion">
			<h3>최종 결제 정보</h3>
		</div>
		</form>
		

		<button type="button" id="payment_button">결제하기</button>
	</div>
</body>
</html>