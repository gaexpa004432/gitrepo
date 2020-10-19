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
<title>레시피 추천</title>
<style>
	textarea {
		width: 100%;
		height: 150px;
		font-size: 16px;
		color: #6f6f6f;
		padding-left: 20px;
		margin-bottom: 24px;
		border: 1px solid #ebebeb;
		border-radius: 4px;
		padding-top: 12px;
		resize: none;
		}
	
	img.inimg {
		max-width: 200px;
		min-width: 200px;
		max-height:250px;
		min-height:250px;
	}
	
	td {
	padding:50px;
	}
	#divPaging {
          clear:both; 
        margin:0 auto; 
        width:220px; 
        height:50px;
}

    #divPaging > div {
        float:left;
        width: 30px;
        margin:0 auto;
        text-align:center;
}
</style>
</head>
<body >
<div class="container">
<div>
<h1 style = "color:#FA8C8C;">레시피 추천</h1>
</div>
<hr>
<c:set var="i" value="0" />
 <c:set var="j" value="4" />
 <div class="row" align="center">

 <table  style="border-spacing:50px;">
  <c:choose>
   <c:when test="${list != null && fn:length(list) > 0 }"> 

    <c:forEach items="${list}" var="recipelist">
     <c:if test="${i%j == 0}">
      <tr>
     </c:if>
     
     <td align="center">
     	<div class="imgin">
     		<a href="/teamProject3/recipeView.do?recipe_number=${recipelist.recipe_number}">
     			<img class="inimg" src="/teamProject3/images/${recipelist.main_img}">
    		</a>
     	<br>
     		<div class="fa fa-calendar-o ">
     			<i>${recipelist.recipe_date}</i>
     		</div><br>
     				${recipelist.recipe_name}<br>
     				${recipelist.member_id}
     	</div>
     </td>
     
     
    <c:if test="${i%j == j-1}">
    </c:if> 
   <c:set var="i" value="${i+1}" />
    </c:forEach>
   </c:when>
   
  <c:otherwise>
   <tr>
    <td>레시피가 없어요!</td>
   </tr>
  </c:otherwise>
  </c:choose> 
  
  
 </table>
 </div>
 
 <hr>
 <div class="col-sm-12" align="right">
 	<a href="/teamProject3/recipe/recipeInsert.jsp">
 		<button type="button" class="site-btn">레시피 등록</button>
 	</a>
 </div>

<br> 
<br>
 
 <div  class="col-sm-10" align="center">
  <form name="searchFrm">		
	<input type="hidden" name="p" value="1">
	<input  name="recipe_search" size="50px" style="height :47px">
	<button class="site-btn">검색</button>	
  </form>
 </div>	

<br> 
<br>

<div align="center">
 <my:paging paging="${paging}" jsfunc="gopage" />
 </div>
<script>
	function gopage(p) {			// 검색 function
		searchFrm.p.value = p;		// 페이지번호 받아와서 submit에 넘김
		searchFrm.submit();
		
		// location.href="deptSelectAll?p=" + p;	// 이동되는 주소가 달라서 여러사람이 쓰기위해서는 매개값 p로 해줌
	}
</script> 
</div>
</body>

</html>