<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="cache-control" content="no-cache" />
<title>mypage</title>
<link href="/dailyfit/css/main.css" rel="stylesheet">
<link href="/dailyfit/css/myPage.css" rel="stylesheet">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<script src = "js/mypage.js"></script>
</head>
<body class ="font">
	<div id="headBar" data-role="header" data-position="fixed"
		data-tap-toggle="false" class="jqm-header font">
		<span class="glyphicon glyphicon-chevron-left left" aria-hidden="true"
			onclick="javascript:history.go(-1)"></span> <span id="title"
			style="margin-left: -50px;">DAILY FIT</span> <span
			class="glyphicon glyphicon-option-horizontal right"
			aria-hidden="true" onclick="alert('거리순&가격순보기준비중입니다.')"></span>
	</div>
	<div id="profileSummury" class="profileSummuryFont">
		<div id="basicInfo">
			<span id="profileImgLayout">
				<img id="profileImg" src="img/channy.PNG">
			</span>			
			<div id="usersInfoText">
				<div id="nickname">
					<i class="fa fa-mars"></i>
					<!--여자 fa fa-venus -->
					${user.nicName}				
				</div>
				<span id="birthday"> 
					<i class="fa fa-birthday-cake">
					</i>
					1991.5.23
				</span>
				<span id="region"> 
					<i class="fa fa-map-marker"></i> 
					서울특별시
				</span>
			</div>							
		</div>
		
		<div class="etcInfo">
			<span id="myPoint">2000</span> <span>5</span> <span>1</span> <span>0</span>
		</div>
		<div class="etcText">
			<span>포인트</span> <span>관심운동</span> <span>운동모임</span> <span>사진</span>
		</div>
	</div>
	<div id="profileContents">
		<div onclick="location.href='test/upload.ap'">
			<span class = "fa fa-smile-o"></span>
			<span>포인트샵</span>
		</div>
		<div>
			<span class = "fa fa-star"></span>
			<span>쿠폰사용</span>
		</div>
		<div>
			<span class = "fa fa-cart-arrow-down"></span>
			<span>구매내역</span>
		</div>
		<div>
			<span class = "fa fa-gear"></span>
			<span>설정</span>
		</div>
		<div>
			<span class = "fa fa-question-circle"></span>
			<span>공지사항</span>
		</div>
		<div>
			<span class = "fa fa-lock"></span>
			<span>1:1 문의</span>
		</div>
		<div>
			<span class = "fa fa-phone"></span>
			<span>광고 제휴문의</span>
		</div>
		<div>
			<span class = "fa fa-users"></span>
			<span>친구초대하기</span>
		</div>
		<div onclick="location.href='/dailyfit/logout.ap'">
			<span class = "fa fa-lock"></span>
			<span>로그아웃</span>
		</div>
	</div>
</body>
</html>