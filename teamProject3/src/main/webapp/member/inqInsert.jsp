<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inqInsert.jsp</title>
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
<script>
$(function() {
	$("#btnBack").on("click", function() {
		window.history.back();
	})
})
</script>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="/teamProject3/img/KakaoTalk_20201015_173926849.jpg" style="background-image:url('/teamProject3/img/sd.jpg')"> <!-- ì¬ê¸°ìë ì´ë¯¸ì§ ê²½ë¡ë¥¼ ë°ê¾¸ìë©´ ë©ëë¤. -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2 >1:1문의 등록</h2>
                        <div class="breadcrumb__option">
                            <a href="/teamProject3/member/myPageMain.jsp">마이페이지</a>
                            <span>1:1문의</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>

<div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>1:1문의</h2>
                    </div>
                </div>
            </div>
            <form method="post" action="/teamProject3/inqInsert.do">
            <input type="hidden" name="inq_no" value="${inqOne.inq_no}">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                    	<label>판매자</label>
                        <input type="text" id="seller_id" name="seller_id" placeholder="${sellerInfo.member_id}" readonly>
                        <input type="hidden" name="seller_code" value="${sellerInfo.seller_code}">
                    </div>
                    <div class="col-lg-9 col-md-9">
                    	<label>제목</label>
                        <input type="text" id="inq_title" name="inq_title" placeholder="제목을 입력해주세요">
                    </div>
                    <div class="col-lg-12">
                    	<label>문의 할 내용</label>
                        <textarea placeholder="문의 할 내용" id="inq_content" name="inq_content"></textarea>
                       	<div style="text-align:center">
	                        <button type="submit" class="site-btn" style="margin : 0 20px;">문의 하기</button>
	                        <button type="button" id="btnBack" class="site-btn" style="margin : 0 20px;">뒤로가기</button>
                       	</div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Contact Form End -->




	<%-- <div class="container">
	
		
		<form method="post" action="/teamProject3/inqInsert.do" >
		<h1>1:1 문의</h1>
		<hr>
		<div>
			<label>판매자</label>
			<input type="text" id="seller_id" name="seller_id" value="${sellerInfo.member_id}"readonly>
			<input type="hidden" name="seller_code" value="${sellerInfo.seller_code}">
		</div>		
		<hr>
		<div id="text-title">
			<label>제목</label>
			<input type="text" id="inq_title" name="inq_title" size="73">
		</div>
		<hr>
		<div>
			<label>문의하실 내용</label>
		</div>
		<div>
			<textarea rows="18" cols="80" id="inq_content" name="inq_content"></textarea>
		</div>
		<hr>
		<div>
			<button>문의 등록</button>
		</div>
		</form>
		<button type="button" id="btnMypage">마이페이지</button>
		
	</div> --%>
	
<!-- <script>
	btnMypage.addEventListener("click", goMypage);
	function goMypage() {
		location.assign("/teamProject3/myPage.jsp");
	}
</script> -->
</body>
</html>