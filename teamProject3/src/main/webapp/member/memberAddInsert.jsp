<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberAddInsert.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 주소api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/teamProject3/api/addressApi.js"></script>

<style>
.img-fluid1 {
	max-width: 200px;
	height: auto;
	object-fit:cover;
}

.rounded-circle1 {
	 border-radius: 50% !important;  
}

#btnAddInsert {
	display: inline-block;
	font-size: 14px;
	color: #1c1c1c;
	text-transform: uppercase;
	letter-spacing: 1px;
	border: 1px solid #b2b2b2;
	padding: 14px 20px 12px;
	border-radius: 25px;
}

#btnAddInsert:hover {
	background-color: #caccd1;
}

#btnAddInsert:active {
	background-color: #f3f4f7;
}

input[type="button"]{
	margin : 45px 0 0 0;
	width : 100%;
	display: inline-block;
	font-size: 14px;
	color: #1c1c1c;
	text-transform: uppercase;
	letter-spacing: 1px;
	border: 1px solid #b2b2b2;
	padding: 14px 20px 12px;
	border-radius: 25px;
}
input[type="button"]:hover {
  background-color: #caccd1;
}

input[type="button"]:active {
  background-color: #f3f4f7;
}
</style>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="/teamProject3/img/KakaoTalk_20201015_173926849.jpg" style="background-image:url('/teamProject3/img/sd.jpg')"> <!-- ì¬ê¸°ìë ì´ë¯¸ì§ ê²½ë¡ë¥¼ ë°ê¾¸ìë©´ ë©ëë¤. -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>판매자로 등록</h2>
                        <div class="breadcrumb__option">
                            <a href="/teamProject3/">My Page</a>
                            <span >판매자로 등록</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<section class="checkout spad">
 <%@include file="/member/myPageMenu.jsp" %>
   <div class="col-lg-8 col-md-7"> 
        <div class="container">
            <div class="checkout__form">
                <h4>판매자로 등록</h4>
                <form method="post" name="frm" id="frm" 
		  			  action="/teamProject3/addInsert.do" 
		 			  onsubmit="return inputCheck()">
                    <div class="row">
                        <div class="col-lg-12 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>사업자 등록번호<span>*</span></p>
                                        <input type="text" name="seller_code" placeholder="사업자 등록번호">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                            	<div class="col-lg-6">
		                            <div class="checkout__input">
		                                <p>주소<span>*</span></p>
		                                <input type="text" name="seller_postcode" id="sample4_postcode" placeholder="우편번호" 
		                                	   class="checkout__input__add" readonly>
		                            </div>
		                        </div>  
		                        <div class="col-lg-4">  
		                            <div class="checkout__input">
		                            	<input type="hidden" class="checkout__input__add">
		                                <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
		                            </div>
		                        </div>
		                    </div>  
		                    <div class="row"> 
		                    	<div class="col-lg-4">  
		                            <div class="checkout__input">
		                                <input type="text" name="seller_roadAddress" id="sample4_roadAddress" placeholder="도로명주소" readonly>
		                            </div>
		                        </div>  
		                        <div class="col-lg-4">  
		                            <div class="checkout__input">
		                                <input type="hidden" name="seller_jibunAddress" id="sample4_jibunAddress" placeholder="지번주소" readonly>
		                                <span id="guide" style="color:#999;display:none"></span>
		                                <input type="text" name="seller_detailAddress" id="sample4_detailAddress" placeholder="상세주소">
		                            </div>
	                        	</div>
	                        	<div class="col-lg-4">  
		                            <div class="checkout__input">
		                                <input type="text" name="seller_extraAddress" id="sample4_extraAddress" placeholder="참고항목" readonly>
		                            </div>
	                        	</div>
	                        </div>   
                            <div class="row">
                            	<div class="col-lg-6">
                            		<div class="checkout__input">
                                		<p>판매처 이름<span>*</span></p>
                                		<input type="text" name="seller_store" placeholder="판매처 이름">
                            		</div>
                            	</div>
                            	<div class="col-lg-6">
                            		<div class="checkout__input">
                                		<p>판매처 전화번호<span>*</span></p>
                                		<input type="text" name="seller_tel" placeholder="판매처 전화번호">
                            		</div>
                            	</div>
                            </div>
                        </div>
                        <div class="col-lg-12" style="text-align:center; ">
							<button id="btnAddInsert" style="width:40%; float:left;">등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>                                                   
</section>	
</body>
</html>