<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>微风向</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link href="iconfont/iconfont.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.file {
			position: relative;
			display: inline-block;
			background: #D0EEFF;
			border: 1px solid #99D3F5;
			border-radius: 4px;
			padding: 4px 12px;
			overflow: hidden;
			color: #1E88C7;
			text-decoration: none;
			text-indent: 0;
			line-height: 20px;
		}
		.file input {
			position: absolute;
			font-size: 100px;
			right: 0;
			top: 0;
			opacity: 0;
		}
		.file:hover {
			background: #AADFFD;
			border-color: #78C3F3;
			color: #004974;
			text-decoration: none;
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
  			<div class="row-r1">
			<input class="input_title" placeholder="请输入标题（必填）" pattern=".{1,20}" name="title">
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