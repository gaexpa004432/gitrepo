<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#cart").on(
				"click",
				function() {
					var result = confirm("담으시겟습니까?");
					if (result == true) {
						var material = $(".material");
						if (material != null) {
							var param = "?";
							for (i = 0; i <= material.length - 1; i++) {
								param += "product_number="
										+ $(".material").eq(i).data("mate");
								if (material.length - 1 != i) {
									param += "&";
								}
							}
							location.href = "cart.do" + param;
						}
					}
				})
	})
</script>
</head>
<body>
	<div class="row">
		<div class="col-sm-12" align="center">
			<h1>${ recipe.recipe_name }</h1>
		</div>
		<div class="col-sm-12" align="center">
			<img src="/teamProject3/images/${ recipe.main_img }">
		</div>
		<div class="col-sm-12" align="center">
			<h3>${ recipe.recipe_content }</h3>
		</div>
		<div class="col-sm-6" align="center">레시피 시간 : ${ recipe.cooking_time }</div>
		<div class="col-sm-6" align="center">레시피 레벨 : ${ recipe.cooking_level }</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-12" align="center">
			<h1>재료</h1>
		</div>
		<div class="col-sm-6" align="left">
			<h1>[판매재료]</h1>
			<c:forEach items="${ product }" var="mater">
				<h3 class="material" data-mate="${ mater.product_number }">${mater.product_name }
					개수 :${ mater.product_unit }</h3>
			</c:forEach>
		</div>
		<div class="col-sm-?" align="right">
			<h1>그외 재료</h1>
	<%-- 		<c:forEach items="${ product }" var="non_mater">
				<h3 class="non_material" data-mate="${ non_mater.product_number }">
				${non_mater.product_name } 개수 :${ non_mater.product_unit }
				</h3>
			</c:forEach> --%>
		</div>
	</div>
	<hr>
	<div class="row">
		<c:forEach items="${ photo }" var="step">
			<div class="col-sm-6">조리 내용 : ${ step.cooking_content }</div>
			<div class="col-sm-6">
				<img src="/teamProject3/images/${ step.cooking_photo_name }">
				<br>
			</div>
		</c:forEach>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-12" align="center">
			<button id="cart">담기</button>
		</div>
	</div>
	레시피 내용 :${ recipe.recipe_content }
	<br> 레시피 번호 : ${ recipe.recipe_number }
	<br> 레시피 이름 : ${ recipe.recipe_name }
	<br> 레시피 날짜 : ${ recipe.recipe_date }
	<br> 레시피 아이디 :${ recipe.member_id }
	<br> 레시피 시간 :${ recipe.cooking_time }
	<br> 레시피 레벨 :${ recipe.cooking_level }
	<br> 레시피 이미지 :${ recipe.main_img }
	<br>

	<c:forEach items="${ product }" var="mater">
			상품번호 : ${ mater.product_number }<br>
			상품이름 : ${ mater.product_name }<br>
			상품가격 : ${ mater.product_price }<br>
			상품단위 : ${ mater.product_unit }<br>
			상품이미지 :${ mater.product_img }<br>
			판매자 : ${ mater.seller_code }<br>
	</c:forEach>
</body>
</html>