<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
 table {font-size: 20pt;}
 
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

</head>


<body>
<form action="/teamProject3/eventInsert.do" 
        method="post" enctype='multipart/form-data'>
 	
 	<h1>이벤트 등록</h1>
	<hr>
	
	<h2>이벤트 세부내용</h2>

	<div class="container" align="center">
        	<input type="hidden" value="board_write" name="command">
            <table>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="board_sub"></td>
                </tr>                

          	    <tr>
                    <td></td>
                    <td><input type = "file" name="board_file"></td>
                </tr>
                
                <tr>
                    <th>내용</th>
                    <td><textarea cols="100" rows="20" name="board_content"></textarea></td>
                </tr>
            </table>
			<br>
            <hr>
			<button class = "btn pink">등록</button>   
            <a class = "btn green" href="/teamProject3/eventBoardList.do">이벤트 목록</a>
        </form>
    </div>
</body>
</html>