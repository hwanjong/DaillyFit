<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="cache-control" content="no-cache" />
<title>Insert title here</title>
<link href="/dailyfit/css/main.css" rel="stylesheet">
<link href="/dailyfit/css/myGoal.css" rel="stylesheet">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<script src="/dailyfit/js/myGoal.js"></script>

</head>
<body>
	<div id="headBar" data-role="header" data-position="fixed"
		data-tap-toggle="false" class="jqm-header font">
		<span class="glyphicon glyphicon-chevron-left left" aria-hidden="true"
			onclick="javascript:history.go(-1)"></span> <span id="title"
			style="margin-left: -50px;">DAILY FIT</span> <span
			class="glyphicon glyphicon-option-horizontal right"
			aria-hidden="true" onclick="alert('거리순&가격순보기준비중입니다.')"></span>
	</div>
	<div id="dwContent">
	<div align=right style="margin-top: 3%">
		<button id="editBtn">수정</button>
	</div>
		<div id="dates">10월 12일 (월) 23:04</div>
		<div class="weight" align="center">
			<img class="weightBG" id="currentWeightBG" src="../img/bg.png">
			<p class="weightNum" id="currentWeigth">${model.curUser.weight}kg</p>
			<img class="weightNungum" id="currentNungum" src="../img/nungum.png">
			<p class="current">현재</p>
		</div>
		<div id="goalsItemDiv" align=center>
			<span class="goalsItem" id="userHeight">${model.curUser.height }</span> <span
				id="userPower" class="goalsItem">${model.curUser.targetPower }</span>
		</div>
		<div id="goalsItemLabelDiv" align=center>
			<span class="goalsItemLabel">키(cm)</span> <span
				class="goalsItemLabel">운동 강도</span>
		</div>
		<div class="weight" align="center">
			<img class="weightBG" id="goalWeightBG" src="../img/bg.png">
			<p class="weightNum" id="goalWeight">${model.curUser.targetWeight }kg</p>
			<img class="weightNungum" id="goalNungum" src="../img/nungum.png">
			<p class="current">목표</p>
		</div>
	</div>

</body>
</html>