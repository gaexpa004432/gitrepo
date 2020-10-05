<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberAddUpdate.jsp</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 주소api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/teamProject3/api/addressApi.js"></script>

</head>
<body>
<form method="post" action="addUpdate.do">
	<div>
		<label>사업자등록번호</label>
		<input type="text" name="seller_code" value="">
	</div>
	<div>
		<label>주소</label><br>
		<input type="text" name="seller_postcode" id="sample4_postcode" placeholder="우편번호">
		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="seller_roadAddress" id="sample4_roadAddress" placeholder="도로명주소">
		<input type="text" name="seller_jibunAddress" id="sample4_jibunAddress" placeholder="지번주소">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" name="seller_detailAddress" id="sample4_detailAddress" placeholder="상세주소">
		<input type="text" name="seller_extraAddress" id="sample4_extraAddress" placeholder="참고항목">
	</div>
	<div>
		<label>사업장명</label>
		<input type="text" name="seller_store">
	</div>
	<div>
		<label>사업장 전화번호</label>
		<input type="text" name="seller_tel">
	</div>
	<div>
		<button>수정</button>	
	</div>
</form>

<button type="button" id="btnMypage">마이페이지</button>
<script>
	btnMypage.addEventListener("click", goMypage);
	function goMypage() {
		location.assign("myPage.jsp");
	}
</script>
</body>
</html>