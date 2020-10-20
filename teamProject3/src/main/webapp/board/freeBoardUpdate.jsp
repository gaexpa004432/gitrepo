<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/common/common.css">
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
 <style>
div, button {
	font-family: 'Noto Sans KR';
}

.updateFrm { 
        max-width: 1208px;
  		max-width: 75.5rem;
  		margin-left: 30.3736%;
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
 </style>
 <script>
 
 </script>
</head>
<body>
<form name="contact" id="contact" action="freeBoardUpdate2.do" method="post" class="updateFrm"
		enctype="multipart/form-data">
		<input type="hidden" name="board_no" value="${content.board_no}"/>
		<div>
			<label>제목</label> 
			<input type="text" name="board_sub" value="${content.board_sub}"/>
		</div>
		
		<%-- <div>
			<label>아이디</label> 
			<input type="text" name="id" value="${freeboard.board_id}"/>
		</div> --%>
		<br>
		<div>
			<label>내용</label>
			<textarea name="board_content" rows="5" cols="50" >${content.board_content}</textarea>
			
		</div>
	
	
		
		<div class="row" align="center" style="margin-left:22%">
			<button>수정</button>
			<button>취소</button>
		</div>
	</form>
	<br><br><br>
</body>
</html>