<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 주소api -->
<!-- <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/teamProject3/api/addressApi.js"></script> -->

<title>memberUpdate.jsp</title>
<script>
function inputCheck() {
	
	if(frm.member_pass.value == "") {
		frm.member_newPass.value = ${member.member_pass}
	} else if (frm.member_pass.value != ${member.member_pass}) {
		alert("현재 비밀번호가 일치 하지 않습니다");
		frm.member_pass.focus();
		return false; // 이 값이 없으면 바로 다음페이지로 넘어감
		}
	}
	
/* 	if(frm.member_pass.value == ${member.member_pass}){
		frm.member_newPass.value = ${member.member_pass}
	} */
	
	if(frm.member_pass.value == ${member.member_pass} && frm.member_newPass.value == "") {
		alert("새 비밀번호를 입력하세요");
		frm.member_newPass.focus();
		return false;
	} else if (frm.member_pass.value == ${member.member_pass} && frm.member_newPass.value != "") {
		if(frm.member_newPass.value != frm.member_newPassCk.value) {
			alert("새 비밀번호가 일치하지 않습니다");
			frm.member_newPass.focus();
			return false;
		}
	}
	
	
	
	/* if(frm.member_birth.value == "") {
		frm.member_birth.value = ${member.member_birth}
	}
	
	if(frm.member_roadAddress.value == "") {
		frm.member_roadAddress.value = ${member.member_address}
	} */
	
}
</script>

</head>
<body>
<div class="regist">
	<form method="post" name="frm" id="frm" 
		  action="update.do" 
		  onsubmit="return inputCheck()">
	<div>
		<label>아이디</label>
		<input type="text" name="member_id" value="${member.member_id}" readonly="readonly">
		${sessionScope.login.member_id}
	</div>
	<div>
		<label>현재 비밀번호</label>
		<input type="password" name="member_pass">
	</div>
	<div>
		<label>새 비밀번호</label>
		<input type="password" name="member_newPass">
	</div>
	<div>
		<label>새 비밀번호 확인</label>
		<input type="password" name="member_newPassCk">
	</div>
	<div>
		<label>이름</label>
		<input type="text" name="member_name" value="${member.member_name}">
	</div>
	<div>
		<label>성별</label>
			<input type="radio" name="member_gender" value="male" 
				<c:if test="${member.member_gender == 'male'}">checked="checked"</c:if>>남
			<input type="radio" name="member_gender" value="female"
				<c:if test="${member.member_gender == 'female'}">checked="checked" </c:if>>여
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
				<option value="vegan" 
					<c:if test="${member.member_type == 'vegan' }">selected='selected'</c:if>>비건(Vegan)</option>
				<option value="lacto"
					<c:if test="${member.member_type == 'lacto' }">selected='selected'</c:if>>락토(Lacto)</option>
				<option value="ovo"
					<c:if test="${member.member_type == 'ovo' }">selected='selected'</c:if>>오보(Ovo)</option>
				<option value="lacto_ovo"
					<c:if test="${member.member_type == 'lacto_ovo' }">selected='selected'</c:if>>락토오보(Lacto-Ovo)</option>
				<option value="pesco"
					<c:if test="${member.member_type == 'pesco' }">selected='selected'</c:if>>페스코(Pesco)</option>
				<option value="pollo"
					<c:if test="${member.member_type == 'pollo' }">selected='selected'</c:if>>폴로(Pollo)</option>
				<option value="flexitarian"
					<c:if test="${member.member_type == 'flexitarian' }">selected='selected'</c:if>>플렉시테리언(Flexitarian)</option>
				<option value="etc"
					<c:if test="${member.member_type == 'etc' }">selected='selected'</c:if>>기타</option>
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