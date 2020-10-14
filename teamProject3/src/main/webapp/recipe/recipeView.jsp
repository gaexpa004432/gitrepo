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
<style>
.btn { /* 새로운재료 추가 버튼 css */
	text-decoration: none;
	font-size: 2rem;
	color: white;
	padding: 10px 20px 10px 20px;
	margin: 20px;
	display: inline-block;
	border-radius: 10px;
	transition: all 0.1s;
	text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
	font-family: 'Lobster', cursive;
	<!--
	google
	font
	-->
}

.btn:active {
	transform: translateY(3px);
}

.btn.blue {
	background-color: #1f75d9;
	border-bottom: 5px solid #165195;
}

.btn.blue:active {
	border-bottom: 2px solid #165195;
}

.btn.red {
	background-color: #ff521e;
	border-bottom: 5px solid #c1370e;
}

.btn.red:active {
	border-bottom: 2px solid #c1370e;
}

.btn.green {
	background-color: #298A08;
	border-bottom: 5px solid #165195;
}

.btn.green:active {
	border-bottom: 2px solid #165195;
}

.btn.pink {
	background-color: #FE2E64;
	border-bottom: 5px solid #165195;
}

.btn.pink:active {
	border-bottom: 2px solid #165195;
}
</style>
<script type="text/javascript">
	$(function() {
		var favorite = "${favorite}";
		if(favorite == "true"){
			$("#bookmark").html("<img src='/teamProject3/images/즐겨찾기취소.jpg' style='width: 100px; height: 100px; margin-left: 30px;'>");
			
		} else {
			$("#bookmark").html("<img src='/teamProject3/images/즐겨찾기.jpg'style='width: 100px; height: 100px; margin-left: 30px;'>");
		}
//======================================================================================================
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
//===============================================================================================			
	$("#input_imgs").on("change", handleImgFileSelect);
		$(".reviewDel").on("click",function(){
			var result = confirm("정말 삭제 하시겠습니까?");
			if(result){
				var reviewNo = $(this).data("no");
				 location.href="/teamProject3/recipeReviewDel.do?recipe_review_no="+reviewNo+"&recipe_number=${ recipe.recipe_number }";
			}
		})
	
//==================================================================================================
	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}
		
//====================================================================================================
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
//====================================================================================================
	function deleteImageAction(index) {
		console.log("index : " + index);
		console.log("sel length : " + sel_files.length);
		var a = $("#input_imgs");
		console.log(a);
		sel_files.splice(index, 1);

		var img_id = "#img_id_" + index;
		$(img_id).remove();
	}
//==================================================================================================
	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}
//==================================================================================================
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
//====================================================================================================
	
	      //레시피 삭제
			$("#recipedele").on("click",function (){
				var result = confirm('??지울라고???왜????');
				if (result) {
				location.href="/teamProject3/recipeDelete.do?recipe_number=${recipe.recipe_number}"
				}
			})
			if (${id == board.member_id}){
				$(".btn").show();
			}
		
	
//====================================================================================================
		
		$("#bookmark").on("click",function(){   //즐겨찾기
			
			var recipe_no = "${recipe.recipe_number}";
			var recipe_code = "fr";
			if(favorite == "false") {
					$("#bookmark").html("<img src='/teamProject3/images/즐겨찾기취소.jpg' style='width: 100px; height: 100px; margin-left: 30px;'>");
					favorite = "true";
			$.ajax("bookMark.do", {
				method : "get",
				dataType : "json",					// 서버에서 넘겨주는 데이터타입. text, html, json 등 타입을 적어줌
				data : {no:recipe_no,code:recipe_code,bookmark:"insert"},						// 보낼 파라미터. 아작스함수가 값을 쿼리 문자형태(no=)로 바꿔서 넘겨줌
				success : function(data) {
				}
			});
			
			} else {
				$("#bookmark").html("<img src='/teamProject3/images/즐겨찾기.jpg' style='width: 100px; height: 100px; margin-left: 30px;'>");
				favorite = "false";
				$.ajax("bookMark.do", {
					method : "get",
					dataType : "json",					// 서버에서 넘겨주는 데이터타입. text, html, json 등 타입을 적어줌
					data : {no:recipe_no,code:recipe_code,bookmark:"delete"},						// 보낼 파라미터. 아작스함수가 값을 쿼리 문자형태(no=)로 바꿔서 넘겨줌
					success : function(data) {
					}
				});
			}
		})
//====================================================================================================	
		$(".product_recipe").on("click",function(){    //재료 클릭시  재료가 포함된 레시피로 이동
			var result = confirm("관련 레시피창으로 이동 합니다.")
			if(result){
				location.href="/teamProject3/recipeChoiceBoard.do?product_name="+$(this).data("product")
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

		<div>
			<h3>작성자 : ${ recipe.member_id }</h3>
		</div>

		<div class="col-sm-12" align="center">
			<img src="/teamProject3/images/${ recipe.main_img }" height="400"
				width="400">
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
					<h3 class="material" data-mate="${ mater.product_number }">
				    <a href="javascript:void(0);" class="product_recipe" data-product="${ mater.product_name }">${ mater.product_name }</a>
					용량 : ${ mater.product_unit }
					</h3>
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
				<img src="/teamProject3/images/${ step.cooking_photo_name }"
					height="200" width="200"> <br>
			</div>
		</c:forEach>
	</div>

	<hr>
	<div align="center">
		<a href="recipeViewUpdate.do?recipe_number=${recipe.recipe_number}">
			<button type="button" class="btn green">레시피 수정</button>
		</a>

		<button type="button" class="btn red" id="recipedele">레시피 삭제</button>
	</div>

	<div align="right">
		<a href="javascript:void(0);" id="bookmark"> 
		<img src="/teamProject3/images/" style="width: 100px; height: 100px; margin-left: 30px;">
		</a>
	</div>

	<hr>
	<div class="row">
		<div class="col-sm-12" align="center">
			<button id="cart">담기</button>
		</div>
	</div>
	<hr>

	<c:forEach items="${ reviewlist }" var="list">
		<div class="row" id="over"
			style="border-top-width: 1px; border-top-style: solid; padding: 20px; border-top-color: #f0f0f5;">

			<div class="col-sm-1">
				작성자 위치 ${ list.member_id }<br>
			</div>
			<div class="col-sm-10" align="left">
				<small>${ list.recipe_review_date }</small><br> ${ list.recipe_review_content }<br>
				<br>
				<br> <img style="width: 100px; height: 100px;"
					src="/teamProject3/images/${list.recipe_review_file }">
			</div>
			<div class="col-sm-1" align="right">
				<c:if test="${ list.member_id == sessionScope.id }">
					<a class="reviewDel" href="javascript:void(0);"
						data-no="${ list.recipe_review_no }"><img
						src="/teamProject3/images/delBtn.png"
						style="width: 25px; height: 25px;"></a>
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
						<input type="file" id="input_imgs" name="recipe_review_file">
					</div>
				</div>

				<div class="col-sm-8" align="center">
					<div class="imgs_wrap">
						<img id="img" />
					</div>
				</div>
				<br><input value="${ recipe.recipe_number }" name="recipe_no"
					hidden="hidden">
				<textarea cols="100" rows="10" name="recipe_reivew_content"></textarea>
				<button id="insert" style="vertical-align: top;">리뷰 쓰기</button>
			</form>
			<br><br><br>
		</div>
	</div>

</body>
</html>