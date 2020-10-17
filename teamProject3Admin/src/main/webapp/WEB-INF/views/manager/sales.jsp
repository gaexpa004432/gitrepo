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
	$(document).ready( function () {
	    $('#tb').DataTable({
	    	info: false,
	    	
	    	
	    });
	} );
	
	
})
</script>
</head>
<body>
   
    
    <div class="main">
        <div class="main-inner">
            <div class="container">
                <div class="row">
                    <div class="span6">
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
                    
                      
                      
                    <!-- /span6 -->
                    <div class="span6">
                        <div class="widget">
                            <div class="widget-header">
                                <i class="icon-bar-chart"></i>
                                <h3>
                                    Donut Chart</h3>
                            </div>
                            <!-- /widget-header -->
                            <div class="widget-content">
                                <canvas id="donut-chart" class="chart-holder" width="538" height="250">
                                </canvas>
                                <!-- /bar-chart -->
                            </div>
                            <!-- /widget-content -->
                        </div>
                        <!-- /widget -->
                        
                           
                            <!-- /widget-header -->
                           
                              
                              
                            
                            <!-- /widget-content -->
                        
                        <!-- /widget -->
                    </div>
                    <!-- /span6 -->
                </div>
                
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
 
    <script>

    var data = {
    	    labels:${date},
    	    datasets: [
    	        {
    	            label: ['일별 데이터 '],
    	            data:${data},
    	            backgroundColor: [
    	                'rgba(255, 99, 132, 0.2)',
    	                'rgba(54, 162, 235, 0.2)',
    	                'rgba(255, 206, 86, 0.2)',
    	                'rgba(75, 192, 192, 0.2)',
    	                'rgba(153, 102, 255, 0.2)',                                                               
    	                'rgba(255, 159, 64, 0.2)'
    	            ],
    	            borderColor: [
    	                'rgba(255,99,132,1)',
    	                'rgba(54, 162, 235, 1)',
    	                'rgba(255, 206, 86, 1)',
    	                'rgba(75, 192, 192, 1)',
    	                'rgba(153, 102, 255, 1)',
    	                'rgba(255, 159, 64, 1)'
    	            ],
    	            borderWidth: 1
    	        }
    	    ]
    	};
    
    var options = {
    	    animation: {
    	        animateScale: true
    	    },
    	    responsive: false,
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

    
    var ctx = document.getElementById("myChart").getContext('2d');                                           
    var myBarChart = new Chart(ctx, {
        type: 'bar',
        data: data,
        options: options
    });

    

        var doughnutData = [
				{
				    value: 30,
				    color: "#F7464A"
				},
				{
				    value: 50,
				    color: "#46BFBD"
				},
				{
				    value: 100,
				    color: "#FDB45C"
				},
				{
				    value: 40,
				    color: "#949FB1"
				},
				{
				    value: 120,
				    color: "#4D5360"
				}

			];

        var myDoughnut = new Chart(document.getElementById("donut-chart").getContext("2d")).Doughnut(doughnutData);


        var lineChartData = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [
				{
				    fillColor: "rgba(220,220,220,0.5)",
				    strokeColor: "rgba(220,220,220,1)",
				    pointColor: "rgba(220,220,220,1)",
				    pointStrokeColor: "#fff",
				    data: [65, 59, 90, 81, 56, 55, 40]
				},
				{
				    fillColor: "rgba(151,187,205,0.5)",
				    strokeColor: "rgba(151,187,205,1)",
				    pointColor: "rgba(151,187,205,1)",
				    pointStrokeColor: "#fff",
				    data: [28, 48, 40, 19, 96, 27, 100]
				}
			]

        }

        var myLine = new Chart(document.getElementById("area-chart").getContext("2d")).Line(lineChartData);


        var barChartData = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [
				{
				    fillColor: "rgba(220,220,220,0.5)",
				    strokeColor: "rgba(220,220,220,1)",
				    data: [65, 59, 90, 81, 56, 55, 40]
				},
				{
				    fillColor: "rgba(151,187,205,0.5)",
				    strokeColor: "rgba(151,187,205,1)",
				    data: [28, 48, 40, 19, 96, 27, 100]
				}
			]

        }

var myLine = new Chart(document.getElementById("bar-chart").getContext("2d")).Bar(barChartData);

var pieData = [
				{
				    value: 30,
				    color: "#F38630"
				},
				{
				    value: 50,
				    color: "#E0E4CC"
				},
				{
				    value: 100,
				    color: "#69D2E7"
				}

			];

				var myPie = new Chart(document.getElementById("pie-chart").getContext("2d")).Pie(pieData);

				var chartData = [
			{
			    value: Math.random(),
			    color: "#D97041"
			},
			{
			    value: Math.random(),
			    color: "#C7604C"
			},
			{
			    value: Math.random(),
			    color: "#21323D"
			},
			{
			    value: Math.random(),
			    color: "#9D9B7F"
			},
			{
			    value: Math.random(),
			    color: "#7D4F6D"
			},
			{
			    value: Math.random(),
			    color: "#584A5E"
			}
		];
				var myPolarArea = new Chart(document.getElementById("line-chart").getContext("2d")).PolarArea(chartData);
	</script>
</body>
</html>