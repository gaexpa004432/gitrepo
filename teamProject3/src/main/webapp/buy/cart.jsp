<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

h3 {
	text-align: center;
}

.cartTable .head th {
	background: #fafafa;
	text-align: center;
}

.cartTable {
	width: 898px;
	border-top: 0;
	border-collapse: collapse;
	border-spacing: 0;
}

thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
    align : center;
}

span {
	margin: 0;
    padding: 0;
    color: #111;
}

.price-bundle-total {
	position: relative;
    padding: 20px 35px 16px 0;
    background: #f7f7f7;
    font-size: 12px;
    line-height: 29px;
    text-align: right;
}

.cart-total-price {
	clear: both;
    border: 4px solid #191970;
    text-align: center;
}

h2 {
	display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

.final-order-price {
	color: #ea0000;
    font-size: 20px;
}

.cart-total-price-inner {
	display : inline-block;
}

</style>
<script>
	$(function() {	
		//전체선택 function
		$('.all-select-cart').click(function(){ 
			if($('.all-select-cart').prop("checked")) {
				$("input[type=checkbox]").prop("checked",true);	
			} else {
				$("input[type=checkbox]").prop("checked",false);	
			}
			sum();
		})
		
		//수량변경시 상품 당 총 가격 변경
		$('.quantity-select').on("change", function() {
			//	console.log($('#quantity-select').children("option:selected").val());
			var tr = $(event.target).closest('tr')
			var cart = parseInt(tr.find('.cart_price').text()) * tr.find('.quantity-select').val()
			tr.find('.all-product-price').html(cart);	
			sum();
		})
			
		$('.cart-check').on("change", sum); 
		
		$('.cart-check').on("change", m_sum);
		
		//수량 변경시 적립마일리지 변경
		$('.quantity-select').on("change", function() {
			var tr = $(event.target).closest('tr')
			var mileage = parseInt(tr.find('.all-product-price').text() * 0.01)
			tr.find('.mileage-price').html(mileage);
			m_sum();
		})
	});
	
	//상품들의 총 가격 계산 function
	function sum() {
		var check =	$('.cart-check:checked');
		var cart_all = 0;
		for (var i=0; i<check.length; i++) {
			var tr = $(check[i]).closest('tr')
			cart_all += parseInt(tr.find('.all-product-price').text());
		}
		$('.final-order-price').text(cart_all);
	}
	
	//상품모두의 적립마일리지 계산 function
	function m_sum() {
		var m_all = 0;
		var mileage = $('.mileage-price');
		for (var i=0; i<mileage.length; i++) {
			var tr = $(mileage).closest('tr')
			var milSum = parseInt(tr.find('.mileage-price').eq(i).text());
			console.log(milSum);
			m_all = m_all + milSum;
			
		}
		$('.all-mileage').text(m_all);
	}
	
</script>
</head>
<body>
	<h3>장바구니</h3>
	<hr width=70%>
	<table class="cartTable">
		<colgroup>
			<col width="*">
			<col width="*">
			<col width="*">
			<col width="*">
			<col width="*">
			<col width="*">
			<col width="*">
		</colgroup>

		<thead>
			<tr class="head">
				<th scope="col" class="all-select-evnet"><label> <input
						type="checkbox" class="all-select-cart" checked> 
						<span> &nbsp; 전체선택</span>
				</label></th>

				<th scope="col" class="th-product-box" colspan="2">상품정보</th>
				<th scope="col" class="th-price-box">단가</th>
				<th scope="col" class="th-amount-box">수량</th>
				<th scope="col" class="th-product-total-box">상품금액</th>
				<th scope="col" class="th-mileage-box">예상 적립금</th>
			</tr>
		</thead>
		
	<tbody class="cartTable-body">
	<c:set var="gum" value="0" />
	<c:forEach items="${list}" var="cart">
		<tr class="cart-deal-items">
			<td class="select-event">
				<input type="checkbox" class="cart-check" checked> 
			</td>
			<td><!-- img --></td>
			<td>${cart.product_name}</td>
			<td class="cart_price" >${cart.product_price}</td>
			<td>
			<select class="quantity-select">
			<option <c:if test="${cart.order_detail_no == 1}">selected </c:if>>1</option>
			<option <c:if test="${cart.order_detail_no == 2}">selected </c:if>>2</option>
			<option <c:if test="${cart.order_detail_no == 3}">selected </c:if>>3</option>
			<option <c:if test="${cart.order_detail_no == 4}">selected </c:if>>4</option>
			</select></td>
			<td class="all-product-price">${cart.product_price * cart.order_detail_no}</td>
			<td class="mileage-price">${(cart.product_price * cart.order_detail_no) * 0.01}</td>
			<td><button type="button" id="cart-delete">삭제</button></td>
		</tr>
		<c:set var="gum" value="${cart.product_price* cart.order_detail_no}"/>
		<c:set var="total" value="${total+gum}"/>
	</c:forEach>
	</tbody>
	</table>
	<div class="cart-total-price">
		<div class="cart-total-price-inner">
			<div class="price-area">
				<span>총 상품가격: </span>
				<em class="final-order-price">${total}</em>
				<span>원</span>
				<span>&nbsp; / &nbsp;</span>
				<span>총 적립포인트: </span>
				<strong class="all-mileage"></strong><span>P</span>
			</div>
		</div>
	</div>

	<div>
	<a href="" class="">쇼핑 계속하기</a>
	<a href="/orderDetailController.do" class="btn btn-primary" role="button">구매하기</a>
	</div>
	
</body>
</html>