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
</head>
<body>
  <header id="header">
  	<a href="user_login.jsp" class="iconfont fl">&#xe63f;</a>
    <div class="title">会员中心</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
  </header> 
  <div class="content u-index">
  	  <div class="userbox">
  	  	  <div class="userbox-1">
  	  	  	<div class="userimg"><img src="${pageContext.request.contextPath}/${user.filePath}"></div>
  	 		<div class="username">${user.nickname}</div>
  	  	  </div>
  	  	  <div class="userbox-2">
  	  	  	  <ul class="clearfix">
  	  	  	  	<li><a href="user_tixian.jsp" class="c000"><span>¥${user.yue}</span><br>钱包余额</a></li>
  	  	  	  	<li><span>¥${user.tixian}</span><br>已提现余额</li>
  	  	  	  </ul>
  	  	  </div>
  	  </div>
  	  <div class="ul-list">
  	  	   <ul>
  	  	   	  <li class="tel">
  	  	   	  	  <i class="iconfont">&#xe68e;</i>${user.tel}
  	  	   	  	  <span class="fr">显示在微名片<input type="checkbox" class="switch" checked></span>
  	  	   	  </li>
  	  	   	  <li>
  	  	   	  	<a href="user_info.jsp" class="arrow-right">
  	  	   	  	  <i class="iconfont">&#xe660;</i>个人信息
  	  	   	  	</a>
  	  	   	  </li>
  	  	   	  <li>
  	  	   	  	<a href="user_team.html" class="arrow-right">
  	  	   	  	  <i class="iconfont">&#xe625;</i>我的团队
  	  	   	  	</a>
  	  	   	  </li>
  	  	   	  <li>
  	  	   	  	<a href="user_collect.html" class="arrow-right">
  	  	   	  	  <i class="iconfont">&#xe73a;</i>我的收藏
  	  	   	  	</a>
  	  	   	  </li>
  	  	   	  <li>
  	  	   	  	<a href="user_code.html" class="arrow-right">
  	  	   	  	  <i class="iconfont">&#xe604;</i>一键生成二维码
  	  	   	  	</a>
  	  	   	  </li>
  	  	   </ul>
           
           
  	  </div>
      
             <div class="ul-list">
  	  	   <ul>
  	  	   	  <li>
  	  	   	  	<a href="${pageContext.request.contextPath}/LogoutServlet" style="text-align:center; color:#999;">退 出
  	  	   	  	</a>
  	  	   	  </li>
  	  	   </ul>
  	   </div>
  </div>
 <%@include file="footer.jsp"%>

</body>
</html>
