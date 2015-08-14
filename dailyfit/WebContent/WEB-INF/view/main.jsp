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

<script type="text/javascript">
	function one() {
		$("#one").show();
		$("#two").hide();

		$(".one").addClass("activeBar");
		$(".two").removeClass("activeBar");
	}
	function two() {
		$("#two").show();
		$("#one").hide();

		$(".two").addClass("activeBar");
		$(".one").removeClass("activeBar");
		
		$(".shop").removeClass("ui-screen-hidden");
		$(".premium").removeClass("ui-screen-hidden");
	}
	function search() {
		two();
		$(".ui-input-search").show();
		$("#divOfPs-input").focus();
	}
	function stopSearch(){
		$(".ui-input-search").hide();
	}
	$(document).ready(function() { // 해당 페이지 Loading 후,
		$(".ui-input-search").hide();
	});
</script>
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
	<div class="tabWrap">
		<div class="eachTab one activeBar " onclick="one()">일일권 구매</div>
		<div class="eachTab two " onclick="two()">주변 헬스장 보기</div>
	</div>
	<div class="tabWrap"
		style="background-color: #a4a596; height: 2px; margin-top: -2px;"></div>
	<div id="contents" role="main" style="overflow: auto;">
		<div id="one" style="height: 100%;">
			<p id="event" class="m1"
				style="color: rgb(231, 76, 60); text-align: center;">OPEN 이벤트!</p>
			<p id="event" class="m1" style="color: #333; text-align: center;">
				5만원 정액권 충전하면 10,000포인트 적립?! <img src="/dailyfit/img/temp_money.PNG">
			</p>

			<div class="item">
				<img src="/dailyfit/img/shop2_item1.jpg">
				<div class=itemTitle>
					<p class="m1">드래곤힐스파 GYM</p>
					<span class="subTitle">1회 이용권 4,400원</span> <span class="post">|
						후기 129개</span>
				</div>
				<div class="distance">4.55km</div>

			</div>
			<div class="item">
				<img src="/dailyfit/img/shop1_item1.jpg">
				<div class=itemTitle>
					<p class="m1">트레보 스포츠 수원점</p>
					<span class="subTitle">1회 이용권 7,000원</span> <span class="post">|
						후기 14개</span>
				</div>
				<div class="distance">15.22km</div>

			</div>
			<div class="item">
				<img src="/dailyfit/img/shop1_item2.jpg">
				<div class=itemTitle>
					<p class="m1">윌e짐 잠실점</p>
					<span class="subTitle">1회 이용권 5,600원</span> <span class="post">|
						후기 9개</span>
				</div>
				<div class="distance">3.48km</div>

			</div>
			<div class="item">
				<img src="/dailyfit/img/shop2_item1.jpg">
				<div class=itemTitle>
					<p class="m1">드래곤힐스파 GYM</p>
					<span class="subTitle">1회 이용권 4,400원</span> <span class="post">|
						후기 129개</span>
				</div>
				<div class="distance">4.55km</div>

			</div>


		</div>
		<div id="two" style="height: 100%; display: none;">
			<input data-type="search" id="divOfPs-input" onblur="stopSearch();">
			<div data-filter="true" data-input="#divOfPs-input" data-inset="true" data-children=">div">
				<div class="premium">
					<img src="/dailyfit/img/shop2_2.jpg"
						style="width: 100%; height: 100%;">
					<p class="left f18">보령스피트니스</p>
					<p class="right bold">13.57km</p>
				</div>
				<div class="shop" >
					트레보스포츠 <span style="font-size: 13px;"
						class="glyphicon glyphicon-map-marker pull-right"
						aria-hidden="true"></span> <span style="font-size: 13px;"
						class="glyphicon glyphicon-camera pull-right" aria-hidden="true"></span>
					<p>3.93km</p>
				</div>
				<div class="shop">
					엑스포헬스 <span style="font-size: 13px;"
						class="glyphicon glyphicon-map-marker pull-right"
						aria-hidden="true"></span> <span style="font-size: 13px;"
						class="glyphicon glyphicon-earphone pull-right" aria-hidden="true"></span>
					<span style="font-size: 13px;"
						class="glyphicon glyphicon-camera pull-right" aria-hidden="true"></span>
					<p>14.43km</p>
				</div>
				<div class="shop">
					여수밤바다피트니스 <span style="font-size: 13px;"
						class="glyphicon glyphicon-map-marker pull-right"
						aria-hidden="true"></span> <span style="font-size: 13px;"
						class="glyphicon glyphicon-earphone pull-right" aria-hidden="true"></span>
					<span style="font-size: 13px;"
						class="glyphicon glyphicon-camera pull-right" aria-hidden="true"></span>
					<p>25.45km</p>
				</div>
				<div class="shop">
					바디스타(충무로점) <span style="font-size: 13px;"
						class="glyphicon glyphicon-map-marker pull-right"
						aria-hidden="true"></span>
					<p>7.5km</p>
				</div>
			</div>
		</div>
	</div>
	<div data-role="footer" id="footer" data-position="fixed"
		data-tap-toggle="false" class="jqm-footer">
		<img src="/dailyfit/img/icon_1_active.png"> <img
			src="/dailyfit/img/icon_2.png"> <img
			src="/dailyfit/img/icon_3.png"> <img
			src="/dailyfit/img/icon_4.png">
	</div>
	<!-- /footer -->
</body>
</html>