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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	.btn.pink{
      background-color: #FE2E64;
      border-bottom:5px solid #165195;
    }
    .btn.pink:active{
      border-bottom:2px solid #165195;
    }

</style>
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
								param += "recipe_number="
										+ $(".material").eq(i).data("mate");
								if (material.length - 1 != i) {
									param += "&";
								}
							}
							location.href = "${pageContext.request.contextPath}/CartSelectContoroller.do?recipe_number=" + ${ recipe.recipe_number };
						}
					}
				})
	$("#input_imgs").on("change", handleImgFileSelect);
		$(".reviewDel").on("click",function(){
			var result = confirm("정말 삭제 하시겠습니까?");
			if(result){
				var reviewNo = $(this).data("no");
				 location.href="/teamProject3/recipeReviewDel.do?recipe_review_no="+reviewNo+"&recipe_number=${ recipe.recipe_number }";
			}
		})
	})
	
	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}

	function handleImgFileSelect(e) {

		// 이미지 정보들을 초기화
		sel_files = [];
		$(".imgs_wrap").empty();

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		var index = 0;
		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}

					sel_files.push(f);

					var reader = new FileReader();
					reader.onload = function(e) {
						var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
								+ index
								+ ")\" id=\"img_id_"
								+ index
								+ "\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' style='width:100px; height:100px;'></a>";
						$(".imgs_wrap").append(html);
						index++;

					}
					reader.readAsDataURL(f);

				});
	}

	function deleteImageAction(index) {
		console.log("index : " + index);
		console.log("sel length : " + sel_files.length);
		var a = $("#input_imgs");
		console.log(a);
		sel_files.splice(index, 1);

		var img_id = "#img_id_" + index;
		$(img_id).remove();
	}

	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}

	function submitAction() {
		console.log("업로드 파일 갯수 : " + sel_files.length);
		var data = new FormData();

		for (var i = 0, len = sel_files.length; i < len; i++) {
			var name = "image_" + i;
			data.append(name, sel_files[i]);
		}
		data.append("image_count", sel_files.length);

		if (sel_files.length < 1) {
			alert("한개이상의 파일을 선택해주세요.");
			return;
		}

		var xhr = new XMLHttpRequest();
		xhr.open("POST", "./study01_af.php");
		xhr.onload = function(e) {
			if (this.status == 200) {
				console.log("Result : " + e.currentTarget.responseText);
			}
		}
		
		xhr.send(data);

	}
	function itemActive($el) {
		$el.siblings().removeClass('active');

	}
	
/* 	$(function() {
		$(".material").on("click", function () {
			if (material.product_name == recipe.product_name) {
				d
			}
		})
	}) */
	
</script>
</head>
<body>
	<div class="row">
		<div class="col-sm-12" align="center">
			<h1>${ recipe.recipe_name }</h1>
		</div>
		
		<div> 
			<h3>작성자 : ${ recipe.member_id }</h3>
		</div>
		
		<div class="col-sm-12" align="center">
			<img src="/teamProject3/images/${ recipe.main_img }" height="400" width="400">
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
			<h1>[재료]</h1>
			<c:forEach items="${ product }" var="mater">
				<c:if test="${mater.product_code eq 'prod'}">
				<h3 class="material" data-mate="${ mater.product_number }">${ mater.product_name }
					용량 :${ mater.product_unit }</h3>
				</c:if>
			</c:forEach>
		</div>
		
		<div class="col-sm-6" align="right">
			<h1>[양념]</h1>
			<c:forEach items="${ product }" var="mater">
				<c:if test="${mater.product_code eq 'non_prod'}">
				<h3 class="non_material" data-mate="${ mater.product_number }">${mater.product_name }
					용량 :${ mater.product_unit }</h3>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<hr>
	<div class="row">
		<c:forEach items="${ photo }" var="step">
			<div class="col-sm-6">조리 내용 : ${ step.cooking_content }</div>
			<div class="col-sm-6">
				<img src="/teamProject3/images/${ step.cooking_photo_name }" height="200" width="200">
				<br>
			</div>
		</c:forEach>
	</div>
	
	<hr>
	<div align="center">
	<a href="recipeViewUpdate.do?recipe_number=${recipe.recipe_number}">
		<button type="button" class = "btn green">레시피 수정</button>
	</a>
	
	<button type="button" class = "btn red"
			id = "recipedele">레시피 삭제</button>	
	</div>
	
	<hr>
	<div class="row">
		<div class="col-sm-12" align="center">
			<button id="cart">담기</button>
		</div>
	</div>
	<hr>
	
	<c:forEach items="${ reviewlist }" var="list">
		<div class="row" id="over" style="border-top-width:1px;border-top-style:solid;padding:20px; border-top-color : #f0f0f5;">

				<div class="col-sm-1" >
					작성자 위치 ${ list.member_id }<br>
				</div>
				<div class="col-sm-10" align="left">
				<small>${ list.recipe_review_date }</small><br> ${ list.recipe_review_content }<br>
					<br><br>
						<img style="width: 100px; height: 100px;"
							src="/teamProject3/images/${list.recipe_review_file }">
				</div>
				<div class="col-sm-1" align="right">
				 	<c:if test="${ list.member_id == sessionScope.id }"> 
						<a class="reviewDel" href="javascript:void(0);" data-no="${ list.recipe_review_no }"><img src="/teamProject3/images/delBtn.png" style="width: 25px; height: 25px;"></a>
					</c:if>
				</div>

		</div>
			</c:forEach>
	<div align="center">
 <my:paging paging="${paging}" jsfunc="gopage" />
</div>
<form name="searchFrm">		
	<input type="hidden" name="p" value="1">
	<input type="hidden" name="res_no" class="recipe_no" value="${ recipe.recipe_number }">
	
</form>
	<hr>
	<div class="row">
			<div class="col" align="center">
				<form action="/teamProject3/recipeReview.do" method="post"
					enctype='multipart/form-data'>
					<div class="col-sm-8" align="center">
						<div align="left">
							<input type="file" id="input_imgs" name="recipe_review_file"
								>
						</div>
					</div>

					<div class="col-sm-8" align="center">
						<div class="imgs_wrap">
							<img id="img"/>
						</div>
					</div>
					<br> <input value="${ recipe.recipe_number }" name="recipe_no"
						hidden="hidden">
					<textarea cols="100" rows="10" 
						name="recipe_reivew_content"></textarea>
					<button id="insert" style="vertical-align: top; ">
						리뷰 쓰기</button>
				</form>
				<br>
				<br>
				<br>
			</div>
		</div>
	<hr>
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
	<script>
	function gopage(p) {			// 검색 function
		searchFrm.p.value = p;		// 페이지번호 받아와서 submit에 넘김
		searchFrm.submit();
		
		// location.href="deptSelectAll?p=" + p;	// 이동되는 주소가 달라서 여러사람이 쓰기위해서는 매개값 p로 해줌
	}
</script> 
</body>
</html>