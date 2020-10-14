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
.btn{  /* 새로운재료 추가 버튼 css */
      text-decoration: none;
      font-size:2rem;
      color:white;
      padding:10px 20px 10px 20px;
      margin:20px;
      display:inline-block;
      border-radius: 10px;
      transition:all 0.1s;
      text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
      font-family: 'Lobster', cursive; <!-- google font -->
    }
    .btn:active{
      transform: translateY(3px);
    }
    .btn.blue{
      background-color: #1f75d9;
      border-bottom:5px solid #165195;
    }
    .btn.blue:active{
      border-bottom:2px solid #165195;
    }
    .btn.red{
      background-color: #ff521e;
      border-bottom:5px solid #c1370e;
    }
    .btn.red:active{
      border-bottom:2px solid #c1370e;
    }
     .btn.green{
      background-color: #298A08;
      border-bottom:5px solid #165195;
    }
    .btn.green:active{
      border-bottom:2px solid #165195;
    }
	.btn.pink{
      background-color: #FE2E64;
      border-bottom:5px solid #165195;
    }
    .btn.pink:active{
      border-bottom:2px solid #165195;
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
<div>
<h1>레시피 추천</h1>
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
     <td align="center"><div class="imgin"><a href="/teamProject3/recipeView.do?recipe_number=${recipelist.recipe_number}"><img class="inimg" src="/teamProject3/images/${recipelist.main_img}">
     <br>
     ${recipelist.recipe_name}<br>
     ${recipelist.member_id}</a></div></td>
    <c:if test="${i%j == j-1}">
     </tr>
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
 <a class="btn green" href="/teamProject3/recipe/recipeInsert.jsp"><button type = "button">레시피 등록</button></a>
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