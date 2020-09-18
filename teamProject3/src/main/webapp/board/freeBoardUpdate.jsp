<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="freeBoardUpdate.do" method="post"
		enctype="multipart/form-data">
		<div>
			<label>제목</label> 
			<input type="text" name="sub" value="${board.board_sub}" />
		</div>
		<div>
			<label>이름</label> 
			<input type="text" name="id" value="${board.member_name}"/>
		</div>
		
		<div>
			<label>내용</label>
			<textarea name="contents" >${freeboard.board_contents}</textarea>
		</div>
		<div>
			<button>등록</button>
		</div>
	</form>
</body>
</html>