<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link href="css/main.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="UTF-8">
<title>Dailyfit</title>
<script>
	$(document).ready(function() { // 해당 페이지 Loading 후,
		$("#ready").html("준비됬다");
	});
</script>
</head>
<body>
<label id="ready" for="slider2">Flip switch:</label>
<select name="slider2" id="slider2" data-role="slider">
    <option value="off">Off</option>
    <option value="on">On</option>
</select>

<div class="ui-field-contain">
    <select name="select-custom-1" id="select-custom-1" data-native-menu="false">
        <option value="1">The 1st Option</option>
        <option value="2">The 2nd Option</option>
        <option value="3">The 3rd Option</option>
        <option value="4">The 4th Option</option>
    </select>
</div>


</body>
</html>