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

#btnInsert {
	display: inline-block;
	font-size: 14px;
	color: #1c1c1c;
	text-transform: uppercase;
	letter-spacing: 1px;
	border: 1px solid #b2b2b2;
	padding: 14px 20px 12px;
	border-radius: 25px;
}

#btnInsert:hover{
	background-color: #caccd1;
}

#btnInsert:active {
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
	
	//필수체크 입력
	if(frm.member_id.value == "") {
		window.alert("아이디를 입력하세요");
		frm.member_id.focus();
		return false;
	}
	if(frm.member_pass.value == "") {
		alert("비밀번호를 입력하세요");
		frm.member_pass.focus();
		return false;
	}
	if(frm.member_pass.value != frm.member_passCheck.value) {
		alert("비밀번호가 일치하지 않습니다");
		frm.member_pass.focus();
		return false;
	}
	if(frm.member_tel.value == "") {
		window.alert("전화번호를 입력하세요");
		frm.member_tel.focus();
		return false;
	}
	if(frm.member_name.value == "") {
		window.alert("이름을 입력하세요");
		frm.member_name.focus();
		return false;
	}
	if(frm.member_birth.value == "") {
		window.alert("생년월일을 입력하세요");
		frm.member_birth.focus();
		return false;
	}
	
	//job(select 태그) 선택되었는지 확인
	if(frm.member_type.value == "") {
	//if(frm.job.selectedIndex > 0) {}
		alert("job선택");
		frm.job.focus();
		return false;
	}
	return true;
	
}

function onlyNumber(event){
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 
    		|| keyID == 37 || keyID == 39 || keyID == 9 || keyID ==116 ) 
        return;
    else
        return false;
}
</script>
<script type="text/javascript">
        
var sel_file;

$(function() {
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

</script>

</head>
<body>
  <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>회원 등록</h4>
                <form method="post" name="frm" id="frm" 
		  			  action="/teamProject3/insert.do" 
		  			  enctype="multipart/form-data"
		 			  onsubmit="return inputCheck()">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>아이디<span>*</span></p>
                                        <input type="text" id="member_id" name="member_id" placeholder="아이디">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                            		<div class="checkout__input">
                                		<p>이름<span>*</span></p>
                                		<input type="text" id="member_name" name="member_name" placeholder="이름">
	                            	</div>
                                </div>
                            </div>
                            <div class="row">
                            	<div class="col-lg-6">
                            		<div class="checkout__input">
                                		<p>비밀번호<span>*</span></p>
                                		<input type="password" id="member_pass" name="member_pass" placeholder="비밀번호">
                            		</div>
                            	</div>
                            	<div class="col-lg-6">
                            		<div class="checkout__input">
                                		<p>비밀번호 확인<span>*</span></p>
                                		<input type="password" id="member_passCheck" name="member_passCheck" placeholder="비밀번호 확인">
                            		</div>
                            	</div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                        	<div>
                       			<div class="photo image_wrap" class="col-lg-12" style="text-align:center;">
									<img src="/teamProject3/img/face_icon.png" id="image_preview" style="width:500px" 
										 name="image_preview" class="img-fluid1 rounded-circle1 img"/>
								</div>
								<br><br>
								<div style="text-align:center;" class="filebox">
								  	<label for="member_image">사진 업로드</label>
								  	<input type="file" name="member_image" id="member_image"> 
								</div>
								<div class="image_wrap">
									<img name="image_preview" id="image_preview">
								</div>
                        	</div>
                        </div>
                        <div class="col-lg-8 col-md-6">
                            <div class="checkout__input">
                            	<p>성별<span>*</span></p>
                            	<input type="radio" id="member_male" name="member_gender" value="male" checked>남
								<input type="radio" id="member_female" name="member_gender" value="female">여
                            </div>
                            <div class="row">
                            	<div class="col-lg-6">
                            		<div class="checkout__input">
                            			<p>생년월일<span>*</span></p>
                            			<input type="date" name="member_birth" id="member_birth">
                            		</div>
                            	</div>
                            	<div class="col-lg-6">
                            		<div class="checkout__input">
                            			<p>전화번호<span>*</span></p>
                            			<input type="text" id="member_tel" name="member_tel" onkeydown='return onlyNumber(event)' placeholder="전화번호">
                            		</div>
                            	</div>
                            </div>
                            <div class="row">
                            	<div class="col-lg-6">
		                            <div class="checkout__input">
		                            	<p>이메일<span>*</span></p>
		                            	<input type="text" name="member_email" id="member_email" placeholder="이메일">
		                            </div>
	                            </div>
                            </div>
                            <div class="row">
                            	<div class="col-lg-6">
		                            <div class="checkout__input">
		                                <p>주소<span>*</span></p>
		                                <input type="text" name="member_postcode" id="sample4_postcode" placeholder="우편번호" 
		                                	   class="checkout__input__add" readonly>
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
		                    	<div class="col-lg-4">  
		                            <div class="checkout__input">
		                                <input type="text" name="member_roadAddress" id="sample4_roadAddress" placeholder="도로명주소" readonly>
		                            </div>
		                        </div>  
		                        <div class="col-lg-4">  
		                            <div class="checkout__input">
		                                <input type="hidden" name="member_jibunAddress" id="sample4_jibunAddress" placeholder="지번주소" readonly>
		                                <span id="guide" style="color:#999;display:none"></span>
		                                <input type="text" name="member_detailAddress" id="sample4_detailAddress" placeholder="상세주소">
		                            </div>
	                        	</div>
	                        	<div class="col-lg-4">  
		                            <div class="checkout__input">
		                                <input type="text" name="member_extraAddress" id="sample4_extraAddress" placeholder="참고항목" readonly>
		                            </div>
	                        	</div>
	                        </div>   
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>채식타입<span>*</span></p>
                                        <select name="member_type" id="member_type" length="4">
												<option value="">선택</option>
												<option value="vegan">비건(Vegan)</option>
												<option value="lacto">락토(Lacto)</option>
												<option value="ovo">오보(Ovo)</option>
												<option value="lacto_ovo">락토오보(Lacto-Ovo)</option>
												<option value="pesco">페스코(Pesco)</option>
												<option value="pollo">폴로(Pollo)</option>
												<option value="flexitarian">플렉시테리언(Flexitarian)</option>
												<option value="etc">기타</option>
										</select>	
                                    </div>
                                </div>
                            </div>
						</div>
                        <div class="col-lg-12" style="text-align:center; ">
							<button id="btnInsert" style="width:40%; ">회원가입</button>
						</div>
					</div>
				</form>
			</div>
		</div>
</section>
</body>

</html>