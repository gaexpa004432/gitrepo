<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/board.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<style>
	html {
  font: 300 100%/1.5 Ubuntu, sans-serif;
  color: #333;
  overflow-x: hidden;
}
h2 {
  margin: 0;
  color: #8495a5;
  font-size: 25px;
  font-weight: 300;
  font-family: 'Noto Sans KR';
}
#contact-form {
  max-width: 1208px;
  max-width: 75.5rem;
  margin: 0 auto;
}
#contact, label, input[name="submit"] {
  position: relative;
}
label > span, input, textarea, button {
  box-sizing: border-box;
}
label {
  display: block;
}
label > span {
  display: none;
}
input, textarea, button{
 
  padding: 0.4em;
  border: none;
  font: 300 100%/1.2 Ubuntu, sans-serif;
  }

input[type="text"], input[type="email"], textarea {
  margin: 0 0 1em;
  border: 1px solid #ccc;
  outline: none;
}
input.invalid, textarea.invalid {
  border-color: #d5144d;
}
textarea {
  height: 6em;
}
input[type="submit"], button {
  background: #a7cd80;
  color: #333;
}
input[type="submit"]:hover, button:hover {
  background: #91b36f;
}


input[type="button"], button {
  background: #a7cd80;
  color: #333;
}
input[type="button"]:hover, button:hover {
  background: #91b36f;
}

@media screen and (min-width: 30em) {
  #contact-form h2 {
    margin-left: 26.3736%;
    font-size: 2em;
    line-height: 1.5;
  }
  label > span {
    vertical-align: top;
    display: inline-block;
    width: 9.3736%;
    padding: 0.5em;
    border: 1px solid transparent;
    text-align: right;
    font-family: 'Noto Sans KR';
  }
  .css{
    width: 60.6263%;
    line-height: 1.5;
    font-family: 'Noto Sans KR';
  }
  textarea {
    height: 20em;
  }
  input[type="submit"], button {
    margin-left: 8.3736%;
    width: 7%;
    height: 4.3%;
  }
  input[type="button"], button {
    margin-left: 1.3736%;
    width: 7%;
    height: 4.3%;

  }
  
}
@media screen and (min-width: 48em) {
  #contact-form {
    text-align: justify;
    line-height: 0;
  }
  #contact-form:after {
    content: '';
    display: inline-block;
    width: 100%;
  }
  #contact-form h2 {
    margin-left: 17.2661%;
  }
  #contact-form form, #contact-form aside {
    vertical-align: top;
    display: inline-block;
    width: 65.4676%;
    text-align: left;
    line-height: 1.5;
  }
  #contact-form aside {
    width: 30.9353%;
  }
}

.hero__search__form form button{
width: 110px;
font-size: 12px;
    color: #ffffff;
    font-weight: 800;
    text-transform: uppercase;
    display: inline-block;
    padding: 13px 30px 12px;
    background: #7fad39;
    border: none;
}
  
	</style>
	  <script type="text/javascript">
    $(function(){
    	$(".btn1").on("click",function(){
    		location.href="/teamProject3/qaBoardList.do";
    		});
    })
    </script>
</head>
<body>
	<div class="container" align="center">
<form name="contact" id="contact" action="${pageContext.request.contextPath}/qaBoardWrite.do"
	method="post" enctype='multipart/form-data'>
<!-- form태그안에 있는 데이터를 보내는 기능  -->
	<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의글 작성</h2>
	<br>
		<input type="hidden" value="aqBoard_write" name="command"/>
		<label><span>제목</span><input class="css" name="board_sub" type="text" placeholder="Sub" required/></label>
  <label style="vertical-align:center"><span style="margin-left:-700px">&nbsp;비밀글여부</span><input style="margin-top:15px" name="board_passyn" type="checkbox"/></label>
     <label><span>첨부파일</span><input class="css" name="board_file" type="file" placeholder="File"/></label>
    <label><span>내용</span><textarea class="css" name="board_content" placeholder="Content" required></textarea></label>
   
	<!-- 	<table>
			<tr>
				<th>제목*</th>
				<td><input type="text" name="qaboard_sub" required></td>
			</tr>
			<tr>
				<th>비밀글여부</th>
				<td><input type="checkbox" name="qaboard_passyn"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="file" name="qaboard_file"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols="100" rows="20" name="qaboard_content" required></textarea></td>
			</tr>
		</table>	
		<br> -->
		
		<input class="btn" type="submit" value="등록" align="center";>
		<input class="btn1" type="button" value="목록으로"/>
		</form>
		<br><br>
	</div>
</body>
</html>