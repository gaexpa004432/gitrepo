<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Dashboard - Bootstrap Admin Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.3.2/main.min.css" rel="stylesheet">
 <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>

<!-- /subnavbar -->
<div class="main">
  <div class="main-inner">
    <div class="container">
      <div class="row">
        <div class="span6">
       
          <!-- /widget -->
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Recent News</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div id='calendar'>
              </div>
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget -->
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Recent News</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <ul class="news-items">
                <li>
                  
                  <div class="news-item-date"> <span class="news-item-day">29</span> <span class="news-item-month">Aug</span> </div>
                  <div class="news-item-detail"> <a href="http://www.egrappler.com/thursday-roundup-40/" class="news-item-title" target="_blank">Thursday Roundup # 40</a>
                    <p class="news-item-preview"> This is our web design and development news series where we share our favorite design/development related articles, resources, tutorials and awesome freebies. </p>
                  </div>
                  
                </li>
                <li>
                  
                  <div class="news-item-date"> <span class="news-item-day">15</span> <span class="news-item-month">Jun</span> </div>
                  <div class="news-item-detail"> <a href="http://www.egrappler.com/retina-ready-responsive-app-landing-page-website-template-app-landing/" class="news-item-title" target="_blank">Retina Ready Responsive App Landing Page Website Template – App Landing</a>
                    <p class="news-item-preview"> App Landing is a retina ready responsive app landing page website template perfect for software and application developers and small business owners looking to promote their iPhone, iPad, Android Apps and software products.</p>
                  </div>
                  
                </li>
                <li>
                  
                  <div class="news-item-date"> <span class="news-item-day">29</span> <span class="news-item-month">Oct</span> </div>
                  <div class="news-item-detail"> <a href="http://www.egrappler.com/open-source-jquery-php-ajax-contact-form-templates-with-captcha-formify/" class="news-item-title" target="_blank">Open Source jQuery PHP Ajax Contact Form Templates With Captcha: Formify</a>
                    <p class="news-item-preview"> Formify is a contribution to lessen the pain of creating contact forms. The collection contains six different forms that are commonly used. These open source contact forms can be customized as well to suit the need for your website/application.</p>
                  </div>
                  
                </li>
              </ul>
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget --> 
        </div>
        <!-- /span6 -->
        <div class="span6">
          
          <!-- /widget -->
          <div class="widget">
            <div class="widget-header"> <i class="icon-signal"></i>
              <h3> Area Chart Example</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content" id="scroll" style="min-height:500px;max-height:500px;overflow:auto">
            
            <ul class="messages_layout" id="messageWindow">
            <c:if test="${sessionScope.id == 'vegan'}">
            <c:set var="image" value="message_avatar1.png"></c:set>
            </c:if>
            <c:if test="${sessionScope.id == 'manager'}">
            <c:set var="image" value="message_avatar2.png"></c:set>
            </c:if>
             <c:if test="${sessionScope.id == 'manager'}">
            <c:set var="partner" value="message_avatar1.png"></c:set>
            </c:if>
            <c:if test="${sessionScope.id == 'vegan'}">
            <c:set var="partner" value="message_avatar2.png"></c:set>
            </c:if>
            <c:forEach items="${chatList}" var="list" >
 
            <c:if test="${list.member_id eq sessionScope.id }">
            <li class="by_myself right" style="width:85%"> <a href="#" class="avatar"><img src="/resources/img/${image}" /></a>
                  <div class="message_wrap" style='float:right' > <span class="arrow"></span>
                    <div class="info"> <a class="name">${list.member_id} </a> 
                      
                    </div>
                    <div class="text">${list.member_name}</div>
                  </div>
                </li>
            </c:if>
                 <c:if test="${list.member_id ne sessionScope.id }">
            <li class="from_user left" style="width:85%"> <a href="#" class="avatar"><img src="/resources/img/${partner}" /></a>
                  <div class="message_wrap"> <span class="arrow"></span>
                    <div class="info"> <a class="name">${list.member_id} </a> 
                      
                    </div>
                    <div class="text">${list.member_name}</div>
                  </div>
                </li>
            </c:if>
            </c:forEach>
            </ul>
            

              <!-- /area-chart --> 
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget -->
    
          <!-- /widget --> 
 
 <input id="inputMessage" type="text" style="width:85%"/>
        <input type="submit" value="send" onclick="send()" />
 
        
            </div>
            <!-- /widget-content --> 
          
 
 
 
          <!-- /widget -->
        </div>
        <!-- /span6 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /main-inner --> 
</div>
<!-- /main -->

<!--  -->
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
                            <li><a href="">Open Source jQuery Plugins</a></li>
                            <li><a href="">HTML5 Responsive Tempaltes</a></li>
                            <li><a href="">Free Contact Form Plugin</a></li>
                            <li><a href="">Flat UI PSD</a></li>
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
        <div class="span12"> &copy; 2013 <a href="#">Bootstrap Responsive Admin Template</a>. </div>
        <!-- /span12 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /footer-inner --> 
</div>

<script language="javascript" type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.3.2/main.min.js"></script>
 
<script src="/resources/js/base.js"></script>
<script>     

 
$("#inputMessage").keyup(function(e){
	if(e.keyCode == 13){ 
		send();
	} 
	});

        $(document).ready(function() {
        
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl,{
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
          },
          selectable: true,
          selectHelper: true,
          select: function(start, end, allDay) {
            var title = prompt('Event Title:');
            if (title) {
              calendar.fullCalendar('renderEvent',
                {
                  title: title,
                  start: start,
                  end: end,
                  allDay: allDay
                },
                true // make the event "stick"
              );
            }
            calendar.fullCalendar('unselect');
          },
          editable: true,
          events: [
            {
              title: 'All Day Event',
              start: new Date(y, m, 1)
            },
            {
              title: 'Long Event',
              start: new Date(y, m, d+5),
              end: new Date(y, m, d+7)
            },
            {
              id: 999,
              title: 'Repeating Event',
              start: new Date(y, m, d-3, 16, 0),
              allDay: false
            },
            {
              id: 999,
              title: 'Repeating Event',
              start: new Date(y, m, d+4, 16, 0),
              allDay: false
            },
            {
              title: 'Meeting',
              start: new Date(y, m, 10, 10, 30),
              allDay: false
            },
            {
              title: 'Lunch',
              start: new Date(y, m, d, 12, 0),
              end: new Date(y, m, d, 14, 0),
              allDay: false
            },
            {
              title: 'Birthday Party',
              start: new Date(y, m, d+1, 19, 0),
              end: new Date(y, m, d+1, 22, 30),
              allDay: false
            },
            {
              title: 'EGrappler.com',
              start: new Date(y, m, 28),
              end: new Date(y, m, 29),
              url: 'http://EGrappler.com/'
            }
          ]
        });
        calendar.render();
       
      });
        
      
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://localhost:80/broadcasting');
        var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
      onError(event)
    };

    webSocket.onopen = function(event) {
      onOpen(event)
    };

    webSocket.onmessage = function(event) {
      onMessage(event)
    };

    function onMessage(event) {
    	console.log(event.data.indexOf(","))
    	var id = event.data.substr(0,event.data.indexOf(","));
    	var content = event.data.substring(event.data.indexOf(",")+1,event.data.length);
    	
        $("#messageWindow").append($("<li>").attr("class","from_user left").css("width","85%").html("<a href='#' class='avatar'><img src='/resources/img/${partner}'/></a><div class='message_wrap'> <span class='arrow'></span><div class='info'> <a class='name'>"+id+"</a><span></span></div><div class='text'> " + content +" </div></div>"))
        ;
        $("#scroll").scrollTop($("#scroll")[0].scrollHeight);
    }

    function onOpen(event) {
    	 $("#messageWindow").append($("<div>").text("${sessionScope.id} 님 환영합니다."));
    	 $("#scroll").scrollTop($("#scroll")[0].scrollHeight);
    }

    function onError(event) {
      alert(event.data);
    }

    function send() {
        $("#messageWindow").append($("<li>").attr("class","by_myself right").css("width","85%").attr("align","right").html("<a href='#' class='avatar'><img src='/resources/img/${image}'/></a><div class='message_wrap' style='float:right'> <span class='arrow'></span><div class='info'> <a class='name'>${sessionScope.id}</a><span></span></div><div class='text' align='left'> " + inputMessage.value +" </div></div>"))
        ;
        var chat =inputMessage.value;
		var data =["${sessionScope.id}", inputMessage.value];
        webSocket.send(data);
        inputMessage.value = "";
		$.ajax({
			 url: "/ajaxChatInsert", 
			    data: {member_id:"${sessionScope.id}",member_name:chat},
			    method : "POST",
		    success: function() { 
				
		    },
		    error:function(xhr, status, message) { 
		    }
		   
	})
        $("#scroll").scrollTop($("#scroll")[0].scrollHeight);
    }
  </script>
</body>
</html>