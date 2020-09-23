<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberUpdate.jsp</title>
</head>
<body>
<div class="regist">
	<form method="post" name="frm" id="frm" 
		  action="update.do" 
		  onsubmit="return inputCheck()">
	<div>
		<label>아이디</label>
		<input type="text" name="member_id" value="${member.member_id}" readonly="readonly">
	</div>
	<div>
		<label>현재 비밀번호</label>
		<input type="password" name="member_pass">
	</div>
	<div>
		<label>새 비밀번호</label>
		<input type="password" name="member_pass">
	</div>
	<div>
		<label>새 비밀번호 확인</label>
		<input type="password" name="member_passCheck">
	</div>
	<div>
		<label>이름</label>
		<input type="text" name="member_name" value="${member.member_name}">
	</div>
	<div>
		<label>성별</label>
		<input type="radio" name="member_gender" value="male">남
		<input type="radio" name="member_gender" value="female">여
	</div>
	<div>
		<label>생년월일</label>
		<input type="date" name="member_birth">
	</div>
	<div>
		<label>전화번호</label>
		<input type="text" name="member_tel" onkeydown='return onlyNumber(event)' value="${member.member_tel}">
	</div>
	<div>
		<label>주소</label><br>
		<input type="text" name="member_postcode" id="sample4_postcode" placeholder="우편번호">
		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="member_roadAddress" id="sample4_roadAddress" placeholder="도로명주소">
		<input type="hidden" name="member_jibunAddress" id="sample4_jibunAddress" placeholder="지번주소">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" name="member_detailAddress" id="sample4_detailAddress" placeholder="상세주소">
		<input type="text" name="member_extraAddress" id="sample4_extraAddress" placeholder="참고항목">
	</div>
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
		<button type="reset" name="reset">초기화</button>
		<button>수정</button>
	</div>
	</form>
</div>
</body>
</html>