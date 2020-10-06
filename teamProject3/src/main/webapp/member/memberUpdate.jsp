<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 주소api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/teamProject3/api/addressApi.js"></script>

<title>memberUpdate.jsp</title>
<script>
$(function() {
	if("${errormsg}" != "") {
		alert("${errormsg}");
	};
});
</script>
<script>
function inputCheck() {
	
	if(frm.member_newPass.value != frm.member_newPassCk.value) {
		alert("새 비밀번호가 일치하지 않습니다");
		frm.member_newPass.focus();
		return false;
	}
	
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
		<input type="text" name="member_id" value="${sessionScope.login.member_id}" readonly="readonly">
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
		<input type="text" name="member_name" value="${sessionScope.login.member_name}">
	</div>
	<div>
		<label>성별</label>
			<input type="radio" name="member_gender" value="male" 
				<c:if test="${sessionScope.login.member_gender == 'male'}">checked="checked"</c:if>>남
			<input type="radio" name="member_gender" value="female"
				<c:if test="${sessionScope.login.member_gender == 'female'}">checked="checked" </c:if>>여
	</div>
	<div>
		<label>생년월일</label>
		<input type="date" name="member_birth" id="member_birth" value="${sessionScope.birth}">
	</div>
	<div>
		<label>전화번호</label>
		<input type="text" name="member_tel" onkeydown='return onlyNumber(event)' value="${sessionScope.login.member_tel}">
	</div>
	<div>
		<label>이메일</label>
		<input type="text" name="member_email" id="member_email" value="${sessionScope.login.member_email}">
	</div>
	<div>
		<label>주소</label><br>
		<input type="text" name="member_postcode" id="sample4_postcode" placeholder="우편번호" 
						   value="${sessionScope.login.member_postcode}" readonly>
		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="member_roadAddress" id="sample4_roadAddress" placeholder="도로명주소" 
					       value="${sessionScope.login.member_roadAddress}" readonly>
		<input type="hidden" name="member_jibunAddress" id="sample4_jibunAddress" placeholder="지번주소" readonly>
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" name="member_detailAddress" id="sample4_detailAddress" placeholder="상세주소" 
						   value="${sessionScope.login.member_detailAddress}">
		<input type="text" name="member_extraAddress" id="sample4_extraAddress" placeholder="참고항목" 
						   value="${sessionScope.login.member_extraAddress}"readonly>
	</div>
	<div>
		<label>채식타입</label>
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
	<div>
		<button type="reset" name="reset">초기화</button>
		<button>수정</button>
	</div>
	</form>
</div>
</body>
</html>