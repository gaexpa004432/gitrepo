<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<title>Insert title here</title>

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

	<h1>레시피 등록</h1>
	<br>

	<img id="preview" src="" width="700" alt="">
 	<input type="file" id="getfile" accept="image/*"> 

	<script>
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


	<c:forEach items="${list}" var="productlist">
			<select>
				<option>${productlist.getProduct_name()}</option>
			</select>
	</c:forEach>

	<br>
	<textarea name="textarea" style="width: 100% rows=" 10" id="textarea" 
			text-align:center>레시피를 입력하세요
	</textarea>
	<br>

	<p class="p1">
	<hr>
	</p>
	<form name="frm1">
		<input type="button" value="새로운 재료 추가"
			onclick="input_append(this.form)">
		<div id="append"></div>

		<input type="button" value="재료 확인"
			onclick="input_result(this.form)">
	</form>

	<br>
	<button>등록</button>
</body>
</html>