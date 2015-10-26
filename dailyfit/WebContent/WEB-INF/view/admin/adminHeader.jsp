<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<title>관리자페이지</title>
<!--  Bootstrap -->
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="/dailyfit/css/bootstrap.min.css" rel="stylesheet">
<script src="/dailyfit/js/bootstrap.min.js"></script>
<!-- custom CSS -->
<link href="/dailyfit/css/admin.css" rel="stylesheet">
<script type="text/javascript">
function showLoading() {
	$("#ajaxLoading").show();
};
function hideLoading() {
	$("#ajaxLoading").hide();
};
</script>
</head>
<body>
<div id="ajaxLoading" style="position: fixed; top: 60%; left: 50%; z-index: 5; display: none;">
	<img id="loadingImg" src="/dailyfit/img/ajax-loader-basic.gif" >
	<p>처리중..</p>
</div>
	<div id="adminHeader">
		<div id="mainLogo">
			<img src="/dailyfit/img/main_logo_color.png" width="300px;">
		</div>
		<ul class="nav nav-tabs nav-justified">
			<li role="presentation" class="dropdown" class="active"><a
				class="dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-expanded="false">데이핏운영<span class="caret"></span>
			</a>
				<ul class="dropdown-menu" role="menu">
					<li role="presentation"><a
						href="/dailyfit/admin/event.ap">한줄이벤트등록</a></li>
					<li role="presentation"><a
					href="/dailyfit/admin/noticeList.ap">공지사항 관리</a></li>
					<li role="presentation"><a
					href="#">1:1문의 답변</a></li>
					<li role="presentation"><a
					href="/dailyfit/admin/questionAD.ap">광고제휴문의</a></li>
					
				</ul></li>

			<li role="presentation" class="dropdown" class="active"><a
				class="dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-expanded="false">헬스장관리 <span class="caret"></span>
			</a>
				<ul class="dropdown-menu" role="menu">
					<li role="presentation"><a href="/dailyfit/admin/addShop.ap">신규헬스장등록</a></li>
					<li role="presentation"><a href="/dailyfit/admin/addImage.ap">헬스장사진등록</a></li>
					<li role="presentation"><a href="/dailyfit/admin/delShop.ap">기존헬스장삭제</a></li>
				</ul></li>
			<li role="presentation" class="dropdown" class="active"><a
				class="dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-expanded="false">현황관리<span class="caret"></span>
			</a>
				<ul class="dropdown-menu" role="menu">
					<li role="presentation"><a href="#">판매현황관리</a></li>
					<li role="presentation"><a href="#">고객정보관리</a></li>
				</ul></li>

			<li role="presentation" class="dropdown" class="active"><a
				class="dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-expanded="false">관리자메뉴<span class="caret"></span>
			</a>
				<ul class="dropdown-menu" role="menu">
					<li role="presentation"><a
						href="/dailyfit/admin/geoLocation.ap">좌표쿼리요청</a></li>
					<li role="presentation"><a
					href="/dailyfit/admin/searchGoogle.ap">Google데이터 등록</a></li>
				</ul></li>

		</ul>
	</div>

</body>
</html>