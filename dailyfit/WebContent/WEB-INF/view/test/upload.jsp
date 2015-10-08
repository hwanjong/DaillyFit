<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<title>File Uploading Form</title>
</head>
<body>
	<h3>File Upload:</h3>
	Select a file to upload:
	<br />
	<form action="upload.ap" method="post" enctype="multipart/form-data">
	이름 : <input type="text" name="name"><br>
	파일 : <input type="file" name="file"><br>
	<input type="submit" name="업로드"><br>
</form>

<%
if(request.getMethod().equals("POST")){
	String saveDir = application.getRealPath("/img/");
	int maxSize = 1024*1024*100;
	String encType = "UTF-8";
	MultipartRequest multipartRequest
	= new MultipartRequest(request, saveDir, maxSize, encType, new DefaultFileRenamePolicy());    
    File file = multipartRequest.getFile("file");
}
%>
</body>
</html>