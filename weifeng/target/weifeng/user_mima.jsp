<%@ page contentType="text/html;charset=UTF-8"  %>
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
    <div class="title">找回密码</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
  </header> 
  <div class="content">
  	 <div class="register-box">
  	 	 <div class="form-box">
			 <form action="${pageContext.request.contextPath}/ChangePwdServlet" method="post">
				 <div class="row row-input clearfix">
					 <div class="row-l fl"><i class="iconfont">&#xe692;</i></div>
					 <div class="row-r">
						 <input class="input_box" name="username" placeholder="用户名">
					 </div>
				 </div>
				<div class="row row-input clearfix">
					<div class="row-l fl"><i class="iconfont">&#xe64f;</i></div>
					<div class="row-r">
						<input class="input_box" name="tel" placeholder="手机号" style="width:200px;">
<!--						<a href="" class="yzm fr">发送验证码</a>-->
					</div>
				</div>
				<div class="row row-input clearfix">
					<div class="row-l fl"><i class="iconfont">&#xe692;</i></div>
					<div class="row-r">
						<input class="input_box" name="email" placeholder="请输入邮箱">
					</div>
				</div>
				<div class="row row-input clearfix">
					<div class="row-l fl"><i class="iconfont">&#xe692;</i></div>
					<div class="row-r">
						<input class="input_box" name="pwd" placeholder="新密码">
					</div>
				</div>
				<div class="row row-btn">
					<input type="submit" class="green-btn" value="确定">
				</div>
			 </form>
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
            <li class="active">
            	<a href="#">
                   <span class="img"><img src="images/nav2.png"></span>
                   <p>贴DIY</p>
            	</a>
            </li>
            <li>
            	<a href="meidiy.jsp">
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
</body>
</html>
