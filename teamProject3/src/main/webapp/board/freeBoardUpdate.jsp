<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="freeBoardUpdate2.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="no" value="${content.board_no}"/>
		<div>
			<label>제목</label> 
			<input type="text" name="sub" value="${content.board_sub}"/>
		</div>
		<%-- <div>
			<label>아이디</label> 
			<input type="text" name="id" value="${freeboard.board_id}"/>
		</div> --%>
		<br>
		<div>
			<label>내용</label>
			<textarea name="contents" >
			${content.board_content}</textarea>
			
		</div>
	
	
		
		<div>
			<button>수정</button>
		</div>
		<br>
		<div>
			<button>취소</button>	
		</div>
	</form>
</body>
</html>