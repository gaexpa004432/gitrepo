<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Vegan Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
<link href="/resources/css/font-awesome.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/pages/dashboard.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="index.html">Vegan Admin </a>
      <div class="nav-collapse">
        <ul class="nav pull-right">
          
          <li><a href="/teamProject3/freeBoardList.do"><i class="icon-info-sign"></i> 홈페이지로 이동<b></b></a>
           
          </li>
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-cog"></i> 계정 관리 <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="javascript:;">Profile</a></li>
              <li><a href="javascript:;">Logout</a></li>
            </ul>
        </ul>
        <form class="navbar-search pull-right">
          <input type="text" class="search-query" placeholder="Search">
        </form>
      </div>
      <!--/.nav-collapse --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /navbar-inner --> 
</div>
<!-- /navbar -->
<div class="subnavbar">
  <div class="subnavbar-inner">
    <div class="container">
      <ul class="mainnav">
        <li ><a class="pick" href="/"><i class="icon-home"></i><span>메인</span> </a> </li>
        <li ><a class="pick" href="/salesList"><i class="icon-money"></i><span>매출 통계</span> </a> </li>
        <li><a class="pick" href="/memberList"><i class="icon-group"></i><span>회원 관리</span> </a></li>
        <li><a class="pick" href="/recipeList"><i class="icon-book"></i><span>레시피 승인</span> </a> </li>
        <li><a class="pick" href="/boardList"><i class="icon-envelope-alt"></i><span>문의 확인</span> </a> </li>
        <li><a href="javascript:;" class="dropdown-toggle" > <i></i><span></span></b></a></li>
      </ul>
    </div>
   </div>
    <!-- /container --> 
  </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/excanvas.min.js"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<script src="/resources/js/base.js"></script> 
   <tiles:insertAttribute name="content"/>
<script type="text/javascript">

		$(function(){
			if(${index == 1}){
				$(".pick").eq(0).parent().attr("class","active");
			}
			if(${index == 2}){
				$(".pick").eq(1).parent().attr("class","active");
			}
			if(${index == 3}){
				$(".pick").eq(2).parent().attr("class","active");
			}
			if(${index == 4}){
				$(".pick").eq(3).parent().attr("class","active");
			}
			if(${index == 5}){
				$(".pick").eq(4).parent().attr("class","active");
			}

			
		})
</script>
  
    </body>
</html>