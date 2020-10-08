<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberAddInsertOutput</title>
</head>
<body>
	${cnt}건 등록
	${sellerStore}의 판매업체가 등록되었습니다.<br>
	<input type="button" id="btnMypage" value="마이페이지로 가기">

	<script>
	btnMypage.addEventListener("click", goMypage);
	function goMypage() {
		location.assign("/teamProject3/member/myPage.jsp");
	}
</script>
</body>
</html>