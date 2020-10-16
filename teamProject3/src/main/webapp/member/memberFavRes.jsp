<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>memberFavorite.jsp</title>
<style>
	img.a {
		max-width : 700px;
		max-height : 300px;
		background-size : contain;	
	}
</style>
</head>


<body>
<input type="hidden" name="fav" value="fs">
	<div class="dropdown">
	  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          즐겨찾기 선택
	  </a>
	
	  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	    <a class="dropdown-item" href="${pageContext.request.contextPath}/favList.do?fav=fs">즐겨찾는 식당</a>
	    <div class="dropdown-divider"></div>
	    <a class="dropdown-item" href="${pageContext.request.contextPath}/favList.do?fav=fr">즐겨찾는 레시피</a>
	  </div>
	</div>
	<%-- <div class="dropdown">
    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
     	즐겨찾기 선택
    </button>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="${pageContext.request.contextPath}/favList.do?fav=fs">즐겨찾는 식당</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="${pageContext.request.contextPath}/favList.do?fav=fr">즐겨찾는 레시피</a>
    </div>
  </div> --%>
  
 <div class="container">
==============================================================
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">내가 즐겨찾는
      <big>식당</big>
    </h1>
    <ol class="breadcrumb">
      <li class="breadcrumb-item active">RESTAURANT</li>
    </ol>
    <div class="row">
    <c:forEach items="${fs}" var="fs">
      <div class="col-lg-6 portfolio-item">
        <div class="card h-100">
          <a href="${pageContext.request.contextPath}/restaurantView.do?res_no=${fs.res_no}"><img class="card-img-top a" src="images/${fs.res_pic_name}" alt="" ></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="${pageContext.request.contextPath}/restaurantView.do?res_no=${fs.res_no}">${fs.res_name}</a>
            </h4>
            <p class="card-text">${fs.res_content}</p>
          </div>
        </div>
      </div>
    </c:forEach>
    </div>
</div>
    <!-- /.row -->

    <!-- Pagination -->
<form name = "pageFrm">
	<input type="hidden" name="p" value="1">
	<input type="hidden" name="fav" value="fs">
	<my:favTag paging="${paging}" jsfunc="gopage"/>
</form>
  <!-- /.container -->
<script>
	function gopage(p) {
		pageFrm.p.value = p;
		pageFrm.submit();
		//location.href="deptSelectAll?p=" + p;
	}
</script>
</body>
</html>