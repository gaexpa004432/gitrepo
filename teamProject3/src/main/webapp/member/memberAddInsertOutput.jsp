<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberAddInsertOutput</title>
</head>
<body>
	${cnt}�� ���
	${sellerStore}�� �Ǹž�ü�� ��ϵǾ����ϴ�.<br>
	<input type="button" id="btnMypage" value="������������ ����">

	<script>
	btnMypage.addEventListener("click", goMypage);
	function goMypage() {
		location.assign("/teamProject3/member/myPage.jsp");
	}
</script>
</body>
</html>