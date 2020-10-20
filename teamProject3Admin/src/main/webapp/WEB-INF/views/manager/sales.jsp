<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
	<script
	src="//cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
  <script>
$(function(){
	var myBarChart;
	var arrayDate = new Array();
	var arraytotal = new Array();
var ctx = document.getElementById("myChart").getContext('2d');
var canvas = document.getElementById("myChart");  
	chart();
	$(document).ready( function () {
	    $('#tb').DataTable({
	    	info: false,
	    	
	    	
	    });
	} );
	
	$(".start").change(function(){
		var group = $(".start").eq(0).val();
		var sy = $(".start").eq(1).val().substring(0,4);
		var sm = $(".start").eq(1).val().substring(5,7);
		var sd = $(".start").eq(1).val().substring(8,10);
		var ey = $(".start").eq(2).val().substring(0,4);
		var em = $(".start").eq(2).val().substring(5,7);
		var ed = $(".start").eq(2).val().substring(8,10);
		
		var start = new Date(sy,sm,sd);
		var end = new Date(ey,em,ed);
		console.log(group)
	if(start > end || $(".start").eq(1).val() == ''){
		console.log("제대로 입력해라잉")
	}else{
		
		if(group == 0){
		$.ajax({
			 url: "/ajaxDay", 
			    data: {order_date:$(".start").eq(1).val(),order_total:$(".start").eq(2).val()},
			    method : "POST",
		    success: function(data) {
		    	for(i = 0 ; i < data.length;i++){
		    		arrayDate[i] = data[i].order_date;
		    		arraytotal[i] =  data[i].order_total;
		    	}
		    	myBarChart.destroy();
		    	chart()
		    },
		    error:function(xhr, status, message) { 
		    }
		   
	})
		
		}
		
		if(group == 1){
			$.ajax({
				 url: "/ajaxMonth", 
				    data: {order_date:$(".start").eq(1).val(),order_total:$(".start").eq(2).val()},
				    method : "POST",
			    success: function(data) {
			    		console.log(data)
			    	for(i = 0 ; i < data.length;i++){
			    		arrayDate = new Array();
			    		arraytotal = new Array();
			    		arrayDate[i] = data[i].order_date;
			    		arraytotal[i] =  data[i].order_total;
			    		console.log(arrayDate)
			    		console.log(arraytotal)
			    	}
			    		myBarChart.destroy();
			    	chart()
			    },
			    error:function(xhr, status, message) { 
			    }
			   
		})
		
		}
	}
	
	
	
	})
	
function chart(){
	  var data = {
	    labels:arrayDate,
	    datasets: [
	        {
	            label: ['first'],
	            data:arraytotal,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	               
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	        
	            ],
	            borderWidth: 1
	        }
	    ]
	};

var options = {
	    animation: {
	        animateScale: true
	    },
	    responsive: true,
	    scales: {
	        yAxes: [
	            {
	                ticks: {
	                    beginAtZero: true                                                                    
	                }
	            }
	        ]
	    }
	};


myBarChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});
	}
	
})
</script>
</head>
<body>
   
    
    <div class="main">
        <div class="main-inner">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div class="widget">
                            <div class="widget-header">
                                <i class="icon-bar-chart"></i>
                                <h3>
                                    Bar Chart</h3>
                            </div>
                            <!-- /widget-header -->
                            <div class="widget-content">
                                <canvas id="myChart" class="chart-holder" width="538" height="250">
                                </canvas>
                                <!-- /bar-chart -->
                            </div>
                            <!-- /widget-content -->
                        </div>
                      
                        
                        <!-- /widget -->
                    </div>
                    구분 <select class="start">
               	<option value="0">일별 </option>
               	<option value="1">월별 </option>    
               </select>
                    시작 날짜: <input type="date" class="start"> 종료 날짜 : <input type="date" class="start" value="2020-10-23">
                      
                      
                   
                
                	<table id="tb" class="table table-striped table-bordered">
		<thead><tr><th>소상공인 번호</th><th>소상공인 아이디</th><th>전화번호</th><th>이메일</th><th>판매총액</th></tr></thead>
	<tbody>
<c:forEach items="${sales }" var="member">
	<tr>
	<td>${member.seller_code }</td>
	<td>${member.member_id }</td>
	<td>${member.member_tel }</td>
	<td>${member.member_email }</td>
	<td>${member.order_total }</td>
	</tr>
</c:forEach>
	</tbody>
	</table>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /main-inner -->
    </div>
    <!-- /main -->
    <div class="extra">
        <div class="extra-inner">
            <div class="container">
                <div class="row">
                    <div class="span3">
                        <h4>
                            About Free Admin Template</h4>
                        <ul>
                            <li><a href="javascript:;">EGrappler.com</a></li>
                            <li><a href="javascript:;">Web Development Resources</a></li>
                            <li><a href="javascript:;">Responsive HTML5 Portfolio Templates</a></li>
                            <li><a href="javascript:;">Free Resources and Scripts</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Support</h4>
                        <ul>
                            <li><a href="javascript:;">Frequently Asked Questions</a></li>
                            <li><a href="javascript:;">Ask a Question</a></li>
                            <li><a href="javascript:;">Video Tutorial</a></li>
                            <li><a href="javascript:;">Feedback</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Something Legal</h4>
                        <ul>
                            <li><a href="javascript:;">Read License</a></li>
                            <li><a href="javascript:;">Terms of Use</a></li>
                            <li><a href="javascript:;">Privacy Policy</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Open Source jQuery Plugins</h4>
                        <ul>
                            <li><a href="#">Open Source jQuery Plugins</a></li>
                            <li><a href="#">HTML5 Responsive Tempaltes</a></li>
                            <li><a href="#">Free Contact Form Plugin</a></li>
                            <li><a href="#">Flat UI PSD</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /extra-inner -->
    </div>
    <!-- /extra -->
    <div class="footer">
        <div class="footer-inner">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        &copy; 2013 <a href="#">Bootstrap Responsive Admin Template</a>.
                    </div>
                    <!-- /span12 -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /footer-inner -->
    </div>
    <!-- /footer -->
    <!-- Le javascript
================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
 

</body>
</html>