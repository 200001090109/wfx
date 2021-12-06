<%@ page import="com.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>微风向</title>
	<link href="${pageContext.request.contextPath}/weifeng/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/weifeng/iconfont/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<%
	User user = (User)session.getAttribute("user");
	if(user.getId()!=0)response.sendRedirect("user_index.jsp");
%>
<body>
  <header id="header">
  	<a href="#" class="iconfont fl">&#xe63f;</a>
    <div class="title">登录</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
  </header> 
  <form action="${pageContext.request.contextPath}/LoginCheckServlet">
	  <div class="content">
		  <div class="login-box">
			  <div class="form-box">
				  <div class="row row-input clearfix">
					  <div class="row-l fl"><i class="iconfont">&#xe608;</i></div>
					  <div class="row-r">
						  <input class="input_box" name="userName" placeholder="输入手机号/邮箱/昵称" pattern="[a-zA-Z0-9]{2,9}">
					  </div>
				  </div>
				  <div class="row row-input clearfix">
					  <div class="row-l fl"><i class="iconfont">&#xe692;</i></div>
					  <div class="row-r">
						  <input class="input_box" name="pwd" placeholder="输入密码" type="password" pattern="[a-zA-Z0-9]{2,9}">
					  </div>
				  </div>
				  <div class="h20"></div>
				  <div class="row row-btn">
					  <input class="boder-btn" type="submit" value="登陆" style="width: 100%;background: none;
					  border-radius: 4px;height: 40px;border-color: #71d49a;color: #2dcc70">
				  </div>
				  <div class="row row-btn">
					  <a href="user_register.html" class="boder-btn">注册会员</a>
				  </div>
				  <div class="row row-txt">
					  <a href="user_mima.html" class="forget">忘记密码</a>
				  </div>
			  </div>
			  <div class="h20"></div>
			  <div class="otherway">
				  <div class="title"><span>其他登录方式</span></div>
				  <ul class="clearfix">
					  <li>
						  <a href="#" class="weibo"><i class="iconfont">&#xe60a;</i></a>
					  </li>
					  <li>
						  <a href="#" class="qq"><i class="iconfont">&#xe607;</i></a>
					  </li>
					  <li>
						  <a href="#" class="weixin"><i class="iconfont">&#xe606;</i></a>
					  </li>
				  </ul>
			  </div>
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
            <li>
            	<a href="user_login.jsp">
	                <span class="img"><img src="images/nav4.png"></span>
	                <p>我的</p>
            	</a>
            </li>
        </ul>
  </footer>
  </form>
</body>
</html>
