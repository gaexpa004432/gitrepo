<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberAddInsertOutput</title>
</head>
<body>
<div class="contact-form spad">
	<div class="container">
	    <div class="row">
	        <div class="col-lg-12">
	            <div class="contact__form__title">
	                <h2>${sellerStore}�� �Ǹž�ü�� ��ϵǾ����ϴ�!${cnt}!</h2>
	            </div>
	        </div>
	        <div class="col-lg-12 text-center">
	                <button type="submit" id="btnMypage" class="site-btn">mypage</button>
           	</div>
        </div>
    </div>
</div>

<script>
	btnMypage.addEventListener("click", goMypage);
	function goMypage() {
		location.assign("/teamProject3/member/myPageMenu.jsp");
	}
</script>
</body>
</html>