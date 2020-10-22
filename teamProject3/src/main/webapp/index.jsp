<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Insert title here</title>

<!-- Third party plugin CSS-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/teamProject3/member/TestMain/css/myPageCss.css" rel="stylesheet" /> 

<script type="text/javascript">
console.log("${sessionScope.id}")
if(${sessionScope.id eq 'vegan'}){
	location.href="/"; 
}
	
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<!-- <style>
.bxslider li { width:500px; }
</style> -->


<style>
.bxslider li { 
	width:1094px; 
	height:305px;
}
</style>

</head>
<body>
<div class="container">
<ul class="bxslider"> 
<li><img src="images/샐러드레시피.jpg" style="width:100%"/></li>
<li><img src="images/채식정의.png" style="width:100%"/></li>
<li><img src="images/적립금.png" style="width:100%"/></li>
<li><img src="images/커피.jpg" style="width:100%"/></li>
</div>
<script type="text/javascript"> 
$(document).ready(function(){ 
	$('.bxslider').bxSlider({
		auto: true,
		autoControls: true
	});
	});
</script>
<!-- Portfolio-->
	<div class="container">
        <div id="portfolio" style="margin-bottom:200px">
            <div class="container-fluid p-0">
                <div class="row no-gutters">
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/teamProject3/images/비건새송이버섯 바질오일구이 메인.png">
                            <img class="img-fluid1" src="/teamProject3/images/비건새송이버섯 바질오일구이 메인.png" alt="" />
                            <div class="portfolio-box-caption">
                                <!-- <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div> -->   
                         </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/teamProject3/images/비건새우바질볶음밥 메인.png">
                            <img class="img-fluid1" src="/teamProject3/images/비건새우바질볶음밥 메인.png" alt="" />
                            <div class="portfolio-box-caption">
                                <!-- <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div> -->
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/teamProject3/images/비건 오이소박이 메인.png">
                            <img class="img-fluid1" src="/teamProject3/images/비건 오이소박이 메인.png" alt="" />
                            <div class="portfolio-box-caption">
                               <!--  <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div> -->
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/teamProject3/images/비건 카레 메인.png">
                            <img class="img-fluid1" src="/teamProject3/images/비건 카레 메인.png" alt="" />
                            <div class="portfolio-box-caption">
                                <!-- <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div> -->
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/teamProject3/images/머시룸 타코 메인.png">
                            <img class="img-fluid1" src="/teamProject3/images/머시룸 타코 메인.png" alt="" />
                            <div class="portfolio-box-caption">
                                <!-- <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div> -->
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/teamProject3/images/비건쿠키 메인.png">
                            <img class="img-fluid1" src="/teamProject3/images/비건쿠키 메인.png" alt="" />
                            <div class="portfolio-box-caption p-3">
                                <!-- <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div> -->
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
     </div>
</body>
</html> 