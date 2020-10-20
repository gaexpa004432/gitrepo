<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>비건 식당 추천</title>
<style>
	img.inimg {
		max-width: 300px;
		min-width: 300px;
		max-height:250px;
		min-height:250px;
		
		
	}
	figure {
	width: 300px;
	height: 250px;
	margin: 0;
	padding: 0;
	background: #fff;
	overflow: hidden;
}
	
	td {
	padding:50px;
	}
	
	.active{
    border: 1px solid #b2b2b2;
    color: #b2b2b2;

	}
	
figure img {
	-webkit-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .3s ease-in-out;
	transition: .3s ease-in-out;
}
figure:hover img {
	-webkit-transform: scale(1.3);
	transform: scale(1.3);
}

</style>
<script>
$(function(){
	
})
</script>
</head>
<body >
<%@include  file="/common/restaurant.jsp" %>
<div style="margin:100px"></div>
<div class="container">
<div>
</div>

<hr>
<c:set var="i" value="0" />
 <c:set var="j" value="3" />
 <div class="row" align="center">
 <table  style="border-spacing:50px;">
  <c:choose>
   <c:when test="${list != null && fn:length(list) > 0 }"> 

    <c:forEach items="${list}" var="restaurantlist">
     <c:if test="${i%j == 0}">
      <tr>
     </c:if>
     <td><div class="imgin"><a align="center" href="/teamProject3/restaurantView.do?res_no=${restaurantlist.res_no}">
     <figure><img class="inimg" src="/teamProject3/images/${restaurantlist.res_name}"></figure></div></a>
     <div class="blog__item__text" align="left">
     <ul>
         <li><i class="fa fa-calendar-o"></i> ${restaurantlist.res_date }</li>
         <li><i class="fa fa-comment-o"></i> ${restaurantlist.res_si }</li>
     </ul>
     <div align="left">
     <h5 style="color:#333333">
     ${restaurantlist.res_gu }
     </h5>
     </div>
 <a class="blog__btn" href="/teamProject3/restaurantView.do?res_no=${restaurantlist.res_no}">READ MORE <span class="arrow_right"></span></a>
    </div>
     
     
     </td>
    <c:if test="${i%j == j-1}">
     </tr>
    </c:if> 
   <c:set var="i" value="${i+1}" />
    </c:forEach>
   </c:when>
  <c:otherwise>
   <tr>
    <td>식당이 없어요!</td>
   </tr>
  </c:otherwise>
  </c:choose> 
  
  
 </table>
 </div>

  <form name="searchFrm">		
	<input type="hidden" name="p" value="1">
	<input type="hidden" name="" value="">
	
</form>
<br> 
<br>

<div class="row" align="center">
	<div class="col-sm-10">
 <my:paging paging="${paging}" jsfunc="gopage" />
</div>
	<div class="col-sm-2">
<a href="/teamProject3/restaurant/restaurantWrite.jsp"> <button class="site-btn" style="margin-bottom:50px"> 글쓰기</button></a>
	</div>
 </div>

<script>
	function gopage(p) {			// 검색 function
		searchFrm.p.value = p;		// 페이지번호 받아와서 submit에 넘김
		searchFrm.submit();
		
		// location.href="deptSelectAll?p=" + p;	// 이동되는 주소가 달라서 여러사람이 쓰기위해서는 매개값 p로 해줌
	}
</script> 

</body>

</html>