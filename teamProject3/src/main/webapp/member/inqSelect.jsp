<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inqSelect.jsp</title>
<style>
.container {
	display : block;
	margin: 0 auto;
}


#text-title {
	display : inline-block;
		
}

#inq_title {
	/* background-color : red; */
	
}
</style>
</head>


<body>
	<div class="container">
	
		<form method="post" action="inqInsert.do" >
		<h1 >1:1 문의</h1>
		<hr>
		<div>
			<label>판매자</label>
			<input type="text" id="seller_id" name="seller_id" value="${sellerInfo.member_id}"readonly>
			<input type="hidden" name="seller_code" value="${sellerInfo.seller_code}">
		</div>
		<hr>
		<div id="text-title">
			<label>제목</label>
			<input type="text" id="inq_title" name="inq_title" size="73" 
			 value="${inqOne.inq_title}"readonly>
		</div>		
		<hr>
		<div>
			<label>문의하신 내용</label>
		</div>
		<div>
			<textarea rows="18" cols="80" id="inq_content" name="inq_content" 
			 readonly placeholder="문의내용">${inqOne.inq_content}</textarea>
		</div>
		<hr>
		<div>
			<label>답변</label>
		</div>
		<div>
			<textarea rows="10" cols="80" id="inq_content" name="inq_content" 
			 readonly placeholder="답변이 없습니다"></textarea>
		</div>
		</form>
		<button type="button" id="btnBack">뒤로가기</button>
		
	</div>
	
<script>
	btnBack.addEventListener("click", goBack);
	function goBack() {
		location.assign("inqList.do");
	}
</script>
</body>
</html>