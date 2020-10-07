<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/board.css">
    <style>
        td {text-align: left !important;
        }
    
        h2 {
        	text-align: center; font-size: 30px;
        } 
		th {
			width: 50px;
		}

    </style>
</head>
<body>
    <div class="container" align="center">
<form action="${pageContext.request.contextPath}/freeBoardWrite.do" 
        method="post" action="BoardServlet" enctype='multipart/form-data'>
        <h2>게시글 작성</h2>
        	<input type="hidden" value="board_write" name="command">
            <table>
                <tr>
                    <th>제목 *</th>
                    <td><input type="text" name="board_sub"></td>
                </tr>

                <tr>
                    <th>이름 *</th>
                    <td><input type="text" name="member_name"></td>
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
			
            <input class="btn1" type="submit" value="등록" align="center";>   
            <input class="btn1" type="button" value="목록으로" onclick="javascript:history.back()">
        </form>
        <br><br>
    </div>
</body>
</html>


