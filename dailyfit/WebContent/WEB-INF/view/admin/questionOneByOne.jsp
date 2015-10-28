<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="adminHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="cache-control" content="no-cache" />
<link href="/dailyfit/css/noticeList.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div id='contents'>
<label id="noticeLabel">1:1 문의</label>
<table class="table table-striped" align="center">
	<thead>
	<tr>
		<th style="width:10%">번호</th>	<th>제목</th>	<th style="width:20%">날짜</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="board" items="${model.boardList}">
	<tr class="noticeItems">
		<td>${board.userQuestionBoardNum}</td><td>${board.title}</td><td>${board.writeDate}</td>
	</tr>
	</c:forEach>	
	</tbody>
</table>
<form method="get" action="/dailyfit/admin/addNotice.ap">
	<button class="glyphicon glyphicon-pencil" id="writeNotice">글쓰기</button>
</form>
</div>
</body>
<script>

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

$("#writeNotice").click(function(){
	$("#writeNotice").submit();
});
$(".noticeItems").click(function(e){
	post("/dailyfit/admin/readQuestion.ap",{no : $(e.currentTarget).children().first().text()});	
});
</script>
</html>