<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberAddUpdate.jsp</title>

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

#btnUpdate {
	display: inline-block;
	font-size: 14px;
	color: #1c1c1c;
	text-transform: uppercase;
	letter-spacing: 1px;
	border: 1px solid #b2b2b2;
	padding: 14px 20px 12px;
	border-radius: 25px;
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
<section class="checkout spad">
 <%@include file="/member/myPageMenu.jsp" %>
   <div class="col-lg-8 col-md-7"> 
        <div class="container">
            <div class="checkout__form">
                <h4>판매자로 등록</h4>
                <form method="post" name="frm" id="frm" 
		  			  action="/teamProject3/addUpdate.do" 
		 			  onsubmit="return inputCheck()">
                    <div class="row">
                        <div class="col-lg-12 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>사업자 등록번호<span>*</span></p>
                                        <input type="text" name="seller_code" value="${sessionScope.login.seller_code}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                            	<div class="col-lg-6">
		                            <div class="checkout__input">
		                                <p>주소<span>*</span></p>
		                                <input type="text" name="seller_postcode" id="sample4_postcode" 
		                                value="${sessionScope.login.seller_postcode}" class="checkout__input__add" readonly>
		                            </div>
		                        </div>  
		                        <div class="col-lg-4">  
		                            <div class="checkout__input">
		                            	<input type="hidden" class="checkout__input__add" >
		                                <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
		                            </div>
		                        </div>
		                    </div>  
		                    <div class="row"> 
		                    	<div class="col-lg-4">  
		                            <div class="checkout__input">
		                                <input type="text" name="seller_roadAddress" id="sample4_roadAddress" 
		                                	   value="${sessionScope.login.seller_roadAddress}" readonly>
		                            </div>
		                        </div>  
		                        <div class="col-lg-4">  
		                            <div class="checkout__input">
		                                <input type="hidden" name="seller_jibunAddress" id="sample4_jibunAddress" placeholder="지번주소" readonly>
		                                <span id="guide" style="color:#999;display:none"></span>
		                                <input type="text" name="seller_detailAddress" id="sample4_detailAddress" 
		                                	   value="${sessionScope.login.seller_detailAddress}">
		                            </div>
	                        	</div>
	                        	<div class="col-lg-4">  
		                            <div class="checkout__input">
		                                <input type="text" name="seller_extraAddress" id="sample4_extraAddress" 
		                                	   value="${sessionScope.login.seller_extraAddress}" readonly>
		                            </div>
	                        	</div>
	                        </div>   
                            <div class="row">
                            	<div class="col-lg-6">
                            		<div class="checkout__input">
                                		<p>판매처 이름<span>*</span></p>
                                		<input type="text" name="seller_store" value="${sessionScope.login.seller_store}">
                            		</div>
                            	</div>
                            	<div class="col-lg-6">
                            		<div class="checkout__input">
                                		<p>판매처 전화번호<span>*</span></p>
                                		<input type="text" name="seller_tel" value="${sessionScope.login.seller_tel}">
                            		</div>
                            	</div>
                            </div>
                        </div>
                        <div class="col-lg-12" style="text-align:center; ">
							<button id="btnUpdate" style="width:40%; float:left;">수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>                                                   
</section>	
</body>
</html>