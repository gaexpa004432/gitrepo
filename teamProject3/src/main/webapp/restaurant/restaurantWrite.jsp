<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
</script>
<title>주소 입력 샘플</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/teamProject3/api/addressApi.js"></script>
</head>
<body>
<form name="form" id="form" method="post" align="center">

<div><input name="res_name" style="width:40%" placeholder="식당명 입력"></div><br>

	<div><input name="res_tel" style="width:40%" placeholder="전화번호 등록"> </div><br>
	
	<div>
		<input type="text" id="sample4_postcode" placeholder="우편번호" style="width:31%">
		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample4_roadAddress" placeholder="도로명주소" style="width:20%">
		<input type="text" id="sample4_jibunAddress" placeholder="지번주소" style="width:20%">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" placeholder="상세주소" hidden>
		<input type="text" id="sample4_extraAddress" placeholder="참고항목" hidden>
	
	</div>
<input>
	<textarea cols="100" rows="150" name="res_content"></textarea>
	
	
</form>
</body>
</html>