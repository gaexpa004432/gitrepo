<%@page import="java.util.List"%>
<%@page import="model.ProductVO"%>
<%@page import="recipe.ProductListController"%>
<%@page import="java.util.ArrayList"%>
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
	width: 80%;
	margin : auto;
	border-top: 0;
	border-collapse: collapse;
	border-spacing: 0;
	padding-left : 15px;
	padding-right : 15px;
	text-align : center;
	
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

.shoping__checkout {
	margin-left : auto;
	margin-right : auto;
}

.cartdiv {
	margin-left : auto;
	margin-right : auto;
	width : 1400px;
}

#checkout {
	margin-left : auto;
	margin-right : auto;
	display : block;
	float : right;
	margin-right: 9%;

}

#resume {
	margin-top : 3%;
	margin-left : 11%;
}

.cartdiv {
	margin-left : auto;
	margin-right : auto;
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
		
		$('#check_button').on('click', function() {
			var arr = [];
			$('.cart-check:checked').each(function (index, item) {
				var tds = $(this).parent().parent().find('td')
				var recipe_name = tds.get(1).innerText;
				var product_quantity =   $(this).parent().parent().find('.quantity-select').val();
				var product_price = tds.get(3).innerText;
				var product_name = tds.get(2).innerText;
                arr.push({recipe_name:recipe_name, product_quantity:product_quantity, product_price:product_price, product_name:product_name});
				
			})
			frm.arr.value = JSON.stringify(arr)
			frm.submit();
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
			m_all = m_all + milSum;
			
		}
		$('.all-mileage').text(m_all);
	}
	
</script>
</head>
<body>

 <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>장바구니</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
<div class="cartdiv">
<form action="${pageContext.request.contextPath}/orderDetailController.do" name="frm" id="frm">
<input type="hidden" name="arr">
</form>
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
				<th scope="col" class="th-recipe-number">레시피 이름</th>
				<th scope="col" class="th-product-box">재료 이름</th>
				<th scope="col" class="th-price-box">단가</th>
				<th scope="col" class="th-quantity-box">수량</th>
				<th scope="col" class="th-product-total-box">상품금액</th>
				<th scope="col" class="th-mileage-box">예상 적립금</th>
			</tr>
		</thead>
		
	<tbody class="cartTable-body">		
	<c:set var="gum" value="0" />
	<c:forEach items="${list}" var="cart">
		<tr class="cart-deal-items">
			<td class="select-event">
				<input type="checkbox" class="cart-check" value="${cart.product_number}" checked>  ${cart.main_img}
			</td>
			<td> <input type="hidden" class="recipe_name" value="${cart.recipe_name}"> ${cart.recipe_name}</td>
			<td> <input type="hidden" class="product_name" value="${cart.product_name}">${cart.product_name}</td>
			<td class="cart_price">${cart.product_price}</td>
			<td>
			<select class="quantity-select" name="product_quantity">
			<option <c:if test="${cart.product_quantity == '1'}">selected </c:if> value="1">1</option>
			<option <c:if test="${cart.product_quantity == '2'}">selected </c:if> value="2">2</option>
			<option <c:if test="${cart.product_quantity == '3'}">selected </c:if> value="3">3</option>
			<option <c:if test="${cart.product_quantity == '4'}">selected </c:if> value="4">4</option>
			</select></td>
			<td class="all-product-price">${cart.product_price}</td>
			<td class="mileage-price">${cart.product_price * 0.01}</td>
		</tr>
		<c:set var="gum" value="${cart.product_price}"/>
		<c:set var="total" value="${total+gum}"/>
	</c:forEach>
	</tbody>
	</table>
	

	<a href="${pageContext.request.contextPath}/recipeBoard.do" id="resume"class="btn btn-danger btn-lg-3 btn-radius">쇼핑 계속하기</a>

	
      <div class="col-lg-4" id="checkout">
                    <div class="shoping__checkout">
                       <h5>Cart Total</h5>
                       <hr>
                        <ul>
                            <li>적립 마일리지: <span class="all-mileage">P</span></li>
                            <li>구매 총 금액: <span class="final-order-price"><input type="hidden" name="total">${total}원</span></li>
                        </ul>
	<input type="button" id="check_button" class="btn btn-danger btn-block" value="구매">
                    </div>
                </div>

		<input type="hidden" name="seller_code" value="${resultVO.seller_code}">

</div>
	
</body>
</html>