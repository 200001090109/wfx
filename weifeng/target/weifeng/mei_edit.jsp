<%--发布美的界面--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>微风向</title>
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/iconfont/iconfont.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.file input {
			position: absolute;
			font-size: 100px;
			right: 0;
			top: 0;
			opacity: 0;
		}
	</style>
</head>

<body style="background:#fff;">
  <header id="header">
  	<a href="mei_list.jsp" class="iconfont fl">&#xe63f;</a>
    <div class="title">美拍</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
  </header>
<form id="shangchuan" action="${pageContext.request.contextPath}/UploadMeiServlet" enctype="multipart/form-data" method="post">
  <div class="content mei_edit">
  	<div class="detail_box">
  		<div class="con">
			<input type="hidden" name="fenlei" value="美拍">
  			<div class="row-r1">
				<input class="input_title" placeholder="请输入标题（必填）" pattern=".{1,20}" name="title">
			</div>
			<div class="row-r1">
				<input class="input_title" placeholder="请输入内容（必填）" pattern=".{1,20}" name="characters">
			</div>
        <div class="row-r1" style="height:300px; border-bottom:0;">
<%--        <p><img src="images/diy_detail.jpg"></p>--%>
            <input class="input_title" placeholder="内容" type="file" name="file">
		</div>
  			
  		</div>
  	</div> 
  	<div class=" clearfix"></div>
  </div>
 
  <footer id="footer" class="foot">
        <a href="javascript:;" onclick="document.getElementById('shangchuan').submit()" class="green-btn ft-btn" >发布</a>
  </footer>
</form>
</body>
</html>
