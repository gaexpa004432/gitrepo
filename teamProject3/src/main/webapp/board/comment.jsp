<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<C:forEach items="${list}" var="list">
	<div class="row" style="border-top-width: 1px; border-top-style: solid; padding: 20px; border-top-color: #f0f0f5;">
		<div class="col-sm-1">작성자아이디</div>
		<div class="col-sm-10" align="left";>
			<small style='vertical-align: top'> ${list.comment_date} </small><br>${list.comment_content}
		</div>
		<div class="col-sm-1">
			<button>수정</button>
			<br>
			<button>삭제</button>
		</div>


	</div>
</C:forEach>

