<%@page import="bean.Shop"%>
<%@page import="dao.ShopDAO"%>
<%@page import="dao.InfoDAO"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminHeader.jsp"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="cache-control" content="no-cache" />
<link href="/dailyfit/css/addImage.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function() { 
	$("#search").click(function(){
		$("#searchList").html("");
		showLoading();
		var shopName = $("#shopName").val();
		$.post("/dailyfit/check/searchShop.ap",{
			shopName : shopName
		},function(data){
			hideLoading();
			var shopList = data.shopList;
			for (var i in shopList) {
				if(shopList[i]=="")continue;
				if(shopList[i].mainImgUrl==""){
					$("#searchList").append('<div id="'+shopList[i].shopNum+'"class="alert alert-success" role="alert"><strong>'+shopList[i].shopName+'</strong> '+shopList[i].address+' <span class="label label-warning">비제휴</span></div>');
				}else{
					$("#searchList").append('<div id="'+shopList[i].shopNum+'"class="alert alert-info" role="alert" onclick="addImagePage('+shopList[i].shopNum+','+"'"+shopList[i].shopName+"'"+')"><strong>'+shopList[i].shopName+'</strong> '+shopList[i].address+' <span class="label label-primary">제휴</span></div>');
				}
				
			}
		},"json");
		
	})
});

function addImagePage(shopID,shopName){
	$("#healthTitle").text(shopName+" 이미지 등록");
	$("#shopId").attr("value",shopID);
	
	$('#myModal').modal({
	      show: 'true'
	}); 
}

function regist_imageFilesFn(){
		console.log("submit");
	if( $("#mainImage").val()==""){
		alert("필수정보 누락");
	}else{
		alert("submit");
		$("#regist_imageFiles").submit();
	}
}
</script>
</head>
<body>
	<div id="contents">
	<h3>헬스장 이미지 등록</h3>
		<div class="row">
		  <div class="col-lg-6">
		    <div class="input-group">
		      <input id="shopName" type="text" class="form-control" placeholder="헬스장이름입력..">
		      <span class="input-group-btn">
		        <button id="search" class="btn btn-default" type="button">Search</button>
		      </span>
		    </div>
		  </div>
		</div>
		
		<div id="searchList" style="height: 600px; overflow: auto;">
		</div>
	</div>
	
	<div id="myModal" class="modal fade" role="dialog">
  		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="healthTitle"></h4>
				</div>
				<div class="modal-body">
					<form id="regist_imageFiles" action="addImage.ap" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label>대표 사진</label>
							<div>
							<input type="text" name="shopId" id="shopId" hidden="true">								
								<input type="file"
									placeholder="트레보" accept="image/*" name="mainImage" id="mainImage">
							</div>
						</div>

						<div class="form-group">
							<label>슬라이드 사진</label>
							<div>
								<input type="file" style="padding-bottom: 10px;" accept="image/*" name="subImage1" id="subImage1">
								<input type="file" style="padding-bottom: 10px;" accept="image/*" name="subImage2" id="subImage2">
								<input type="file" style="padding-bottom: 10px;" accept="image/*" name="subImage3" id="subImage3">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="regist_imageFilesFn()">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
<%
if(request.getMethod().equals("POST")){
	String saveDir = application.getRealPath("/img/");
	
	
	int maxSize = 1024*1024*100;
	String encType = "UTF-8";
	MultipartRequest multipartRequest
	= new MultipartRequest(request, saveDir, maxSize, encType, new DefaultFileRenamePolicy());
	
	
	File dir = new File(saveDir +"/"+ multipartRequest.getParameter("shopId"));	
	if (!dir.exists()) {	    
	    boolean result = false;

	    try{
	        dir.mkdir();
	        result = true;
	    } 
	    catch(SecurityException se){
	        //handle it
	    }        
	    if(result) {    
	        System.out.println("DIR created");  
	    }
	}
	//System.out.println(dir.getPath());
	Enumeration fileNames = multipartRequest.getFileNames();
	
	
	String fileInput = "";
    String fileName = "";
    String type = "";
    File file = null;
    String originFileName = "";    
    String fileExtend = "";
    String fileSize = "";
    int fileNo=0;
	while(fileNames.hasMoreElements()){
		fileInput = (String)fileNames.nextElement();
		fileName = multipartRequest.getFilesystemName(fileInput);
		file = multipartRequest.getFile(fileInput);
		
		if(fileNo == 0){
			//File file = multipartRequest.getFile("mainImage");
			//String fileName = file.getName();
			fileName = "mainImage" +"."+fileName.substring(fileName.lastIndexOf(".")+1);
			File newFile = new File(dir+"/"+fileName);
			if (newFile.exists()) newFile.delete();
			
			file.renameTo(newFile);				
			ShopDAO dao = new ShopDAO();
			Shop shop = new Shop();
			shop.setShopNum(Integer.parseInt(multipartRequest.getParameter("shopId")));
			System.out.println(newFile.getPath());
			shop.setMainImgUrl(newFile.getPath().replaceAll("\\\\", "/"));
			dao.addShopMainUrl(shop);				
			fileNo++;
			System.out.println("mainPage Upload");
		} else if(file !=null){
			fileName = "subImage"+fileNo +"."+fileName.substring(fileName.lastIndexOf(".")+1);
			File newFile = new File(dir+"/"+fileName);
			if (newFile.exists()) newFile.delete();
				file.renameTo(newFile);
			System.out.println("SubPageUpload : " + fileNo);
			ShopDAO dao = new ShopDAO();
			int shopNum = Integer.parseInt(multipartRequest.getParameter("shopId"));
			String subUrl = newFile.getPath().replaceAll("\\\\", "/");
			dao.addShopSubImgUrl(subUrl, shopNum);
			
			fileNo++;
		}	else{
			System.out.println("file Not Exist");
		}
	}
	
	
	/**/
}
%>
</body>
</html>