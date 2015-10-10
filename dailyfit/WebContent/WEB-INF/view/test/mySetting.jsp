<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/dailyfit/css/main.css" rel="stylesheet">
<link href="/dailyfit/css/mySetting.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body class="font">
	<div id="headBar" data-role="header" data-position="fixed"
		data-tap-toggle="false" class="jqm-header font">
		<span class="glyphicon glyphicon-chevron-left left" aria-hidden="true"
			onclick="javascript:history.go(-1)"></span> <span id="title"
			style="margin-left: -50px;">DAILY FIT</span> <span
			class="glyphicon glyphicon-option-horizontal right"
			aria-hidden="true" onclick="alert('거리순&가격순보기준비중입니다.')"></span>
	</div>
	<div class="mySettingContent">
		<div class="menuFont">기본정보</div>
		<div class="generalInfo">
			<div>
				<span class="subMenu">별명</span> <span class="subInfo">화니</span> <span class="editInfo"><button>수정</button></span>
			</div>
			<div>
				<span class="subMenu">지역</span> <span class="subInfo">서울특별시</span> <span class="editInfo"><button>수정</button></span>
			</div>
			<div>
				<span class="subMenu">성별</span> <span class="subInfo">남성</span> <span class="editInfo"><button>수정</button></span>
			</div>
			<div>
				<span class="subMenu">생일</span> <span class="subInfo">1991.5.23</span> <span class="editInfo"><button>수정</button></span>
			</div>
			<div>
				<span class="subMenu">키</span> <span class="subInfo">175</span> <span class="editInfo"><button>수정</button></span>
			</div>
			<div>
				<span class="subMenu">몸무게</span> <span class="subInfo">60</span> <span class="editInfo"><button>수정</button></span>
			</div>
		</div>
		<div class = "editImportantInfo">
			<span><button>비밀번호 변경</button></span> <span><button>회원 탈퇴</button></span>
		</div>
		<div class="menuFont">수신설정</div>
		<div class="appSetting">
			<div id="pushAlamDiv"><input type="checkbox" value="pushAlam"><div class="appSettingText">푸쉬알람</div></div>
			<div id="vibrateDiv"><input	type="checkbox" value="vibrate"><div class="appSettingText">진동설정</div></div>
		</div>
		<div class = "editImportantInfo">
			<span><button>변경</button></span> <span><button>취소</button></span>
		</div>		
	</div>

</body>
</html>