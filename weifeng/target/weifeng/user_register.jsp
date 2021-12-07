<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  	<a href="user_login.jsp" class="iconfont fl">&#xe63f;</a>
    <div class="title">注册</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
  </header> 
  <div class="content">
  	 <div class="register-box">
  	 	 <div class="form-box">
			 <form action="/weifeng/RegisterServlet" method="post" >
				<div class="row row-input clearfix">
					<div class="row-l fl"><i class="iconfont">&#xe64f;</i></div>
					<div class="row-r">
						<input class="input_box" name="newtel" placeholder="输入手机号">
					</div>
				</div>
				<div class="row row-input clearfix">
					<div class="row-l fl"><i class="iconfont">&#xe692;</i></div>
					<div class="row-r">
						<input class="input_box" name="newpwd" placeholder="输入密码">
					</div>
				</div>
				<div class="row row-input clearfix">
					<div class="row-l fl"><i class="iconfont">&#xe692;</i></div>
					<div class="row-r">
						<input class="input_box" name="newpwds" placeholder="再次输入密码">
					</div>
				</div>
				<div class="row row-input clearfix">
					<div class="row-l fl"><i class="iconfont">&#xe608;</i></div>
					<div class="row-r">
						<input class="input_box" name="newname" placeholder="输入名称">
					</div>
				</div>
<!--				 <div class="row row-input clearfix">-->
<!--					 <div class="row-l fl"><i class="iconfont">&#xe608;</i></div>-->
<!--					 <div class="row-r">-->
<!--						 <input type="file" class="input_box" name="newfilePath" placeholder="上传头像">-->
<!--					 </div>-->
<!--				 </div>-->
				 <div class="row row-input clearfix">
					 <div class="row-l fl"><i class="iconfont">&#xe608;</i></div>
					 <div class="row-r">
						 <input class="input_box" name="newnickname" placeholder="输入昵称">
					 </div>
				 </div>
				 <div class="row row-input clearfix">
					 <div class="row-l fl"><i class="iconfont">&#xe608;</i></div>
					 <div class="row-r">
						 <input class="input_box" name="newemail" placeholder="输入邮箱">
					 </div>
				 </div>
				 <div class="row row-input clearfix">
					 <div class="row-l fl"><i class="iconfont">&#xe608;</i></div>
					 <div class="row-r">
						 <input class="input_box" name="newqianming" placeholder="输入签名">
					 </div>
				 </div>
				 <div class="row row-input clearfix">
					<div class="row-l fl"><i class="iconfont">&#xe6a8;</i></div>
					<div class="row-r">
						<span>性别</span>
						<label><input class="btn-radio" type="radio" name="radio1" value="男" checked>男</label>
						<label><input class="btn-radio" type="radio" name="radio1" value="女">女</label>
					</div>
				</div>
				 <div class="row row-input clearfix">
					<div class="row-l fl"><i class="iconfont">&#xe60f;</i></div>
					<div class="row-r">
						<span>支付方式</span>
						<label style="color: #24a82e;"><input class="btn-radio" type="radio" name="radio2" checked>微信</label>
						<label style="color: #2d95de;"><input class="btn-radio" type="radio" name="radio2">银行卡</label>
					</div>
				</div>
				<div class="row row-txt">
					<p><input class="checkbox" type="checkbox" name="checkbox">已阅读并同意<a href="user_xieyi.html">《微风向用户协议》</a></p>
				</div>
				<div class="row row-btn">
					<input type="submit" class="green-btn" value="确定">
<!--					<a class="green-btn">确定</a>-->
				</div>
			 </form>
  	 	 </div>
  	 </div>
     <div class="register-table">
     	<table>
     		<tr><th>非会员/会员权限对比</th><th>非会员</th><th>会员</th></tr>
     		<tr>
     			<td class="td-1">无限使用<span>贴贴</span>功能</td>
     			<td class="td-2">仅限浏览</td>
     			<td class="td-3">无限使用</td>
     		</tr>
     		<tr>
     			<td class="td-1">无限使用<span>美拍</span>功能</td>
     			<td class="td-2">仅限浏览</td>
     			<td class="td-3">无限使用</td>
     		</tr>
     		<tr>
     			<td class="td-1">无限使用<span>美言</span>功能</td>
     			<td class="td-2">仅限浏览</td>
     			<td class="td-3">无限使用</td>
     		</tr>
     		<tr>
     			<td class="td-1">无限使用<span>美视</span>功能</td>
     			<td class="td-2">仅限浏览购买</td>
     			<td class="td-3">无限使用</td>
     		</tr>
     		<tr>
     			<td class="td-1">无限使用<span>美视</span>功能</td>
     			<td class="td-2">仅限浏览购买</td>
     			<td class="td-3">无限使用</td>
     		</tr>
     		<tr>
     			<td class="td-1">一键生成<span>推广</span>二维码</td>
     			<td class="td-2">×</td>
     			<td class="td-3">无限使用</td>
     		</tr>
     		<tr>
     			<td class="td-1">分销系统帮你<span>赚钱</span></td>
     			<td class="td-2">×</td>
     			<td class="td-3">无限使用</td>
     		</tr>
     		<tr>
     			<td class="td-1">社区<span>促销奖励</span>活动</td>
     			<td class="td-2">×</td>
     			<td class="td-3">√</td>
     		</tr>
     		<tr>
     			<td class="td-1"><span>会费</span></td>
     			<td class="td-2">免费</td>
     			<td class="td-3">50元一次性</td>
     		</tr>
     	</table>
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
</body>
</html>
