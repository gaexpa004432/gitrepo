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

div {
    color: red;
  }
  
#drow {
	background-color: white;
	border: 1px solid purple;
	border-radius: 10px;
	display: inline-block;
	font: inherit;
	line-height: 1.5em;
	padding: 0.5em 3.5em 0.5em 1em;
	margin: 0;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-appearance: none;
	-moz-appearance: none;
	background-image: linear-gradient(45deg, transparent 50%, gray 50%),
		linear-gradient(135deg, gray 50%, transparent 50%),
		radial-gradient(#ddd 70%, transparent 72%);
	background-position: calc(100% - 20px) calc(1em + 2px),
		calc(100% - 15px) calc(1em + 2px), calc(100% - .5em) .5em;
	background-size: 5px 5px, 5px 5px, 1.5em 1.5em;
	background-repeat: no-repeat;
}
</style>

<script>
	function textarea() { 
		
		if(frm.recipe_content.value == "") {
			window.alert("레시피 입력하세요");
			frm.recipe_content.focus();
			return false;
		}
</script>

<script LANGUAGE="JavaScript">   //새로운 재료 기입란
	cnt=0;
	
	function input_append(ff){
 		 cnt++;
 		 app = document.getElementById("append");
  		  app.innerHTML += cnt + " : <input type=text name=txt><br>"; 
  		
		}

	function input_result(ff){
  		var str = "";
  		if(cnt == 1){
   			 str = ff.txt.value;
 		 } else {
   		 for (i = 0; i < cnt; i++){
     		 str += ff.txt[i].value + " | ";
    	}
  	}
  		alert(str);
}
</script>

</head>


<body>
<form name="frm1" action ="recipeInsert.do">
	<h1>레시피 등록</h1>

	<label>메뉴 이름</label>
	<input  type="text" name="recipe_name" id="recipe_name">
	
	<label>회원 ID</label>
	<input  type="text" name="member_id" id="member_id">
	
	<hr>
	<br>
	<h2>레시피</h2>
	<img id="preview" src="" width="700" alt="">
	<input type="file" id="getfile" accept="image/*">

	<script>  // 사진보이기
	var file = document.querySelector('#getfile');

	file.onchange = function () { 
    var fileList = file.files ;
    
    // 읽기
    var reader = new FileReader();
    reader.readAsDataURL(fileList [0]);

    //로드 한 후
    reader.onload = function () {
        document.querySelector('#preview').src = reader.result ;
    }; 
}; 

 </script>

	<br>
	<textarea name="recipe_content" style="width: 100% rows=" 10" id="recipe_content"
		text-align:center onclick="this.value=''">레시피를 입력하세요
	</textarea>
	<br>

	<hr>

	<h2>재료</h2>
	<select id="drow" multiple="multiple">  <!-- multiple="multiple" selected="selected"-->
		<option value="" >재료 선택</option>
		<c:forEach items="${list}" var="productlist">
			<option value="${productlist.product_name}" selected="selected">${productlist.product_name}</option>
		</c:forEach>
	</select>
	
	<input id="input" name = "recipe_content"></input>
	<br>


 	<script>            //다중선택 한 값 출력
		$( "select" ).change(function () {
   	 var str = "";
 		 $( "select option:selected" ).each(function() {
      		str += $( this ).text() + " ";
  		  });
  	  $( "#input" ).text( str );
 		 })
 	 .change();

	</script> 

	<p class="p1">
	<hr>
	</p>
	
		<input type="button" value="새로운 재료 추가" name = "recipe_content"
			onclick="input_append(this.form)">
		<div id="append"></div>
		<input type="button" value="재료 확인" onclick="input_result(this.form)">
		<br>
		
	<hr>
	<button>등록</button>
	
	</form>
</body>
</html>