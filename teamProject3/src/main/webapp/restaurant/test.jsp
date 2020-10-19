<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>


<title>Dashboard - Bootstrap Admin Template</title>


<script type="text/javascript">
$(function(){
	

$.contextMenu({
    selector: '.left',
    trigger: 'left',
    callback: function(key, options) {
    	console.log($(this).data("member"));
        var m = key;
      
    },
    items: {
        "edit": {name: "1:1 문의하기"},
        "quit": {name: "Quit", icon: function($element, key, item){ return 'context-menu-icon context-menu-icon-quit'; }}
    }
});

})

</script>
</head>
<body>
<input type="button" class="left" value="왼쪽 클릭" data-member="5"/>
<input type="button" class="left" value="왼쪽 클릭" data-member="10"/>

</body>
</html>
