<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
  width: 100%;
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
  input, textarea, button {
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
    height: 4.5%;
  }
  input[type="button"], button {
    margin-left: 1.3736%;
    width: 7%;
    height: 4.5%;
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
width: 115px;
font-size: 12px;
    color: #ffffff;
    font-weight: 800;
    text-transform: uppercase;
    display: inline-block;
    padding: 13px 30px 12px;
    background: #7fad39;
    border: none;}
    </style>
    <script type="text/javascript">
    $(function(){
    	$(".button").on("click",function(){
    		location.href="/teamProject3/eventBoardList.do";
    		});
    })
    </script>
</head>
<body>
<div class="container" align="center">
<form name="contact" id="contact" action="${pageContext.request.contextPath}/eventInsert.do" 
        method="post" enctype='multipart/form-data'>
 	
 <!-- 	<h1>이벤트 등록</h1>
	<hr> -->
	
	<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이벤트  등록</h2>
	<br>
	
        	<input type="hidden" value="board_write" name="command"/>
        	    <label><span>제목</span><input name="board_sub" type="text" placeholder="Sub" required></label>
    <label><span>내용</span><textarea name="board_content" placeholder="Content" required></textarea></label>
    
    <label><span>배너등록</span><input name="board_banner" type="file" placeholder="File"/></label>
    <label><span>첨부파일</span><input name="board_file" type="file" placeholder="File"/></label>
  <!--   <input name="submit" type="submit" value="등록"/> -->
    <input class="submit" type="submit" value="등록" align="center"/> 
    <input class="button" type="button" value="목록으로" />
  </form>
  <br><br><br>
</section>
            
            
            
            
       <!--      <table>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="board_sub"></td>
                </tr>                

          	    <tr>
                    <td>배너 등록 : <input type = "file" name="board_banner"></td>
                    <td>내용 등록 : <input type = "file" name="board_file"></td>
                </tr>
                
                <tr>
                    <th>내용</th>
                    <td><textarea cols="100" rows="20" name="board_content" required></textarea></td>
                </tr>
            </table>
			<br>
            <hr>
			<button class = "btn pink">등록</button>   
            <a class = "btn green" href="/teamProject3/eventBoardList.do">이벤트 목록</a>
        </form> -->
    </div>
</body>
</html>