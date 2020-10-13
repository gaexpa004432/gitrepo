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

<script>
	
  function eventCheck() {

	        if(frm.recipe_name.value == "") {
	            window.alert("제목 적고 가라");
	            frm.recipe_name.focus();
	            return false;
	        }
	    
	        if(frm.recipe_content.value == "") {
	            window.alert("니 소개 하고 가라!!!");
	            frm.recipe_content.focus();
	            return false;
	        }
	        
	        if(frm.main_img.value == "") {
	            window.alert("파일 올리라");
	            frm.main_img.focus();
	            return false;
	        }
	        
	        if(frm.cooking_time.value == "") {
		            window.alert("조리 시간");
		            frm.cooking_time.focus();
		            return false;
	        }
	        
	        if(frm.cooking_level.value == "") {
	            window.alert("난이도~ 조정");
	            frm.cooking_level.focus();
	            return false;
	        }
	        
	        if(frm.product_name.value == "") {
	            window.alert("재료이름는??");
	            frm.product_name.focus();
	            return false;
	        }
	        
	        if(frm.product_unit.value == "") {
	            window.alert("재료용량은??");
	            frm.product_unit.focus();
	            return false;
	        }
	        
	        if(frm.product_price.value == "") {
	            window.alert("재료가격은??");
	            frm.product_price.focus();
	            return false;
	        }
	        
	        if(frm.cooking_content.value == "") {
	            window.alert("순서는??");
	            frm.cooking_content.focus();
	            return false;
	        }
	        
	        if(frm.non_product_name.value == "") {
	            window.alert("양념는??");
	            frm.non_product_name.focus();
	            return false;
	        }
       
	        if(frm.non_product_unit.value == "") {
	            window.alert("양념 용량는??");
	            frm.non_product_unit.focus();
	            return false;
	        } else {
	        	window.alert("재등록할랑교~~");
	            return true;
	        }
	    }
//====================================================================================================
		$(function(){           //조리 순서 추가
		
		$(".stepAdd").on("click",function(){
			$(".cooking_order").append($("<div>")
					.append($("<input>").attr("name","cooking_step"))
					.append($("<input>").attr("type","file").attr("name","step_img"))		
					.append($("<button>").attr("type","button").text("삭제").on("click",function(){
						$(this).parent().remove();
					}))
					.append($("<br>")));		
		})
	})
//====================================================================================================
		$(function(){           //상품이름 단위 가격 적는 곳 추가~!!!
			
			$(".matAdd").on("click",function(){
				$(".matList").append($("<div>")
						.append($("<input>").attr("name","product_name"))
						.append($("<input>").attr("name","product_unit"))
						.append($("<input>").attr("name","product_price"))
						.append($("<button>").attr("type","button").text("삭제").on("click",function(){
							$(this).parent().remove();
						}))
						.append($("<br>")));		

			})	

		})
//====================================================================================================		
		$(function(){           //비매품이름 단위  적는 곳 추가~!!!
			
			$(".nonmatAdd").on("click",function(){
				$(".nonmatList").append($("<div>")
						.append($("<input>").attr("name","non_product_name"))
						.append($("<input>").attr("name","non_product_unit"))
						.append($("<button>").attr("type","button").text("삭제").on("click",function(){
							$(this).parent().remove();
						}))
						.append($("<br>")));		
			})	
		})
	</script>

</head>
<body>
	<h1 align="center">레시피 수정</h1>  
	${recipe}
	${product}
	<form action ="/teamProject3/recipeUpdate.do" method="post" name="frm" id="frm"
		  enctype='multipart/form-data'
		  onsubmit="return recipeCheck()">
		  <input type="hidden" name="recipe_number" value="${recipe.recipe_number}">
		  <input type="hidden" name="board_no" value="${board.board_no}">
	  <table>
                <tr>
                    <th>레시피 제목 </th>
                    <td><input type="text" name="recipe_name" value="${recipe.recipe_name}"></td>
                </tr>
               
               <tr>
                    <td></td>
                    <td><input type = "file" name="main_img"></td>
                </tr>
               
                <tr>
                    <th>레시피 소개글</th>
                    <td><textarea cols="100" rows="20" name="recipe_content">${recipe.recipe_content}</textarea></td>
                </tr>
			
            </table>
		 
		 <hr>
	<h2>요리 정보</h2>
	<div>
	<span class = "time">시간</span>
		<select name = "cooking_time" id = "cooking_time">
			<option value="">조리시간</option>
			<option value="5분이내">5분이내</option>
			<option value="10분이내">10분이내</option>
			<option value="30분이내">30분이내</option>
			<option value="1시간이내">1시간이내</option>
			<option value="1시간30분이내">1시간30분이내</option>
			<option value="2시간이내">2시간이내</option>
			<option value="4시간이내">4시간이내</option>
		</select>	
		<span class = "level">난이도</span>
		<select name = "cooking_level" id = "cooking_level" >
			<option value="">난이도</option>
			<option value="누구나">누구나</option>
			<option value="하">하</option>
			<option value="중">중</option>
			<option value="상">상</option>
			<option value="상상">상상</option>
		</select>
	</div>

	<hr>
	<h2>재료</h2>
	<div class="matList">
	<input name="product_name" placeholder="예) 돼지고기" value="${product.product_name }">
	<input name="product_unit" placeholder="예) 1KG"  value="${product.product_unit }">
	<input name="product_price" placeholder="예) 10000원"  value="${product.product_price }"><br> 
	</div>
	<button type="button" class="matAdd">재료 추가</button>

	<hr>
	<h2>양념</h2>
	<div class="nonmatList">
	<input name="non_product_name" placeholder="예) 간장"  value="${product.product_name }">
	<input name="non_product_unit" placeholder="예) 500g"  value="${product.product_unit }"><br> 
	</div>
	<button type="button" class="nonmatAdd">양념 추가</button>
	
	<hr>
	<h2>요리 순서</h2>
	<div class = "cooking_order">
	<input name = "cooking_step">
	
	<img id="step_img" src="/teamProject3/images/${ step.cooking_photo_name }" width="100" alt="" >
	<input type="file" id="step_img1" name = "step_img" accept="image/*" value="${ step.cooking_content }">
	<script>  // 사진보이기
	
	$("#cooking_time").val("${ recipe.cooking_time }");
	$("#cooking_level").val("${ recipe.cooking_level }");
	
	var file1 = document.querySelector('#step_img1');

	file1.onchange = function () { 
    var fileList1 = file1.files ;
    
    // 읽기
    var reader1 = new FileReader();
    reader1.readAsDataURL(fileList1 [0]);

    //로드 한 후
    reader1.onload = function () {
        document.querySelector('#step_img').src = reader1.result ;
    	}; 
	}; 
	</script>
	</div>
	
	<button type="button" class="stepAdd" >순서 추가</button>

		 <br>
            <hr>
            <div align = "center">
				<button class = "btn pink">수정완료</button>
            </div>
	</form>	

</body>
</html>