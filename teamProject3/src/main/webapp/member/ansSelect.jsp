<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ansSelect.jsp</title>
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
<section class="breadcrumb-section set-bg" data-setbg="/teamProject3/img/KakaoTalk_20201015_173926849.jpg" style="background-image:url('/teamProject3/img/sd.jpg')"> <!-- ì¬ê¸°ìë ì´ë¯¸ì§ ê²½ë¡ë¥¼ ë°ê¾¸ìë©´ ë©ëë¤. -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2 >1:1문의 답변</h2>
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
                        <h2>답변등록</h2>
                    </div>
                </div>
            </div>
            <form method="post" action="/teamProject3/ansUpdate.do">
            <input type="hidden" name="inq_no" value="${inqOne.inq_no}">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                    	<label>문의회원</label>
                        <input type="text" id="member_id" name="member_id" placeholder="${inqOne.member_id}" readonly>
                        <input type="hidden" name="seller_code" value="${inqOne.seller_code}">
                    </div>
                    <div class="col-lg-9 col-md-9">
                    	<label>제목</label>
                        <input type="text" id="inq_title" name="inq_title" placeholder="${inqOne.inq_title}" readonly>
                    </div>
                    <div class="col-lg-12">
                    	<label>문의 온 내용</label>
                        <textarea placeholder="문의 온 내용" id="inq_content" name="inq_content" readonly>${inqOne.inq_content}</textarea>
                        <label>답변</label>
                        <c:choose>
	                        <c:when test="${not empty inqOne.inq_answer}">
		                        <textarea id="inq_answer" name="inq_answer" readonly>${inqOne.inq_answer}</textarea>
	                        </c:when>
                        	<c:when test="${empty inqOne.inq_answer}">
                        		<textarea id="inq_answer" name="inq_answer" placeholder="답변이 없습니다"></textarea>
                        	</c:when>
                        </c:choose>
                       	<div style="text-align:center">
                   			<c:if test="${empty inqOne.inq_answer}">
                       			<button type="submit" class="site-btn" style="margin : 0 20px;">답변등록</button>
                       		</c:if>
	                        <button type="button" id="btnBack" class="site-btn" style="margin : 0 20px;">뒤로가기</button>
                       	</div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Contact Form End -->
	
<script>
	btnBack.addEventListener("click", goBack);
	function goBack() {
		location.assign("/teamProject3/ansList.do");
	}
</script>


<%-- <div class="container">
	
		<form method="post" action="/teamProject3/ansUpdate.do" >
		<h1 >1:1 문의</h1>
		<hr>
		<input type="hidden" name="inq_no" value="${inqOne.inq_no}">
		<div>
			<label>문의회원</label>
			<input type="text" id="member_id" name="member_id" value="${inqOne.member_id}"readonly>
			<input type="hidden" name="seller_code" value="${inqOne.seller_code}">
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
			<textarea rows="10" cols="80" id="inq_answer" name="inq_answer" 
			 <c:if test="${not empty inqOne.inq_answer}"> readonly </c:if> placeholder="답변이 없습니다" >${inqOne.inq_answer}</textarea>
		</div>
		<button>답변등록</button>
		</form>
		<button type="button" id="btnBack">뒤로가기</button>
		
	</div> --%>
</body>
</html>