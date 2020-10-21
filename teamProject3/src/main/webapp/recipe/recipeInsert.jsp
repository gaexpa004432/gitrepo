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
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<script>
	$(function(){           //조리 순서 추가
	
	$(".stepAdd").on("click",function(){
		$(".cooking_order").append($("<div>")
				.append($("<input>").attr("name","cooking_step").css("width","300px").css("height","100px"))
				.append($("<img>").css("width","150px").css("height","100px").attr("class","step_img"))
				.append($("<input>").attr("type","file").attr("name","step_img1").attr("class","step_img1"))
				.append($("<span>"))
				.append($("<img>").attr("type","img").attr("src", "/teamProject3/images/휴지통.png")
								  .attr("width", "30px").attr("height", "30px").on("click",function(){
					$(this).parent().remove();
				}))
				.append($("<br>")));		
	})
})

//====================================================================================================
	
$(function(){           //상품이름 단위 가격 적는 곳 추가~!!!
		$(".matAdd").on("click",function(){
			
			var seller = ""
			if(${sessionScope.login.seller_code != 0}){
				seller = $("<input>").attr("name","product_price").attr("placeholder", "예) 10000");				
			}
			$(".matList").append($("<div>")
					.append($("<input>").attr("name","product_name").attr("placeholder", "예) 오이"))
					.append($("<input>").attr("name","product_unit").attr("placeholder", "예) 10kg"))
					.append(seller)
					.append($("<img>").attr("type","img").attr("src", "/teamProject3/images/휴지통.png")
								  .attr("width", "30px").attr("height", "30px").on("click",function(){
						$(this).parent().remove();
					}))
					.append($("<br>")));		
		})	
	})
//===================================================================================================
	
	$(function(){           //비매품이름 단위  적는 곳 추가~!!!
		
		$(".nonmatAdd").on("click",function(){
			$(".nonmatList").append($("<div>")
					.append($("<input>").attr("name","non_product_name").attr("placeholder", "예) 초장"))
					.append($("<input>").attr("name","non_product_unit").attr("placeholder", "예) 1kg"))
					.append($("<img>").attr("type","img").attr("src", "/teamProject3/images/휴지통.png")
								  .attr("width", "30px").attr("height", "30px").on("click",function(){
						$(this).parent().remove();
					}))
					.append($("<br>")));		
		})	
	})
	
//===================================================================================================
	
	function textarea() { 
		
		if(frm.recipe_content.value == "") {
			window.alert("소개글을 적어주세요!!!");
			frm.recipe_content.focus();
			return false;
		}
	}
	
//===================================================================================================
		
 	$(function () {     //로그인 된 회원종류에 따라 다른 레시피 등록창이 보임
 		console.log(${ sessionScope.login.seller_code})
		if (${!empty sessionScope.login.seller_code} && ${ sessionScope.login.seller_code != 0}) {
			$(".product_price").show();		
		} else {
			$(".product_price").hide(); 
		}
 	
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
	})	
	 
</script>
 <style>
      .container {
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
<%@include  file="/common/recipe.jsp" %>
<div class="container">
<form name="frm1" action ="/teamProject3/recipeInsert.do" enctype='multipart/form-data' method = "post">
<div class="container" align="left">
	
	<h2  align = "left" style = "margin-top:50px" >레시피 등록</h2><br>
	<hr>
	<div class="row">
	<div class="col-sm-6">
	<br>
	<h3  style = "color:#9ACD32; font-family: Fantasy;">레시피 이름</h3><br>
	<br>
	<input  type="text" name="recipe_name" id="recipe_name" style="width:50%">
	<br>
	</div>
	<div class="col-sm-6">
	<br>
	<h3  style = "color:#9ACD32; font-family: Fantasy;">레시피 사진</h3><br>
	<img id="main_img" width="200" alt="">
	<input type="file" id="getfile" name = "main_img" accept="image/*" style="padding:8px;width:80%">
</div>
</div>
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
</div>

	<hr>
	<br>
	<h3 class="container" style = "color:#9ACD32; font-family: Fantasy;" align="center">레시피 소개글</h3>
	<br>

	<div class="row">
	<div class="col-sm-12" align="center">
	<textarea name="recipe_content" placeholder="간단한 소개글을 적어주세요"
			  style= "height:100px; width:610px;"></textarea>
	</div>
	</div>
	<br>
	<hr>
	
	<h3 class="container" style = "color:#6B8E23; font-family: Fantasy;">요리 정보</h3><br>
	<div class="container">
	<span class = "time" >시간</span>
		<select name = "cooking_time">
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
		<span class = "level" >난이도</span>
		<select name = "cooking_level">
			<option value="난이도" style="background : #AAFA82">난이도(필수)</option>
			<option value="누구나" style="background : #9BFA73">누구나</option>
			<option value="하" style="background : #82EB5A">하</option>
			<option value="중" style="background : #78E150">중</option>
			<option value="상" style="background : #6ED746">상</option>
			<option value="상상" style="background : #64CD3C">상상</option>
		</select>
	</div>

	<hr>
	<h3 class="container" style = "color:#6B8E23; font-family: Fantasy;">재료</h3><br>
	<div class="matList container">
	<input name="product_name" placeholder="예) 돼지고기">
	<input name="product_unit" placeholder="예) 1KG">
	<input class="product_price" name="product_price" placeholder="예) 10000원">
	<img style="visibility:hidden;" src="/teamProject3/images/휴지통.png" width="30px" height="30px" />
	</div>
	
	<div class="row">
	<div class="col-sm-12" align="center">
	<button type="button" class="matAdd site-btn">재료 추가</button>
	</div>
	</div>

	<hr>
	<h3 class="container" style = "color:green; font-family: Fantasy;">양념</h3><br>
	<div class="nonmatList container">
	<input name="non_product_name" placeholder="예) 간장">
	<input name="non_product_unit" placeholder="예) 500g">
	<img style="visibility:hidden;" src="/teamProject3/images/휴지통.png" width="30px" height="30px" />
	</div>
	
	<div class="row">
	<div class="col-sm-12" align="center">
	<button type="button" class="nonmatAdd site-btn"">양념 추가</button><br><br>
	</div>
	</div>

	<hr>
	<h3 class="container" style = "color:green; font-family: Fantasy;">조리 순서</h3><br>
	<div class = "cooking_order, container">
	<div>
	<input style="width:300px;height:100px" name = "cooking_step">
	<img id="step_img"  alt="" style="width:150px;height:100px">
	<input type="file" id="step_img1" class="step_img1" name = "step_img" accept="image/*" style="padding:8px;width:250px">
	<img style="visibility:hidden;" src="/teamProject3/images/휴지통.png" width="30px" height="30px" />
	<div class="cooking_order"></div>
	</div>
	
	</div>
	<div class="row">
	<div class="col-sm-12" align="center">
	<button type="button" class="stepAdd site-btn">순서 추가</button>
	</div>
	</div>
	<hr>
	<div class="blog__item__text, container">
	<button class="site-btn">등록</button>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a class="site-btn" href="/teamProject3/recipeBoard.do" >레시피 목록</a>
	</div>
	</form>
              </div>                    
</body>
</html>