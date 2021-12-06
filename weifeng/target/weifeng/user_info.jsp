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
</head>

<body>
  <header id="header">
  	<a href="user_index.jsp" class="iconfont fl">&#xe63f;</a>
    <div class="title">个人资料</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
  </header> 
  <div class="content">
  	  <div class="ul-list">
  	  	 <ul>
  	  	 	<li class="pic">
  	  	 		<a>头像
  	  	 		   <span class="fr"><img src="${pageContext.request.contextPath}/${user.filePath}"></span>
  	  	   	  	</a>
  	  	 	</li>
  	  	 </ul>
  	  </div>
  	  <div class="ul-list">
  	  	   <ul>
  	  	   	  <li>
  	  	   	  	<a href="#" class="arrow-right">昵称
                   <span class="fr">${user.nickname}</span>
  	  	   	  	</a>
  	  	   	  </li>
  	  	   	  <li>
  	  	   	  	<a href="#" class="arrow-right">性别
                   <span class="fr">${user.sex}</span>
  	  	   	  	</a>
  	  	   	  </li>
  	  	   	  <li>
  	  	   	  	<a href="#" class="arrow-right">电话
                    <span class="fr">${user.tel}</span>
  	  	   	  	</a>
  	  	   	  </li>
  	  	   	  <li>
  	  	   	  	<a href="#" class="arrow-right">邮箱
                   <span class="fr">${user.email}</span>
  	  	   	  	</a>
  	  	   	  </li>
  	  	   </ul>
  	  </div>
  	  <div class="ul-list">
  	  	   <ul>
  	  	   	  <li>
  	  	   	  	<a class="arrow-right">个性签名
  	  	   	  		<span class="fr">${user.qianming}</span>
  	  	   	  	</a>
  	  	   	  </li>
  	  	   </ul>
  	   </div>
  </div>
 
  <footer id="footer" class="foot">
        <ul>
            <li>
            	<a href="index.jsp">
	                <span class="img"><img src="images/nav1.png"></span>
	                <p>首页</p>
            	</a>
            </li>
            <li>
            	<a href="tiediy.jsp">
                   <span class="img"><img src="images/nav2.png"></span>
                   <p>贴DIY</p>
            	</a>
            </li>
            <li>
            	<a href="meidiy.html">
	                <span class="img"><img src="images/nav3.png"></span>
	                <p>美DIY</p>
            	</a>
            </li>
            <li class="active">
            	<a href="user_login.jsp">
	                <span class="img"><img src="images/nav4.png"></span>
	                <p>我的</p>
            	</a>
            </li>
        </ul>
  </footer>
</body>
</html>
