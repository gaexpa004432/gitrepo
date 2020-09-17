<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberInsert.jsp</title>
<script>
function inputCheck() {
	//id, pw 필수입력 체크
	if(frm.id.value == "") {
		window.alert("id 입력하세요");
		frm.id.focus();
		return false;
	}
	if(frm.pw.value == "") {
		alert("pw 입력하세요");
		frm.pw.focus();
		return false;
	}
	if(frm.pw.value != frm.pwCheck.value) {
		alert("두 패스워드가 ")
	}
	
	if(frm.job.value == "") {
		alert("job선택");
		frm.job.focus();
		return false;
	}
	var gender =
		document.querySelectorAll("[name='gender']:checked").length;
	if(gender == 0) {
		alert("성별 적어도 하나는 선택");
		return false;
	}
	return true;
}
</script>
</head>
<body>
<h3>회원등록</h3>
<div class="regist">
	<form method="post" name="frm" id="frm" 
		  action="memberInsert.do" 
		  onsubmit="return inputCheck()">
	<div>
		<label>아이디</label>
		<input type="text" name="id">
	</div>
	<div>
		<label>비밀번호</label>
		<input type="password" name="pw">
	</div>
	<div>
		<label>비밀번호 확인</label>
		<input type="password" name="pwCheck">
	</div>
	<div>
		<label>성별</label>
		<input type="radio" name="gender" value="male" checked>남
		<input type="radio" name="gender" value="female">여
	</div>
	<div>
		<label>직업</label>
		<select name="job" id="job" length="4">
			<option value="">선택</option>
			<option value="professor">교수</option>
			<option value="doctor">의사</option>
			<option value="salesperson">판매원</option>
			<option value="student">학생</option>
		</select>	
	</div>
	<div>
		<label for="reason">가입동기</label>
		<textarea id="reason" name="reason"></textarea>
	</div>
	<div>
		<label>메일수신여부</label>
		<input type="checkbox" name="mailyn" value="y"></input>
	</div>
	<div>
		<label for="hobby">취미</label>
		<input type="checkbox" name="hobby" value="read">독서
		<input type="checkbox" name="hobby" value="game">게임
		<input type="checkbox" name="hobby" value="ski">스키
	</div>
	<div>
		<button type="reset" name="reset">초기화</button>
		<button>등록</button>
		<!-- <button type="button" name="submit" onclick="inputCheck()">등록</button> -->
	</div>
	</form>
</div>
</body>
</html>