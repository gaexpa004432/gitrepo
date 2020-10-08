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
    
    #title{
            height : 16;
            font-family :'돋움';
            font-size : 12;
            text-align :center;
        }
</style>

<script>
	
  function eventCheck() {

	        if(frm.board_sub.value == "") {
	            window.alert("제목 적고 가라");
	            frm.board_sub.focus();
	            return false;
	        }
	    
	        if(frm.board_content.value == "") {
	            window.alert("내용 안적을랍니까");
	            frm.board_content.focus();
	            return false;
	        }
	        
	        if(frm.board_file.value == "") {
	            window.alert("파일 올리라");
	            frm.board_file.focus();
	            return false;
	        } else {
	        	window.alert("등록할랑교~");
	            return true;
	        }
	    }
	</script>

</head>
<body>
	<h2>이벤트 수정</h2>  
	
	<form action = "/teamProject3/eventUpdate.do" method="post" name="frm" id="frm"
		  enctype='multipart/form-data'
		  onsubmit="return eventCheck()" >
		  <input type="hidden" name="board_no" value="${board.board_no}">
	  <table>
                <tr>
                    <th>이벤트 제목 </th>
                    <td><input type="text" name="board_sub" value="${board.board_sub}"></td>
                </tr>
               
                <tr>
                    <th>이벤트 내용</th>
                    <td><textarea cols="100" rows="20" name="board_content">${board.board_content}</textarea></td>
                </tr>
                
            	<tr>
                    <td></td>
                    <td><input type = "file" name="board_file"></td>
                </tr>
			
            </table>
		 
		 <br>
            <hr>
            <div align = "center">
				<button class = "btn pink">수정완료</button>
            </div>
	</form>	



</body>
</html>