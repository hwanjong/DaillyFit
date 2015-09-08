<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자페이지</title>
<!--  Bootstrap -->
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="/dailyfit/css/bootstrap.min.css" rel="stylesheet">
<script src="/dailyfit/js/bootstrap.min.js"></script>
<!-- custom CSS -->
<link href="/dailyfit/css/admin.css" rel="stylesheet">
</head>
<body>
	<div id="adminHeader">
		<div id="mainLogo">
			<img src="/dailyfit/img/main_logo_color.png" width="300px;">
		</div>
		<ul class="nav nav-tabs nav-justified">
			<li role="presentation" class="dropdown" class="active"><a
				class="dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-expanded="false"> 헬스장등록 <span class="caret"></span>
			</a>
				<ul class="dropdown-menu" role="menu">
					<li role="presentation"><a href="#">헬스장좌표연동</a></li>
					<li role="presentation"><a href="#">Google데이터 등록</a></li>
				</ul></li>
			<li role="presentation" ><a href="#">신규헬스장등록</a></li>

			<li role="presentation"><a href="#">헬스장정보수정/삭제</a></li>
			<li role="presentation"><a href="#">판매현황관리</a></li>
		</ul>
	</div>

</body>
</html>