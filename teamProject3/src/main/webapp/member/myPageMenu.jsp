<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageMenu.jsp</title>
<style>
/* .divContainer {
	position : absolute;
} */
</style>
</head>
<body> --%>
<!-- <section class="blog spad"> -->
        <div class="container" id="divContainer">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar"> 
                        <div class="blog__sidebar__item">
                            <h4>마이페이지 메뉴</h4>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/select.do">내 정보조회 및 수정</a></li>
                                <li><a href="${pageContext.request.contextPath}/orderList.do">내 정보조회 및 수정</a></li>
                                <li><a href="${pageContext.request.contextPath}/favList.do?fav=fs">나의 즐겨찾기</a></li>
                                <c:choose>
									<c:when test="${sessionScope.login.seller_code != 0}">
                                		<li><a href="${pageContext.request.contextPath}/ansList.do">1:1 문의</a></li>
                                	</c:when>
									<c:when test="${sessionScope.login.seller_code == 0}">
										<li><a href="${pageContext.request.contextPath}/inqList.do">1:1 문의</a></li>
                                	</c:when>
								</c:choose>
                                <li><a href="${pageContext.request.contextPath}/mileageController.do">마일리지조회</a></li>
                                <c:choose>
									<c:when test="${sessionScope.login.seller_code != 0}">
                                		<li><a href="${pageContext.request.contextPath}/member/memberAddUpdate.jsp">소상공인 정보 수정 및 조회</a></li>
		                                <li><a href="${pageContext.request.contextPath}/sellList.do">판매내역</a></li>
                                	</c:when>
                                	<c:when test="${sessionScope.login.seller_code == 0}">
		                                <li><a href="${pageContext.request.contextPath}/member/memberAddInsert.jsp">판매자로 등록</a></li>
		                            </c:when>
		                        </c:choose>
                                <li><a href="/teamproject3/member/memberDelete.jsp">회원탈퇴</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
			<!-- 	<div class="col-lg-8 col-md-7">
            	</div>
			</div>
		</div>
</section> -->
<!-- </body>
</html> -->