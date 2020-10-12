<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
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
	$(function(){           //비매품 이름 단위 적는 곳 추가~!!!
		
		$(".nonmatAdd").on("click",function(){
			$(".nonmatList").append($("<div>")
					.append($("<input>").attr("name","product_name"))
					.append($("<input>").attr("name","product_unit"))
					.append($("<button>").attr("type","button").text("삭제").on("click",function(){
						$(this).parent().remove();
					}))
					.append($("<br>")));		
			})	
	})
	function textarea() { 
		
		if(frm.recipe_content.value == "") {
			frm.recipe_content.focus();
			return false;
		}
	}
</script>

</head>


<body>
<form name="frm1" action ="/teamProject3/recipeInsert.do" enctype='multipart/form-data' method = "post">
	<h1>레시피 등록</h1>

	<label>메뉴 이름</label>
	<input  type="text" name="recipe_name" id="recipe_name">
	<br>
	
	
	<img id="main_img" src="" width="300" alt="">
	<input type="file" id="getfile" name = "main_img" accept="image/*">


<script>  // 사진보이기
	var file = document.querySelector('#getfile');

	file.onchange = function () { 
		
    var fileList = "" ;
    fileList = file.files;
    console.log(fileList);
    
    // 읽기
    var reader = new FileReader();
    reader.readAsDataURL(fileList [0]);

    //로드 한 후
    reader.onload = function () {
        document.querySelector('#main_img').src = reader.result ;
    }; 
}; 

</script>
	
	
	<hr>
	<br>
	<h2>간단한 소개글1</h2>

	<br>
	<textarea name="recipe_content" style="width: 100% rows=" 10" id="recipe_content"
			placeholder = "간단한 소개글을 적어주세요">
	</textarea>
	<br>
	<hr>
	<h2>요리 정보</h2>
	<div>
	<span class = "time">시간</span>
		<select name = "cooking_time" text = "조리시간">
			<option value>시간</option>
			<option value="5분이내">5분이내</option>
			<option value="10분이내">10분이내</option>
			<option value="30분이내">30분이내</option>
			<option value="1시간이내">1시간이내</option>
			<option value="1시간30분이내">1시간30분이내</option>
			<option value="2시간이내">2시간이내</option>
			<option value="4시간이내">4시간이내</option>
		</select>	
		<span class = "level">난이도</span>
		<select name = "cooking_level" text = "난이도">
			<option value>난이도</option>
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
	<input name="product_name" placeholder="예) 돼지고기">
	<input name="product_unit" placeholder="예) 1KG">
	<input name="product_price" placeholder="예) 10000원"><br> 
	</div>
	<button type="button" class="matAdd">추가</button>
	
	<hr>
	<h2>그외 재료</h2>
	<div class="nonmatList">
	<input name="non_product_name" placeholder="예) 간장">
	<input name="non_product_unit" placeholder="예) 500g"><br> 
	</div>
	<button type="button" class="nonmatAdd">추가</button>
	
	<hr>
	<h2>요리 순서</h2>
	<div class = "cooking_order">
	<input name = "cooking_step">
	
	<img id="step_img" src="" width="100" alt="">
	<input type="file" id="step_img1" name = "step_img" accept="image/*">
	<script>  // 사진보이기
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
	
	<hr>
	<button class = "btn pink">등록</button>
	<a class = "btn green" href="/teamProject3/recipe/productInsert.jsp">새로운재료추가</a>
	
	</form>
</body>
</html>