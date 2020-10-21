<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>ㄴ
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>myPageMain.jsp</title>

<!-- Third party plugin CSS-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/teamProject3/member/TestMain/css/myPageCss.css" rel="stylesheet" />

</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="/teamProject3/img/KakaoTalk_20201015_173926849.jpg" style="background-image:url('/teamProject3/img/sd.jpg')"> <!-- 여기있는 이미지 경로를 바꾸시면 됩니다. -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2 >마이페이지 목록</h2>
                        <div class="breadcrumb__option">
                            <a href="/teamProject3/member/myPageMain.jsp">마이페이지</a>
                            <span>HOME</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<!-- Portfolio-->
	<div class="container">
	<hr>
        <div id="portfolio">
            <div class="container-fluid p-0">
                <div class="row no-gutters">
                    <div class="col-4">
                        <a class="portfolio-box" href="${pageContext.request.contextPath}/select.do">
                            <img class="img-fluid1" src="/teamProject3/images/apple-1.png" alt="" />
                            <div class="portfolio-box-caption">
                                <!-- <div class="project-category text-white-50">마이페이지</div> -->
                                <div class="project-name">내 정보 조회 및 수정</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-4 ">
                        <a class="portfolio-box" href="${pageContext.request.contextPath}/favList.do?fav=fs">
                            <img class="img-fluid1" src="/teamProject3/images/avocado.png" alt="" />
                            <div class="portfolio-box-caption">
                                <!-- <div class="project-category text-white-50">Category</div> -->
                                <div class="project-name">나의 즐겨찾기</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-4">
                    <c:choose>
						<c:when test="${sessionScope.login.seller_code != 0}">
	                        <a class="portfolio-box" href="${pageContext.request.contextPath}/ansList.do">
	                            <img class="img-fluid1" src="/teamProject3/images/peach.png" alt="" />
	                            <div class="portfolio-box-caption">
	                                <!-- <div class="project-category text-white-50">Category</div> -->
	                                <div class="project-name">1:1 문의</div>
	                            </div>
	                        </a>
	                    </c:when>
	                    <c:when test="${sessionScope.login.seller_code == 0}">
	                    	<a class="portfolio-box" href="${pageContext.request.contextPath}/inqList.do">
	                            <img class="img-fluid1" src="/teamProject3/images/groceries.png" alt="" />
	                            <div class="portfolio-box-caption">
	                                <!-- <div class="project-category text-white-50">Category</div> -->
	                                <div class="project-name">1:1 문의</div>
	                            </div>
	                        </a>
	                    </c:when>
	                </c:choose>
                    </div>
                    <div class="col-4 ">
                    	<c:choose>
							<c:when test="${sessionScope.login.seller_code != 0}">
	                        	<a class="portfolio-box" href="/teamproject3/orderList.do">
		                            <img class="img-fluid1" src="/teamProject3/images/lemon.png" alt="" />
		                            <div class="portfolio-box-caption p-3">
		                                <!-- <div class="project-category text-white-50">Category</div> -->
		                                <div class="project-name">주문내역</div>
		                            </div>
		                        </a>
                    		</c:when>
		                    <c:when test="${sessionScope.login.seller_code == 0}">
		                    	<a class="portfolio-box" href="${pageContext.request.contextPath}/mileageController.do">
		                            <img class="img-fluid1" src="/teamProject3/images/grapes.png" alt="" />
		                            <div class="portfolio-box-caption">
		                                <!-- <div class="project-category text-white-50">Category</div> -->
		                                <div class="project-name">마일리지조회</div>
		                            </div>
		                        </a>
                   			</c:when>
	                	</c:choose>
                    </div>
                    <div class="col-4 ">
                    <c:choose>
						<c:when test="${sessionScope.login.seller_code != 0}">
	                        <a class="portfolio-box" href="${pageContext.request.contextPath}/member/memberAddUpdate.jsp">
	                            <img class="img-fluid1" src="/teamProject3/images/banana.png" alt="" />
	                            <div class="portfolio-box-caption">
	                                <!-- <div class="project-category text-white-50">Category</div> -->
	                                <div class="project-name">판매자 정보 수정 및 조회</div>
	                            </div>
	                        </a>
	                    </c:when>
	                    <c:when test="${sessionScope.login.seller_code == 0}">
	                    	<a class="portfolio-box" href="${pageContext.request.contextPath}/member/memberAddInsert.jsp">
	                            <img class="img-fluid1" src="/teamProject3/images/carrot.png" alt="" />
	                            <div class="portfolio-box-caption">
	                                <!-- <div class="project-category text-white-50">Category</div> -->
	                                <div class="project-name">판매자로 등록</div>
	                            </div>
	                        </a>
	                    </c:when>
	                </c:choose>
                    </div>
                    <div class="col-4 ">
                    <c:choose>
						<c:when test="${sessionScope.login.seller_code != 0}">
	                        <a class="portfolio-box" href="${pageContext.request.contextPath}/sellList.do">
	                            <img class="img-fluid1" src="/teamProject3/images/broccoli.png" alt="" />
	                            <div class="portfolio-box-caption p-3">
	                                <!-- <div class="project-category text-white-50">Category</div> -->
	                                <div class="project-name">판매내역</div>
	                            </div>
	                        </a>
	                    </c:when>
	                    <c:when test="${sessionScope.login.seller_code == 0}">
	                    	<a class="portfolio-box" href="/teamproject3/orderList.do">
	                            <img class="img-fluid1" src="/teamProject3/images/lemon.png" alt="" />
	                            <div class="portfolio-box-caption p-3">
	                                <!-- <div class="project-category text-white-50">Category</div> -->
	                                <div class="project-name">주문내역</div>
	                            </div>
	                        </a>
	                    </c:when>
	                </c:choose>
                    </div>
                </div>
            </div>
        </div>
     </div>
</body>
</html>