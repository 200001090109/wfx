<%--<%@ page import="com.model.User" %>--%>
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
		input{
			border: 0;
			margin:0;
			padding: 0;
			height: 35px;
			outline: none;
		}
	</style>
</head>

<body>
  <header id="header">
  	<a href="user_index.jsp" class="iconfont fl">&#xe63f;</a>
    <div class="title">个人资料</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
  </header>
  <form action="${pageContext.request.contextPath}/TAlterUserServlet" enctype="multipart/form-data" method="post">
  <div class="content">
	  <input type="hidden" name="userid" value="${user.id}">
  	  <div class="ul-list">
  	  	 <ul>
  	  	 	<li class="pic">
  	  	 		<a>头像
					<input type="file" hidden id="fileup" name="filepath" >
  	  	 		   <span class="fr"><img src="${user.filePath}" onclick="upfile()" id="touxiang"></span>
  	  	   	  	</a>
  	  	 	</li>
  	  	 </ul>
  	  </div>
  	  <div class="ul-list">
  	  	   <ul>
  	  	   	  <li>
  	  	   	  	<a href="#" class="arrow-right">昵称
					<input type="text" value="${user.nickname}" name="nickname" class="fr">
<%--                   <span class="fr">${user.nickname}</span>--%>
  	  	   	  	</a>
  	  	   	  </li>
  	  	   	  <li>
  	  	   	  	<a href="#" class="arrow-right">性别
					<input type="text" class="fr" name="sex" value="${user.sex}">
<%--                   <span class="fr">${user.sex}</span>--%>
  	  	   	  	</a>
  	  	   	  </li>
  	  	   	  <li>
  	  	   	  	<a href="#" class="arrow-right">电话
					<input type="text" class="fr" name="tel" value="${user.tel}">
<%--                    <span class="fr">${user.tel}</span>--%>
  	  	   	  	</a>
  	  	   	  </li>
  	  	   	  <li>
  	  	   	  	<a href="#" class="arrow-right">邮箱
					<input type="text" class="fr" name="email" value="${user.email}">
<%--                   <span class="fr">${user.email}</span>--%>
  	  	   	  	</a>
  	  	   	  </li>
  	  	   </ul>
  	  </div>
  	  <div class="ul-list">
  	  	   <ul>
  	  	   	  <li>
  	  	   	  	<a class="arrow-right">个性签名
					<input type="text" class="fr" name="qianming" value="${user.qianming}">
<%--  	  	   	  		<span class="fr">${user.qianming}</span>--%>
  	  	   	  	</a>
  	  	   	  </li>
  	  	   </ul>
  	   </div>
	  <div>
		  <button  style="display:block;margin: 0 auto 20px;height: 50px;width: 100px;border: 1px solid #f0f0f0;
		  background: #dbe0dc" type="submit">确认修改</button>
	  </div>
  </div>
  </form>
  <%@include file="footer.jsp"%>
<script>
	const img = document.getElementById("touxiang")
	const file = document.getElementById("fileup")
	function upfile(){
		file.click()
	}
	file.onchange=function () {
		const file = this.files[0];
		if(file){
			const reader = new FileReader();
			reader.onload = function () {
				const result = reader.result;
				img.src = result;
			}
			reader.readAsDataURL(file);
		}

	}


</script>
</body>
</html>
