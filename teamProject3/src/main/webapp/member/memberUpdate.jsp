<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Jquery -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->

<!-- 주소api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/teamProject3/api/addressApi.js"></script>

<title>memberUpdate.jsp</title>
<style>
.img-fluid1 {
	max-width: 200px;
	height: auto;
	object-fit:cover;
}

.rounded-circle1 {
	 border-radius: 50% !important;  
}

input[type="radio"],
input[type="checkbox"] {
  font-size:10px;
  width:30px; height:30px;
  margin: 0 10px 10px 0;
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

#btnUpdate:hover {
	background-color: #caccd1;
}

#btnUpdate:active {
	background-color: #f3f4f7;
}
.filebox label {
	  display: inline-block;
	  padding: 14px 20px 12px;
	  /* color: #fff; */
	  font-size: inherit;
	  line-height: normal;
	  vertical-align: middle;
	  background-color: #EFEFEF;
	  cursor: pointer;
	  border: 1px solid #b2b2b2;
	  border-radius: 25px;
	  text-transform: uppercase;
	  letter-spacing: 1px;
	  -webkit-transition: background-color 0.2s;
	  transition: background-color 0.2s;
}

.filebox label:hover {
  	background-color: #caccd1;
}

.filebox label:active {
  	background-color: #f3f4f7;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>
<script>
$(function() {
	if("${errormsg}" != "") {
		alert("${errormsg}");
	};
	
	$("#member_image").on("change", handleImgFileSelect);
	
});

function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#image_preview").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });
}

function inputCheck() {
	
	if(frm.member_newPass.value != frm.member_newPassCk.value) {
		alert("새 비밀번호가 일치하지 않습니다");
		frm.member_newPass.focus();
		return false;
	}
	return true;
	
}
</script>

</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="/teamProject3/img/KakaoTalk_20201015_173926849.jpg" style="background-image:url('/teamProject3/img/sd.jpg')"> <!-- ì¬ê¸°ìë ì´ë¯¸ì§ ê²½ë¡ë¥¼ ë°ê¾¸ìë©´ ë©ëë¤. -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2 >내 정보 조회 및 수정</h2>
                        <div class="breadcrumb__option">
                            <a href="/teamProject3/member/myPageMain.jsp">마이페이지</a>
                            <span >내 정보 조회 및 수정</span>
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
                <h4>내 정보 조회 및 수정</h4>
                <form method="post" name="frm" id="frm" 
		  			  action="/teamProject3/update.do" 
		  			  enctype="multipart/form-data"
		 			  onsubmit="return inputCheck()">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>아이디</p>
                                        <input type="text" name="member_id" value="${sessionScope.login.member_id}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                            		<div class="checkout__input">
                                		<p>이름</p>
                                		<input type="text" name="member_name" value="${sessionScope.login.member_name}">
	                            	</div>
                                </div>
                            </div>
                            <div class="row">
                            	<div class="col-lg-6">
                            		<div class="checkout__input">
                                		<p>현재 비밀번호<span>*</span></p>
                                		<input type="password" name="member_pass" placeholder="현재 비밀번호">
                            		</div>
                            	</div>
                            	<div class="col-lg-6">
                            		<div class="checkout__input">
                                		<p>새 비밀번호<span>*</span></p>
                                		<input type="password" name="member_newPass" class="checkout__input__add" placeholder="새 비밀번호">
                                		<input type="password" name="member_newPassCk" placeholder="새 비밀번호 확인">
                            		</div>
                            	</div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                        	<div>
                        		<c:if test="${sessionScope.login.member_image == 'images1'}">
									<div class="photo image_wrap" class="col-lg-12" style="text-align:center;">
										<img src="/teamProject3/images/face_icon.png" id="image_preview" style="width:500px" 
											 name="image_preview" class="img-fluid1 rounded-circle1 img"/>
									</div>
									<br><br>
									<div style="text-align:center;" class="filebox">
									  	<label for="member_image">사진 업로드</label>
									  	<input type="file" name="member_image" id="member_image" value="${sessionScope.login.member_image}"> 
									</div>
									<div class="image_wrap">
										<img name="image_preview" id="image_preview">
									</div>
								</c:if>
								
								<c:if test="${sessionScope.login.member_image != 'images1'}">
									<div class="photo" class="col-lg-12" style="text-align:center;">
										<img src="/teamProject3/images/${sessionScope.login.member_image}" id="image_preview" style="width:500px" 
											 name="image_preview" class="img-fluid1 rounded-circle1"/>
									</div>
									<br><br>
									<div style="text-align:center;" class="filebox">
									  	<label for="member_image">사진 업로드</label>
									  	<input type="file" name="member_image" id="member_image" value="${sessionScope.login.member_image}">
									</div>
									<div class="image_wrap">
										<img name="image_preview" id="image_preview">
									</div>
								</c:if>
                        	</div>
                        </div>
                        <div class="col-lg-8 col-md-6">
                            <div class="checkout__input">
                            	<p>성별<span>*</span></p>
                            	<input type="radio" id="member_male" name="member_gender" value="male" 
									<c:if test="${sessionScope.login.member_gender == 'male'}">checked="checked"</c:if>>남
								<input type="radio" id="member_female" name="member_gender" value="female"
									<c:if test="${sessionScope.login.member_gender == 'female'}">checked="checked"</c:if>>여
                            </div>
                            <div class="row">
                            	<div class="col-lg-6">
                            		<div class="checkout__input">
                            			<p>생년월일<span>*</span></p>
                            			<input type="date" name="member_birth" id="member_birth" value="${sessionScope.birth}">
                            		</div>
                            	</div>
                            	<div class="col-lg-6">
                            		<div class="checkout__input">
                            			<p>전화번호<span>*</span></p>
                            			<input type="text" name="member_tel" onkeydown='return onlyNumber(event)' 
                            				   value="${sessionScope.login.member_tel}">
                            		</div>
                            	</div>
                            </div>
                            <div class="row">
                            	<div class="col-lg-6">
		                            <div class="checkout__input">
		                            	<p>이메일<span>*</span></p>
		                            	<input type="text" name="member_email" id="member_email" value="${sessionScope.login.member_email}">
		                            </div>
	                            </div>
                            </div>
                            <div class="row">
                            	<div class="col-lg-6">
		                            <div class="checkout__input">
		                                <p>주소<span>*</span></p>
		                                <input type="text" name="member_postcode" id="sample4_postcode" placeholder="우편번호" 
		                                	   class="checkout__input__add" value="${sessionScope.login.member_postcode}" readonly>
		                            </div>
		                        </div>  
		                        <div class="col-lg-6">  
		                            <div class="checkout__input">
		                            	<input type="hidden" class="checkout__input__add">
		                                <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
		                            </div>
		                        </div>
		                    </div>  
		                    <div class="row"> 
		                    	<div class="col-lg-12">  
		                            <div class="checkout__input">
		                                <input type="text" name="member_roadAddress" id="sample4_roadAddress" class="checkout__input__add" placeholder="도로명주소"
					       					   value="${sessionScope.login.member_roadAddress}" readonly>					       					   
		                            </div>
		                        </div>  
		                        <div class="col-lg-6">  
		                            <div class="checkout__input">
		                                <input type="hidden" name="member_jibunAddress" id="sample4_jibunAddress" placeholder="지번주소" readonly>
		                                <span id="guide" style="color:#999;display:none"></span>
		                                <input type="text" name="member_detailAddress" id="sample4_detailAddress" placeholder="상세주소" 
						   					   value="${sessionScope.login.member_detailAddress}">
		                            </div>
	                        	</div>
	                        	<div class="col-lg-6">  
		                            <div class="checkout__input">
		                                <input type="text" name="member_extraAddress" id="sample4_extraAddress" placeholder="참고항목" 
						   					   value="${sessionScope.login.member_extraAddress}"readonly>
		                            </div>
	                        	</div>
	                        </div>   
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>채식타입<span>*</span></p>
                                        <select name="member_type" id="member_type" length="4">
												<option value="">선택</option>
												<option value="vegan" 
													<c:if test="${sessionScope.login.member_type == 'vegan' }">selected='selected'</c:if>>비건(Vegan)</option>
												<option value="lacto"
													<c:if test="${sessionScope.login.member_type == 'lacto' }">selected='selected'</c:if>>락토(Lacto)</option>
												<option value="ovo"
													<c:if test="${sessionScope.login.member_type == 'ovo' }">selected='selected'</c:if>>오보(Ovo)</option>
												<option value="lacto_ovo"
													<c:if test="${sessionScope.login.member_type == 'lacto_ovo' }">selected='selected'</c:if>>락토오보(Lacto-Ovo)</option>
												<option value="pesco"
													<c:if test="${sessionScope.login.member_type == 'pesco' }">selected='selected'</c:if>>페스코(Pesco)</option>
												<option value="pollo"
													<c:if test="${sessionScope.login.member_type == 'pollo' }">selected='selected'</c:if>>폴로(Pollo)</option>
												<option value="flexitarian"
													<c:if test="${sessionScope.login.member_type == 'flexitarian' }">selected='selected'</c:if>>플렉시테리언(Flexitarian)</option>
												<option value="etc"
													<c:if test="${sessionScope.login.member_type == 'etc' }">selected='selected'</c:if>>기타</option>
										</select>	
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