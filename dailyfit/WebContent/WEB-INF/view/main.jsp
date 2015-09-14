<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="/dailyfit/css/main.css" rel="stylesheet">
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBMuk4J8j5JNE1PC0UdEWpIMmze8UKMG_U&sensor=true"></script>
<script type="text/javascript">
var lat,lng;
var state=1;
var paging = 1;
	function one() {
		$("#two").hide();
		$("#one").fadeIn(200);

		$(".one").addClass("activeBar");
		$(".two").removeClass("activeBar");
		state=1;
	}
	function two() {
		state=2;
		$("#twoContents").html("");
		$("#twoContents").append($("#sample").html());
		$("#one").hide();
		$("#two").fadeIn(200);

		$(".two").addClass("activeBar");
		$(".one").removeClass("activeBar");
		
		$.post("rangeShop.ap",{
			lat : lat,
			lng : lng
		},function(data){
			var shopList = data.shopList;
			//제휴먼저
			for (var i in shopList) {
				if(shopList[i]=="")continue;
				if(shopList[i].mainImgUrl!=""){
					//제휴 먼저표시
					var htmlCode ='<div class="premium" onclick="location.href=' + '\'shop.ap\'' + '><img src="/dailyfit/img/shop3_3.JPG" style="width: 100%; height: 100%;"><p class="left f18">'+shopList[i].shopName+'</p><p class="right bold">'+shopList[i].distance+'km</p></div>';
					$("#twoContents").append(htmlCode);
				}
			}
			//그다음비제휴
			for (var i in shopList) {
				if(shopList[i].mainImgUrl==""){
					var pageCount = parseInt(i/10)+1;
					//var htmlCode = '<a target="_blank" href="noShop.ap?shopNum='+shopList[i].shopNum+'\'" ><div class="shop">'+shopList[i].shopName;
					var htmlCode = '<div class="shop '+pageCount+'" style="display:none;" onclick="location.href='+'\'noShop.ap?shopNum='+shopList[i].shopNum+'\'" >'+shopList[i].shopName;
					if(shopList[i].tel!=""){
						htmlCode+='<span style="font-size: 13px;"	class="glyphicon glyphicon-earphone pull-right" aria-hidden="true"></span>';
					}
					htmlCode+='<p>'+shopList[i].distance+'km</p></div>';
					$("#twoContents").append(htmlCode);
				}
			}
			$(".1").show();
		},"json");
		
		
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
	function showLocationLoading(){
		$("#loadingDiv").show();
		$("#page").css("opacity","0.1");
	}
	function hideLocationLoading(){
		$("#loadingDiv").hide();
		$("#page").css("opacity","1");
	}
	

	$(document).ready(function() { // 해당 페이지 Loading 후,
		//스크롤링 
		$(window).scroll( function() {
			console.log($(window).scrollTop()+", "+$(document).height()+", "+$(window).height()+", state: "+state);
			if ($(window).scrollTop() == $(document).height() - $(window).height()) {
				if(state==2){
					$("#loadingImg").show();
					setTimeout(function(){
						paging++;
						$("."+paging).show();
						$("#loadingImg").hide();
					},1000);
					
				}
			}
		});
		
	
		$(".ui-input-search").hide();
		
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				lat = position.coords.latitude;
				lng = position.coords.longitude;
				hideLocationLoading();
				$("#headBar").show();
			});
		}else{
			alert("위치찾기 실패");
		}
		
		var broswerInfo = navigator.userAgent;
		if(broswerInfo.indexOf("APP_ANDROID")>-1){
			javascript:AndroidApp.testToast('서버통신결과 : 앱으로 접속하셨습니다.');
		}
	});
</script>
</head>
<body>
	<div id="headBar" data-role="header" data-position="fixed" style="display: none;"
		data-tap-toggle="false" class="jqm-header font">
		<span class="glyphicon glyphicon-chevron-left left" aria-hidden="true"
			onclick="javascript:history.go(-1)"></span> <span> Daily FIT</span> <span
			class="glyphicon glyphicon-option-horizontal right"
			aria-hidden="true" onclick="alert('거리순&가격순보기준비중입니다.')"></span> <span
			class="glyphicon glyphicon-search right" aria-hidden="true"
			onclick="search();"></span>

	</div>
	<div id="loadingDiv" class="font">
		<img src="/dailyfit/img/main_logo.jpg" width="100%;">
		DAILY FIT이 위치를 찾는중입니다
		<img  style="margin-top: 50px;" src="/dailyfit/img/ajax-loader1.gif">
	</div>
	<div id="page">
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
						<p class="m1">스포애니(수원점)</p>
						<span class="subTitle">1회 이용권 5,600원</span> <span class="post">|
							후기 9개</span>
					</div>
					<div class="distance">3.48km</div>
	
				</div>
				<div id="6" class="item" onclick="location.href='shop.ap'">
					<img src="/dailyfit/img/shop2_item1.jpg">
					<div class=itemTitle>
						<p class="m1">수원 드래곤힐스파 GYM</p>
						<span class="subTitle">1회 이용권 4,400원</span> <span class="post">|
							후기 129개</span>
					</div>
					<div class="distance">4.55km</div>
				</div>
				
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
	
			</div>
			<div id="two" style="height: 100%; display: none;">
				<input data-type="search" id="divOfPs-input" onblur="stopSearch();">
				<div id="twoContents" data-filter="true" data-input="#divOfPs-input" data-inset="true" data-children=">div">
				</div>
				<div id="loadingImg" style="text-align: center; display:none; margin: 10px 0px;">
					<img src="/dailyfit/img/ajax-loader-basic.gif">
				</div>
				<div id= "sample" style="display: none;">
					<div class="premium" onclick="location.href='shop.ap'" >
						<img src="/dailyfit/img/shop3_2.png"
							style="width: 100%; height: 100%;">
						<p class="left f18">보령헬스(제휴-상단노출)</p>
						<p class="right bold">13.57km</p>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>