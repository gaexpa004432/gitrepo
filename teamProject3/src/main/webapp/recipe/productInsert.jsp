<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productInsert</title>
<style>
.btn{  /* 새로운재료 추가 버튼 css */
      text-decoration: none;
      font-size:2rem;
      color:white;
      padding:10px 20px 10px 20px;
      margin:20px;
      display:inline-block;
      border-radius: 10px;
      transition:all 0.1s;
      text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
      font-family: 'Lobster', cursive; <!-- google font -->
    }
    .btn:active{
      transform: translateY(3px);
    }
    .btn.blue{
      background-color: #1f75d9;
      border-bottom:5px solid #165195;
    }
    .btn.blue:active{
      border-bottom:2px solid #165195;
    }
    .btn.red{
      background-color: #ff521e;
      border-bottom:5px solid #c1370e;
    }
    .btn.red:active{
      border-bottom:2px solid #c1370e;
    }
     .btn.green{
      background-color: #298A08;
      border-bottom:5px solid #165195;
    }
    .btn.green:active{
      border-bottom:2px solid #165195;
    }

</style>

<script>

	function input() {
		
		if(frm.product_name.value == "") {
			window.alert("상품이름 입력하세요");
			frm.product_name.focus();
			return false;
		}
		
		if(frm.product_price.value == "") {
			window.alert("상품가격 입력하세요");
			frm.product_price.focus();
			return false;
		}
		
		if(frm.product_unit.value == "") {
			window.alert("상품단위 입력하세요");
			frm.product_unit.focus();
			return false;
		}
		
		if(frm.seller_code.value == "") {
			window.alert("소상공인번호 입력하세요");
			frm.seller_code.focus();
			return false;
		}
		
		return true;
	}
	
</script>
</head>

<body>

	<h1>재료 등록</h1>

	<form method="post" action="/teamProject3/save_product.do">
		<div>
			<label for="product_name">상품이름</label> 
			<input type="text" name="product_name" id="product_name">
		</div>
		
		<div>
			<label for="product_price">상품가격</label> 
			<input type="text" name="product_price" id="product_price">
		</div>
		
		<div>
			<label for="product_unit">상품단위</label> 
			<input type="text" name="product_unit" id="product_unit">
		</div>

		<div>
			<label for="seller_code">소상공인번호</label> 
			<input type="text" name="seller_code" id="seller_code">
		</div>
		
		
		<br>
		<button class = "btn blue">등록</button>	
			
		<a class = "btn red" href="/teamProject3/productList.do">뒤로가기</a>
		
	</form>
</body>
</html>