<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<style>
ul {
  margin: 0;
  padding: 0;
  list-style: none;
}
li {
  width: 200px;
  background-color: #f8f8f8;
  height: 200px;
  color: #444;
  line-height: 100px;
  text-align: center;
  font-size: 30px;
  text-transform: uppercase;
}



</style>
<script>
$(function(){ 
function itemActive($el) {
	  $el.siblings().removeClass('active');
	  
	}
	var settings = {
	  slideWidth: 235,
	  slideMargin: 10,
	  minSlides: 1,
	  maxSlides: 5,
	  infiniteLoop: true,
	  responsive: true,
	  controls: true,
	  pager: false,
	  moveSlides: 1,
	  hideControlOnEnd: true,
	  onSlideNext: function($slideElement, oldIndex, newIndex) {
	    itemActive($slideElement);
	  },
	  onSlidePrev: function($slideElement, oldIndex, newIndex) {
	    itemActive($slideElement);
	  }
	}

	var bxSlider = $('.bxslider').bxSlider(settings);
	console.log(bxSlider);
	$('.bxslider li').click(function(){
	  $(this).siblings('li').removeClass('active');
	  $(this).addClass('active');
	  bxSlider.goToSlide($(this).index());
	  
	})
});
</script>
</head>
<body>
<ul class="bxslider">
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>Four</li>
  <li>Five</li>
  <li>six</li>
  <li>seven</li>
  <li>eight</li>
  <li>nine</li>
  <li>ten</li>
</ul>
</body>
</html>