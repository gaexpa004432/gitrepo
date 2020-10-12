<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2>레시피 수정</h2>  
	
	<form action = "/teamProject3/eventUpdate.do" method="post" name="frm" id="frm"
		  enctype='multipart/form-data'
		  onsubmit="return eventCheck()">
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