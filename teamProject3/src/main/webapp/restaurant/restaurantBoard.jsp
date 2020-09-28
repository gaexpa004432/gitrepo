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
<title>식당 추천</title>
<style>
	img.inimg {
		max-width: 237px;
		min-width: 237px;
		max-height:250px;
		min-height:250px;
	}
	
	table{
	border-spacing:50px;
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
<body>
<c:set var="i" value="0" />
 <c:set var="j" value="3" />
 <table  align="center" style="border-spacing:50px;">
  <c:choose>
   <c:when test="${list != null && fn:length(list) > 0 }"> 

    <c:forEach items="${list}" var="restaurantlist">
     <c:if test="${i%j == 0}">
      <tr>
     </c:if>
     <td>${restaurantlist.res_no}<a href="/teamProject3/restaurantView.do?res_no=${restaurantlist.res_no}"><img class="inimg" src="/teamProject3/images/${restaurantlist.res_name}"></a></td>
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
  <form name="searchFrm">		
	<input type="hidden" name="p" value="1">
	<input type="hidden" name="" value="">
	
</form>
<br> 
<br>
<br>
<br>
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

</body>

</html>