<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    .image_wrap {
        width: 100px;
        margin-top: 50px;
    }
    .image_wrap #image_preview {
        max-width: 100%;
    }
	
*, *:before, *:after {
 -moz-box-sizing: border-box;
 -webkit-box-sizing: border-box;
 box-sizing: border-box;
}

body {
  font-family: 'Nunito', sans-serif;
  color: #384047;
}

form {
  max-width: 300px;
  margin: 10px auto;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
}

h3 {
  margin: 0 0 30px 0;
  text-align: center;
}

input[type="text"],
input[type="password"],
input[type="date"],
input[type="datetime"],
input[type="email"],
input[type="number"],
input[type="search"],
input[type="tel"],
input[type="time"],
input[type="url"],
textarea,
select {
  background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 100%;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
}

input[type="radio"],
input[type="checkbox"] {
  margin: 0 4px 8px 0;
}

select {
  padding: 6px;
  height: 32px;
  border-radius: 2px;
}

button {
  padding: 19px 39px 18px 39px;
  color: #FFF;
  background-color: #4bc970;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 100%;
  border: 1px solid #3ac162;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}

fieldset {
  margin-bottom: 30px;
  border: none;
}

legend {
  font-size: 1.4em;
  margin-bottom: 10px;
}

label {
  display: block;
  margin-bottom: 8px;
}

label.light {
  font-weight: 300;
  display: inline;
}

.number {
  background-color: #5fcf80;
  color: #fff;
  height: 30px;
  width: 30px;
  display: inline-block;
  font-size: 0.8em;
  margin-right: 4px;
  line-height: 30px;
  text-align: center;
  text-shadow: 0 1px 0 rgba(255,255,255,0.2);
  border-radius: 100%;
}

@media screen and (min-width: 480px) {

  form {
    max-width: 480px;
  }

}
</style>

<title>memberInsert.jsp</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script>
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
		
	/*var gender =
		document.querySelectorAll("[name='gender']:checked").length;
	if(gender == 0) {
		alert("성별 적어도 하나는 선택");
		return false;
	}
	return true;*/
		
}


//전화번호에서 숫자만 받기
function onlyNumber(event){
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 
    		|| keyID == 37 || keyID == 39 || keyID == 9 || keyID ==116 ) 
        return;
    else
        return false;
}
    
//전화번호에서 한글 못받게 하기 (코드만들기)

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



<!-- 주소api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript" src="/teamProject3/api/addressApi.js"></script>


</head>
<body>

	<!-- <div class="regist"> -->
	<form method="post" name="frm" id="frm" 
		  action="insert.do"
		  enctype="multipart/form-data" 
		  onsubmit="return inputCheck()">
		<h3>회원등록</h3>
		<fieldset>
			<legend><span class="number">1</span>ID & PASSWORD</legend>
				<!-- <label for="member_id">아이디</label> -->
				<input type="text" id="member_id" name="member_id" placeholder="아이디">

				<!-- <label for="member_pass">비밀번호</label> -->
				<input type="password" id="member_pass" name="member_pass" placeholder="비밀번호">

				<!-- <label for="member_passCheck">비밀번호 확인</label>  -->
				<input type="password" id="member_passCheck" name="member_passCheck" placeholder="비밀번호 확인">
		</fieldset>
		
		<fieldset>
			<legend><span class="number">2</span>Your basic info</legend>
				<!-- <label for="member_name">이름</label> -->
				<input type="text" id="member_name"name="member_name" placeholder="이름">

				<!-- <label>생년월일</label> -->
				<input type="date" id="member_birth" name="member_birth">

				<!-- <label>전화번호</label> -->
				<input type="text" id="member_tel" name="member_tel" onkeydown='return onlyNumber(event)' placeholder="전화번호">

				<!-- <label>이메일</label> -->
				<input type="text" id="member_email" name="member_email" placeholder="이메일">
				
				<label>성별</label>
				<input type="radio" id="member_male" name="member_gender" value="male" checked>남
				<input type="radio" id="member_female" name="member_gender" value="female">여
		</fieldset>
		<fieldset>
			<legend><span class="number">3</span>Your Address</legend>
				<label>주소</label><br>
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br><br>
				<input type="text" name="member_postcode" id="sample4_postcode" placeholder="우편번호" readonly>
				<input type="text" name="member_roadAddress" id="sample4_roadAddress" placeholder="도로명주소" readonly>
				<input type="hidden" name="member_jibunAddress" id="sample4_jibunAddress" placeholder="지번주소" readonly>
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" name="member_detailAddress" id="sample4_detailAddress" placeholder="상세주소">
				<input type="text" name="member_extraAddress" id="sample4_extraAddress" placeholder="참고항목" readonly>
		</fieldset>
		<fieldset>
			<legend><span class="number">4</span>Your type</legend>
				<div>
					<label>채식타입</label>
					<select name="member_type" id="member_type" length="4">
						<option value="">선택</option>
						<option value="vegan">비건(Vegan)</option>
						<option value="lacto">락토(Lacto)</option>
						<option value="ovo">오보(Ovo)</option>
						<option value="lacto_ovo">락토오보(Lacto-Ovo)</option>
						<option value="pesco">페스코(Pesco)</option>
						<option value="Pollo">폴로(Pollo)</option>
						<option value="flexitarian">플렉시테리언(Flexitarian)</option>
						<option value="etc">기타</option>
					</select>	
				</div>
				<div>
					<label>사진 등록</label>
					<input type="file" name="member_image" id="member_image">
				</div>
		</fieldset>
			<div>
				<div class="image_wrap">
					<img name="image_preview" id="image_preview">
				</div>
			</div>
			<div>
				<button>등록</button>
				<button type="reset" name="reset">초기화</button>
			</div>
		</form>
	<!-- </div> -->

</body>
</html>