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
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="/dailyfit/css/main.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>

<title>Dailyfit</title>
</head>
<body>
	<div id="headBar" data-role="header" data-position="fixed"
		data-tap-toggle="false" class="jqm-header">
		<span class="glyphicon glyphicon-chevron-left left" aria-hidden="true"
			onclick="javascript:history.go(-1)"></span> <span> Daily FIT</span> <span
			class="glyphicon glyphicon-option-horizontal right"
			aria-hidden="true"></span> <span
			class="glyphicon glyphicon-search right" aria-hidden="true"
			onclick="search();"></span>

	</div>
	<div id="contents" role="main" style="overflow: auto;">
		<div id="carousel-example-generic" class="carousel slide" style="height: 250px;"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" style="height: 100%;" role="listbox">
				<div class="item active" style="height: 100%;">
					<img src="/dailyfit/img/shop1_2.jpg" height="100%" alt="...">
					<div class="carousel-caption">박인찬쌤이 있는 바디 판타지 휘트니스..</div>
				</div>
				<div class="item" style="height: 100%;">
					<img src="/dailyfit/img/shop3_2.png" height="100%" alt="...">
					<div class="carousel-caption">최신시설완비</div>
				</div>
				<div class="item" style="height: 100%;">
					<img src="/dailyfit/img/shop3_1.jpg" height="100%" alt="...">
					<div class="carousel-caption">최신시설완비</div>
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<div data-role="footer" id="footer" data-position="fixed"
		data-tap-toggle="false" class="jqm-footer">
		<img src="/dailyfit/img/icon_1_active.png"> <img
			src="/dailyfit/img/icon_2.png"> <img
			src="/dailyfit/img/icon_3.png"> <img
			src="/dailyfit/img/icon_4.png">
	</div>
	헬스장정보&상품정보 페이지 준비중입니다.
</body>
</html>