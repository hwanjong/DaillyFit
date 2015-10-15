<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!--  JQuery UI_Mobile  BootStrap에 JQuery가 필요하므로 먼저호출-->
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

<!--  Bootstrap -->
<link href="/dailyfit/css/bootstrap.min.css" rel="stylesheet">
<link href="/dailyfit/css/common.css" rel="stylesheet">
<script src="/dailyfit/js/bootstrap.min.js"></script>
<title>Dailyfit</title>
<script type="text/javascript">
function menuBar(){
	if ( $("#menuBar" ).is( ":hidden" ) ) {
	    $( "#menuBar" ).slideDown(100,function(){
	    });
	  } else {
	    $( "#menuBar" ).hide();
	  }
}
$(document).ready(function(){
});
</script>
</head>
<body>
<div id="menuBar" class="font" style="display: none;">
	<span class="glyphicon glyphicon-refresh" onclick="location.reload()"></span>
	<span class="glyphicon glyphicon-home" style="border-left :1px solid; border-right: 1px solid;" onclick="location.href='main.ap'"></span>
	<span class="glyphicon glyphicon-off" onclick="javascript:AndroidApp.finishApp();"></span>
</div>
<div data-role="footer" id="footer" data-position="fixed"
		data-tap-toggle="false" class="jqm-footer">
		<img src="/dailyfit/img/icon_1_active.png" onclick="location.href='main.ap'"> 
		<img
			src="/dailyfit/img/icon_2.png" onclick="menuBar()"> <img
			src="/dailyfit/img/icon_3.png"> <img
			src="/dailyfit/img/icon_4.png" onclick="location.href='mypage.ap'">
</div>
	<!-- /footer -->
</body>
</html>