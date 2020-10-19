<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<script>
	
  function eventCheck() {

	        if(frm.recipe_name.value == "") {
	            window.alert("제목을 적어주세요");
	            frm.recipe_name.focus();
	            return false;
	        }
	        if(frm.recipe_content.value == "") {
	            window.alert("간단한 소개글을 적어주세요!!!");
	            frm.recipe_content.focus();
	            return false;
	        } 
	        if(frm.main_img.value == "") {
	            window.alert("완성된 사진을 올려주세요");
	            frm.main_img.focus();
	            return false;
	        }
	        if(frm.cooking_time.value == "") {
		            window.alert("조리 시간을 체크하세요");
		            frm.cooking_time.focus();
		            return false;
	        }
	        if(frm.cooking_level.value == "") {
	            window.alert("난이도을 체크하세요");
	            frm.cooking_level.focus();
	            return false;
	        }        
	        if(frm.product_name.value == "") {
	            window.alert("재료를 입력하세요");
	            frm.product_name.focus();
	            return false;
	        }
	        if(frm.product_unit.value == "") {
	            window.alert("재료용량를 입력하세요");
	            frm.product_unit.focus();
	            return false;
	        }
	        if(frm.product_price.value == "") {
	            window.alert("재료가격을 입력하시오");
	            frm.product_price.focus();
	            return false;
	        }
	        if(frm.cooking_content.value == "") {
	            window.alert("순서를 확인하세요");
	            frm.cooking_content.focus();
	            return false;
	        }
	        if(frm.non_product_name.value == "") {
	            window.alert("양념을 기입하세요");
	            frm.non_product_name.focus();
	            return false;
	        }
	        if(frm.non_product_unit.value == "") {
	            window.alert("양념 용량을 기입하세요");
	            frm.non_product_unit.focus();
	            return false;
	        } else {
	        	window.alert("재등록하시겠습니까????");
	            return true;
	        }
	    }
//====================================================================================================
		$(function(){           //조리 순서 추가
			
			
			$('input[type="text"]').keydown(function() {
			    if (event.keyCode === 13) {
			        event.preventDefault();
			    }
			});
			
			
			
		$(".stepAdd").on("click",function(){
			$(".cooking_order").append($("<div>")
					.append($("<input>").attr("name","cooking_step").attr("weith", "40px").attr("height", "100px"))
					.append($("<img>").css("width","150px").css("height","150px").attr("class","step_img"))
					.append($("<input>").attr("type","file").attr("name","step_img").attr("class","step_img1"))		
					.append($("<button>").attr("type","button").text("삭제").on("click",function(){
						$(this).parent().remove();
					}))
					.append($("<br>")));
			
		})
//====================================================================================================
		//상품이름 단위 가격 적는 곳 추가~!!!
			
			$(".matAdd").on("click",function(){
				$(".matList").append($("<div>")
						.append($("<input>").attr("name","product_name").attr("placeholder", "예) 아보카도"))
						.append($("<input>").attr("name","product_unit").attr("placeholder", "예) 10kg"))
						.append($("<input>").attr("name","product_price").attr("placeholder", "예) 20000"))
						.append($("<img>").attr("type","img")
								.attr("src", "/teamProject3/images/휴지통.png")
								.attr("width", "30px").attr("height", "30px").text("삭제").on("click",function(){
							$(this).parent().remove();
						}))
						.append($("<br>")));		
		
			})			
//====================================================================================================		
		//비매품이름 단위  적는 곳 추가~!!!	
		$(".nonmatAdd").on("click",function(){
			$(".nonmatList").append($("<div>")
				.append($("<input>").attr("name","non_product_name").attr("placeholder", "예) 된장"))
				.append($("<input>").attr("name","non_product_unit").attr("placeholder", "예) 350g"))
				.append($("<img>").attr("type","img").attr("src", "/teamProject3/images/휴지통.png")
								  .attr("width", "30px").attr("height", "30px").on("click",function(){
					$(this).parent().remove();
					}))
					.append($("<br>")));		
		})		
		
	$("#cooking_time").val("${ recipe.cooking_time }");
	$("#cooking_level").val("${ recipe.cooking_level }");
	
$(document).on("change",".step_img1",function () { 
		
    var fileList1 = this.files ;
   
    // 읽기
    var reader1 = new FileReader();
   
    reader1.readAsDataURL(fileList1 [0]);
	

    //로드 한 후
    	/* $(reader1).onload(function(){
    		console.log($(this).parent().children().eq(1));
        $(this).parent().children().eq(1).src(reader1.result); 
    	})*/
    var start = this;
    console.log(this.parentNode.childNodes[0])
    reader1.onload = function () {
    	start.parentNode.childNodes[1].src = reader1.result ;
    	start.parentNode.childNodes[3].src = reader1.result ;
    	
       // this.parentNode.childNodes.src = reader1.result ;
       
    	}; 
    		
	}); 
//====================================================================================================	
     //수정
     $(".cooking_update").on("click", function() { 
		   // console.log($(this).parent().children().eq(2)[0].files[0]);
		    var formData = new FormData();
		    formData.append("number", $(this).parent().children().eq(3).val());
		    formData.append("content", $(this).parent().children().eq(0).val());
		    formData.append("photo_name", $(this).parent().children().eq(2)[0].files[0]);    
		    
 	 $.ajax({ 
	 	 type : 'POST', 
	 	 url : "/teamProject3/ajaxRecipeUpdate.do",
	 	 processData : false, 
	 	 contentType : false, 
	 	 data : formData, 
		  success : function(data) {  
			  
		  	}  
  	     }) 
 	 });
   	
})

	</script>
 <style>
      .container {
        text-align: center;
        position: relative;
  		z-index: 1;
       }

       textarea {
		width: 100%;
		height: 150px;
		font-size: 16px;
		color: #6f6f6f;
		padding-left: 20px;
		margin-bottom: 24px;
		border: 1px solid #ebebeb;
		border-radius: 4px;
		padding-top: 12px;
		resize: none;
		}
       
		input {
		font-size: 16px;
		color: #6f6f6f;
		padding-left: 20px;
		margin-bottom: 24px;
		border: 1px solid #ebebeb;
		border-radius: 4px;
		padding-top: 12px;
		resize: none;
		}       
       
       select {
		width: 200px;
		height: 30px;
		padding-left: 10px;
		font-size: 18px;
		font-color : black;
		border: 1px solid #4AB34A;
		border-radius: 3px;
		}
		
    </style>
</head>
<body>
	<div class="container">
	<h1 align="center">레시피 수정</h1><br><br>

	<form action="/teamProject3/recipeUpdate.do" method="post" name="frm"
		id="frm" enctype='multipart/form-data' onsubmit="return recipeCheck()">
		<input type="hidden" name="recipe_number" value="${recipe.recipe_number}"> 
		<input type="hidden" name="board_no" value="${board.board_no}">
	
			<h2 style = "color:#9ACD32;">레시피 제목</h2><br><br>	
			<input type="text" name="recipe_name" value="${recipe.recipe_name}">
			<hr>
			
			<h2 style = "color:#9ACD32;">완성 사진</h2><br><br>
			<img id="main_img" src="/teamProject3/images/${ recipe.main_img }" width="300" height="300" alt="" />
			<input type="file" name="main_img" class="step_img1">
				
			<hr>
			<div class="row">
			<div class="col-sm-12" align="center">
			<h2 style = "color:#6B8E23;">레시피 소개글</h2><br><br>
			<textarea cols="100" rows="20" name="recipe_content" style= "height:100px; width:610px;"
					placeholder = "간단한 소개글을 적어주세요">${recipe.recipe_content}</textarea>
			</div>
			</div>

		<hr>
		<h2 class="container" style = "color:#6B8E23; font-family: Fantasy;">요리 정보</h2><br>
		<div class="container">
			<span class="time">시간</span> 
			<select name="cooking_time" id="cooking_time">
				<option value="조리시간" style="background : #AAFA82;">조리시간(필수)</option>
				<option value="5분이내" style="background : #A0FA78">5분이내</option>
				<option value="10분이내" style="background : #9BFA73">10분이내</option>
				<option value="30분이내" style="background : 	#96F56E">30분이내</option>
				<option value="1시간이내" style="background : #82EB5A">1시간이내</option>
				<option value="1시간30분이내" style="background : #78E150">1시간30분이내</option>
				<option value="2시간이내" style="background : 	#6ED746">2시간이내</option>
				<option value="4시간이내" style="background : #64CD3C">4시간이내</option>
			</select> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="level">난이도</span> 
			<select name="cooking_level" id="cooking_level">
				<option value="난이도" style="background : #AAFA82">난이도(필수)</option>
				<option value="누구나" style="background : #9BFA73">누구나</option>
				<option value="하" style="background : #82EB5A">하</option>
				<option value="중" style="background : #78E150">중</option>
				<option value="상" style="background : #6ED746">상</option>
				<option value="상상" style="background : #64CD3C">상상</option>
			</select>
		</div>

		<hr>
		<h2 class="container" style = "color:#6B8E23; font-family: Fantasy;">재료</h2><br>
		<div class="matList container">

			<c:forEach items="${product}" var="productList">
				<c:if test="${productList.product_code eq 'prod'}">
					<input name="product_name" placeholder="예) 돼지고기"
						value="${productList.product_name}">
					<input name="product_unit" placeholder="예) 1KG"
						value="${productList.product_unit}">
					<input name="product_price" placeholder="예) 10000원"
						value="${productList.product_price}">
					 <img style="visibility:hidden;" src="/teamProject3/images/휴지통.png" width="30px" height="30px" />
					<br>
				</c:if>
			</c:forEach>
		</div>
		<button type="button" class="matAdd site-btn">재료 추가</button>

		<hr>
		<h2 style = "color:green;">양념</h2><br><br>
		<div class="nonmatList">
			<c:forEach items="${product}" var="non_productList">
				<c:if test="${non_productList.product_code eq 'non_prod'}">
					<input name="non_product_name" placeholder="예) 간장"
						   value="${non_productList.product_name}">
					<input name="non_product_unit" placeholder="예) 500g"
						   value="${non_productList.product_unit}">
					<img style="visibility:hidden;" src="/teamProject3/images/휴지통.png" width="30px" height="30px" />
					<br>
				</c:if>
			</c:forEach>
		</div>
		<button type="button" class="nonmatAdd site-btn">양념 추가</button>

		<hr>
		<h2 style = "color:green;">요리 순서</h2><br><br>
		<div class="cooking_order">
			<c:forEach items="${ photo }" var="step">

				<div>
					<input size="40" style="height :100px" value="${ step.cooking_content }">
					<img class="step_img"
						 src="/teamProject3/images/${ step.cooking_photo_name }"
						 width="150" height="100" alt=""> 
					<input type="file" class="step_img1"  accept="image/*"> 
					<input type="hidden" class="photo_number" value="${ step.photo_number }">
					<button type="button" class="cooking_update site-btn">요리 순서 수정</button>
					<br>
				</div>

			</c:forEach>

		</div>
		<button type="button" class="stepAdd site-btn ">순서 추가</button>

		<br>
		<hr>
		<div align="center">
			<button class="site-btn">수정완료</button>
		</div>
		<br><br><br><br>
	</form>
	</div>
</body>
</html>