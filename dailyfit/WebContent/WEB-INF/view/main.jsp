<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function one() {
		$("#two").hide();
		$("#one").fadeIn(200);

		$(".one").addClass("activeBar");
		$(".two").removeClass("activeBar");
	}
	function two() {
		$("#one").hide();
		$("#two").fadeIn(200);

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
		
	
		var state=1;
		$(".ui-input-search").hide();
		$("#swipe").fadeOut(3000);
		
		/* swipe 
		$("html").on("swipe",function(){
			if(state%2==1)two();
			else one();
			state++;
		});
		*/
		
		var broswerInfo = navigator.userAgent;
		if(broswerInfo.indexOf("APP_ANDROID")>-1){
			javascript:AndroidApp.testToast('서버통신결과 : 앱으로 접속하셨습니다.');
		}
	});
</script>
</head>
<body>
	<div id="headBar" data-role="header" data-position="fixed"
		data-tap-toggle="false" class="jqm-header font">
		<span class="glyphicon glyphicon-chevron-left left" aria-hidden="true"
			onclick="javascript:history.go(-1)"></span> <span> Daily FIT</span> <span
			class="glyphicon glyphicon-option-horizontal right"
			aria-hidden="true" onclick="alert('거리순&가격순보기준비중입니다.')"></span> <span
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
				style="color: rgb(231, 76, 60); text-align: center;">
				<span class="glyphicon glyphicon-volume-up left"></span>
				<b style="margin-left: -50px;">OPEN 이벤트!</b></p>
			<p id="event" class="m1" style="color: #333; text-align: center;">
				5만원 정액권 충전하면 10,000포인트 적립?! <img src="/dailyfit/img/temp_money.PNG">
			</p>

			<div id="1" class="item" onclick="location.href='shop.ap'" onclick="location.href='shop.ap'">
				<img src="/dailyfit/img/shop3_1.jpg">
				<div class=itemTitle>
					<p class="m1">청룡사우나헬스</p>
					<span class="subTitle">1회 이용권 8,300원</span> <span class="post">|
						후기 3개</span>
				</div>
				<div class="distance">13.15km</div>
			</div>
			<div id="2" class="item" onclick="location.href='shop.ap'">
				<img src="/dailyfit/img/shop3_2.png">
				<div class=itemTitle>
					<p class="m1">레드헷(수원본점)</p>
					<span class="subTitle">1회 이용권 3,900원</span> <span class="post">|
						후기 9개</span>
				</div>
				<div class="distance">25.98km</div>
			</div>
			
			<div id="3" class="item" onclick="location.href='shop.ap'">
				<img src="/dailyfit/img/shop2_item1.jpg">
				<div class=itemTitle>
					<p class="m1">드래곤힐스파 GYM</p>
					<span class="subTitle">1회 이용권 4,400원</span> <span class="post">|
						후기 129개</span>
				</div>
				<div class="distance">4.55km</div>

			</div>
			<div id="4" class="item" onclick="location.href='shop.ap'">
				<img src="/dailyfit/img/shop1_item1.jpg">
				<div class=itemTitle>
					<p class="m1">트레보 스포츠 수원점</p>
					<span class="subTitle">1회 이용권 7,000원</span> <span class="post">|
						후기 14개</span>
				</div>
				<div class="distance">15.22km</div>

			</div>
			<div id="5" class="item" onclick="location.href='shop.ap'">
				<img src="/dailyfit/img/shop1_item2.jpg">
				<div class=itemTitle>
					<p class="m1">스포애니(잠실점)</p>
					<span class="subTitle">1회 이용권 5,600원</span> <span class="post">|
						후기 9개</span>
				</div>
				<div class="distance">3.48km</div>

			</div>
			<div id="6" class="item" onclick="location.href='shop.ap'">
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
			<div class="premium" onclick="location.href='shop.ap'">
					<img src="/dailyfit/img/shop3_3.JPG"
						style="width: 100%; height: 100%;">
					<p class="left f18">힐스테이트헬스</p>
					<p class="right bold">7.21km</p>
				</div>
				<div class="premium" onclick="location.href='shop.ap'">
					<img src="/dailyfit/img/shop2_2.jpg"
						style="width: 100%; height: 100%;">
					<p class="left f18">보령스피트니스</p>
					<p class="right bold">13.57km</p>
				</div>
				
				<div class="shop" onclick="location.href='shop.ap'" >
					트레보스포츠 <span style="font-size: 13px;"
						class="glyphicon glyphicon-map-marker pull-right"
						aria-hidden="true"></span> <span style="font-size: 13px;"
						class="glyphicon glyphicon-camera pull-right" aria-hidden="true"></span>
					<p>3.93km</p>
				</div>
				<div class="shop" onclick="location.href='shop.ap'">
					엑스포헬스 <span style="font-size: 13px;"
						class="glyphicon glyphicon-map-marker pull-right"
						aria-hidden="true"></span> <span style="font-size: 13px;"
						class="glyphicon glyphicon-earphone pull-right" aria-hidden="true"></span>
					<span style="font-size: 13px;"
						class="glyphicon glyphicon-camera pull-right" aria-hidden="true"></span>
					<p>14.43km</p>
				</div>
				<div class="shop" onclick="location.href='shop.ap'">
					동국대헬스 <span style="font-size: 13px;"
						class="glyphicon glyphicon-map-marker pull-right"
						aria-hidden="true"></span> <span style="font-size: 13px;"
						class="glyphicon glyphicon-earphone pull-right" aria-hidden="true"></span>
					<span style="font-size: 13px;"
						class="glyphicon glyphicon-camera pull-right" aria-hidden="true"></span>
					<p>1.21km</p>
				</div>
				<div class="shop" onclick="location.href='shop.ap'">
					여수밤바다피트니스 <span style="font-size: 13px;"
						class="glyphicon glyphicon-map-marker pull-right"
						aria-hidden="true"></span> <span style="font-size: 13px;"
						class="glyphicon glyphicon-earphone pull-right" aria-hidden="true"></span>
					<span style="font-size: 13px;"
						class="glyphicon glyphicon-camera pull-right" aria-hidden="true"></span>
					<p>25.45km</p>
				</div>
				<div class="shop" onclick="location.href='shop.ap'">
					바디스타(충무로점) <span style="font-size: 13px;"
						class="glyphicon glyphicon-map-marker pull-right"
						aria-hidden="true"></span>
					<p>7.5km</p>
				</div>
				<div class="shop" onclick="location.href='shop.ap'">
					빅오스포츠 <span style="font-size: 13px;"
						class="glyphicon glyphicon-map-marker pull-right"
						aria-hidden="true"></span>
					<p>17.25km</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>