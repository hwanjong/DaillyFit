<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="adminHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="cache-control" content="no-cache" />
<title>Insert title here</title>
<link href="/dailyfit/css/addNotice.css" rel="stylesheet">
<script>
	function regist() {
		if ($("#noticeTitle").val() == "" || $("#noticeContents").val() == "") {
			alert("필수정보 누락");
		} else {
			$("#regist").submit();
		}

	}
	
	function post(path, params, method) {
	    method = method || "post"; // Set method to post by default if not specified.

	    // The rest of this code assumes you are not using a library.
	    // It can be made less wordy if you use one.
	    var form = document.createElement("form");
	    form.setAttribute("method", method);
	    form.setAttribute("action", path);

	    for(var key in params) {
	        if(params.hasOwnProperty(key)) {
	            var hiddenField = document.createElement("input");
	            hiddenField.setAttribute("type", "hidden");
	            hiddenField.setAttribute("name", key);
	            hiddenField.setAttribute("value", params[key]);

	            form.appendChild(hiddenField);
	         }
	    }

	    document.body.appendChild(form);
	    form.submit();
	}
	function deleteNotice(){
		post("/dailyfit/admin/deleteNotice.ap",{no:$("#noticeNo").val()});
	}
</script>
</head>
<body>
	<div id="contents">
		<h3 style="margin-left: 12%; margin-bottom: 5%">공지사항 수정</h3>
		<form class="form-horizontal" id="regist"
			action="/dailyfit/admin/updateNotice.ap" method="post">
			<div class="form-group">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="noticeTitle"
						name="noticeTitle" value="${model.noticeTarget.title}">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">
					<textarea class="form-control" style="height: 30em"
						id="noticeContents" name="noticeContents">${model.noticeTarget.contents }</textarea>
				</div>
			</div>
			<div class="form-group" style="visibility : hidden">
					<input type="text" class="form-control" id="noticeNo"
						name="noticeNo" value="${model.noticeTarget.boardNum}">
			</div>
			<div id="btnDiv" style="text-align: center; padding: 30px 0px;">
				<button type="button" class="btn btn-lg" onclick="regist();">수정</button>
				<button type="button" class="btn btn-lg" onclick="deleteNotice()">삭제</button>
			</div>
		</form>
	</div>
</body>
</html>