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
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="/dailyfit/css/notice.css" rel="stylesheet">
<script>
	$(document).ready(
			function() {
				$('.collapse').on(
						'shown.bs.collapse',
						function() {
							$(this).parent().find(".glyphicon-menu-right")
									.removeClass("glyphicon-menu-right")
									.addClass("glyphicon-menu-down");
						}).on(
						'hidden.bs.collapse',
						function() {
							$(this).parent().find(".glyphicon-menu-down")
									.removeClass("glyphicon-menu-down")
									.addClass("glyphicon-menu-right");
						});
			});
</script>
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
	<div id="noticeLabel">공지사항</div>
	<div class="panel-group" id="accordion">
		<c:forEach var="board" items="${model.boardList}">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							aria-hidden="false" href="#${board.boardNum}" class="collapsed"> <span
							class="glyphicon glyphicon-menu-right"></span>${board.title}
						</a>
					</h4>
				</div>
				<div id="${board.boardNum}" class="panel-collapse collapse">
					<div class="panel-body">${board.contents}</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>