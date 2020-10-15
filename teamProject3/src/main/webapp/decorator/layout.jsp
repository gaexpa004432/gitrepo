<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
     <!-- Js Plugins -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    
    
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
</head>

<style>
.img-fluid {
  max-width: 40%;
  height: auto;
}

.rounded-circle {
  border-radius: 50% !important;  
}

#mainImg{

}

#subUl{
	position: absolute;
	background : #green;
}

#subUl > li {
	padding: 16px 28px;
	border-botton : 1px solid rgba(0,0,0,0.15);
}

#subUl > li > a {
	font-size : 0.85rem;
	color : rgba(255,255,255,0.85);
	text-align : center;
	letter-spacing: 0.05em;
	display : block;
	padding : 12px 24px; 
	color : rgba(255,255,255,0.6);
	text-decoration : none;
}

.header__menu ul li{
	margin-right: 30px;
	margin-left: 30px;
	
}

.hero__search__form {
	width: 610px;
	height: 50px;
	border: 1px solid #ebebeb;
	position: relative;
	float: none;
	margin:0 auto;
}

.aa {
	display : inline-block;
	height:100%;
	position:absolute;
	width: 100px;
}

.header__cart ul li {
	margin:0, 5px, 0, 0 auto;
	float: left;
}
</style>
<script>
$(function() {
	$("#mainImg").on("click", function() {
		console.log($(this))
	})
});
</script>
<decorator:head></decorator:head>
<body>
    
    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
           	<div class="container">
           		<div class="row">
                    <div class="col-lg-6 col-md-6">
                        
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            
                           <div class="header__top__right__language">
			               		<c:choose>
				               		<c:when test="${empty sessionScope.login.member_id}">
				                	<img style ="width:20px" src="${pageContext.request.contextPath}/img/login_icon.png" alt="">
						                <div>  Join & Login  </div>
						                <span class="arrow_carrot-down"></span>
							                <ul>
							                    <li><a href="${pageContext.request.contextPath}/member/memberInsert.jsp">Join</a></li>
							                    <li><a href="${pageContext.request.contextPath}/member/memberLogin.jsp">Login</a></li>
							                </ul>
					                </c:when>
					                <c:when test="${not empty sessionScope.login.member_id}">
					                <img style ="width:20px" src="${pageContext.request.contextPath}/img/logout_icon.png" alt="">
					                	<div>  LogOut  </div>
					                	<span class="arrow_carrot-down"></span>
							                <ul>
							                    <li><a href="${pageContext.request.contextPath}/logout.do">LogOut</a></li>
							                </ul>
				                	</c:when>
			                	</c:choose>
				            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>  
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="${pageContext.request.contextPath}/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="/teamProject3/">Home</a></li>
                            <li><a href="/teamProject3/guide/guide.jsp">Guide</a></li>
                            <li><a href="#">Board</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="/teamProject3/restaurantBoard.do">Recommands</a></li>
                                    <li><a href="/teamProject3/recipeBoard.do">Receipe</a></li>
                                    <li><a href="/teamProject3/freeBoardList.do">Free Board</a></li>
                                    <li><a href="/teamProject3/qaBoardList.do">QA Board</a></li>
                                </ul> 
                            </li>
                            <li><a href="/teamProject3/eventBoardList.do">Event</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart ">
                    <c:if test="${not empty sessionScope.login.member_id}">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>즐겨찾기개수</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>장바구니개수</span></a></li>
               		    </ul>
               		    <div class="aa header__top__right__language">
	                	<img id="mainImg" src="./img/우주하마.jpg" class="img-raised rounded-circle img-fluid">
			                <div>${sessionScope.login.member_id}</div>
			                <span class="arrow_carrot"></span>
			                <ul>
			                    <li><a href="${pageContext.request.contextPath}/member/myPage.jsp">My Page</a></li>
			                    <li><a href="#">My Photo</a></li>
			                </ul>
			           </div>
					</c:if>         
                    </div>
                </div>
            </div>
            <div class="humberger__open ">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>  
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
               <div class="col-lg-12">
                    <div class="hero__search " >
                        <div class="hero__search__form">
                            <form action="#">
                                <!-- <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div> -->
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <!-- <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div> -->
                    </div>
                   <!--  <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
                        <div class="hero__text">
                            <span>FRUIT FRESH</span>
                            <h2>Vegetable <br />100% Organic</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="#" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div> -->
                </div>
            </div>
        </div> 
    </section>
    <!-- Hero Section End -->




 <decorator:body/>
 
</body>
</html>