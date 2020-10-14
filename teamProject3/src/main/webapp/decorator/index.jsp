<%@ page language="java" contentType="text/html; charset=UTF-8 " isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <head>
  
    <title>Vegan - For Vegan , For Free!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
    h1, h2, h3, h4, h5, h6 {
  margin-top: 0;
  margin-bottom: 0.5rem; }
  
  p {
  margin-top: 0;
  margin-bottom: 1rem; }
  
  a {
  color: #007bff;
  text-decoration: none;
  background-color: transparent; }
  a:hover {
    color: #0056b3;
    text-decoration: underline; }

a:not([href]):not([tabindex]) {
  color: inherit;
  text-decoration: none; }
  a:not([href]):not([tabindex]):hover, a:not([href]):not([tabindex]):focus {
    color: inherit;
    text-decoration: none; }
  a:not([href]):not([tabindex]):focus {
    outline: 0; }
  
  button {
  border-radius: 0; }

button:focus {
  outline: 1px dotted;
  outline: 5px auto -webkit-focus-ring-color; }

input,
button,
select,
optgroup,
textarea {
  margin: 0;
  font-family: inherit;
  font-size: inherit;
  line-height: inherit; }

input {
  overflow: visible; }

select {
  text-transform: none; }

input[type="radio"],
input[type="checkbox"] {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  padding: 0; }

  h1, h2, h3, h4, h5, h6,
.h1, .h2, .h3, .h4, .h5, .h6 {
  margin-bottom: 0.5rem;
  font-family: inherit;
  font-weight: 500;
  line-height: 1.2;
  color: inherit;
  font-color : #FFF; }

h1, .h1 {
  font-size: 2.5rem; 
  font-color : #fff;
  }

h2, .h2 {
  font-size: 2rem; }

h3, .h3 {
  font-size: 1.75rem; }

h4, .h4 {
  font-size: 1.5rem; }

h5, .h5 {
  font-size: 1.25rem; }

h6, .h6 {
  font-size: 1rem; }
  
.padding_test {
	padding-top : 3%;
}

.img-fluid {
  max-width: 20%;
  height: auto;
}

.rounded-circle {
  border-radius: 50% !important;
}






.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a{
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

/* .dropdown-content a:hover {
  background-color: #ddd;
}
 */
.dropdown:hover .dropdown-content {
  display: block;
}


    </style>
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
      <script	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

	 
    <decorator:head></decorator:head>
  </head>
  <body>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">Vegan</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="/teamProject3/guide/guide.jsp" class="nav-link">Guide</a></li>
	          <li class="nav-item"><a href="/teamProject3/recipeBoard.do" class="nav-link">Reciepe</a></li>
	          <li class="nav-item"><a href="/teamProject3/freeBoardList.do" class="nav-link">Board</a></li>
	          <li class="nav-item"><a href="/teamProject3/qaBoardList.do" class="nav-link">QaBoard</a></li>
	          <li class="nav-item"><a href="/teamProject3/restaurantBoard.do" class="nav-link">Recommands</a></li>
	          <li class="nav-item"><a href="/teamProject3/eventBoardList.do" class="nav-link">Event</a></li>
	          <c:choose>
		          <c:when test="${empty sessionScope.login.member_id}">
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/member/memberInsert.jsp" class="nav-link">Join</a></li>
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/member/memberLogin.jsp" class="nav-link">Login</a></li>
		          </c:when>
		          <c:when test="${not empty sessionScope.login.member_id}">
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/member/myPage.jsp" class="nav-link">MyPage</a></li>
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/logout.do" class="nav-link">Logout</a></li> 
		          	  <li class="nav-item"><a class="nav-link">${sessionScope.login.member_id}님</a></li>
		          	  <li class="nav-item">
		          	  	<div class="dropdown">
		          	  		<a type="button" class="dropbtn">
		          	  			<i class="fa fa-caret-down"><img src="${pageContext.request.contextPath}/images/우주하마.jpg" class="img-raised rounded-circle img-fluid"></i>
		          	  		</a>	
		          	  		<div class="dropdown-content">
						      <a id="link" href="#">Link 1</a>
						      <a id="link" href="#">Link 2</a>
						      <a id="link" href="#">Link 3</a>
						    </div>
		          	  	</div>
		          </c:when>
	          </c:choose>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
    <div class="hero-wrap ftco-degree-bg" style="background-image: 
    url('${pageContext.request.contextPath}/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text justify-content-center align-items-center">
          <div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-end">
          	<div class="text text-center">
	            <h1 class="mb-4">Vegan <br>For free, Enjoy it NOW!</h1>
	            <p style="font-size: 18px;">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts</p>
	            <form action="#" class="search-location mt-md-5">
		        		<div class="row justify-content-center">
		        			<div class="col-lg-10 align-items-end">
		        				<div class="form-group">
		          				<div class="form-field">
				                <input type="text" class="form-control" placeholder="Search Reciepe">
				                <button><span class="ion-ios-search"></span></button>
				              </div>
			              </div>
		        			</div>
		        		</div>
		        	</form>
            </div>
          </div>
        </div>
      </div>
      <div class="padding_test">
      <br>
      <br>
      <br>
      </div>
      <div class="container">
            <decorator:body/>
      </div>
  <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
  <script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.timepicker.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/scrollax.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/main.js"></script>  
  </body>
</html>