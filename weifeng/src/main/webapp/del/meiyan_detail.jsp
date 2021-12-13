<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>微风向</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<link href="../iconfont/iconfont.css" rel="stylesheet" type="text/css" />
</head>

<body>
  <header id="header">
  	<a href="../mei_list.jsp" class="iconfont fl">&#xe63f;</a>
    <div class="title">美言详情</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
  </header> 
  <div class="content con-detail">
  	<div class="top-nav">
  		<ul class="clearfix">
  			<li><span><i class="iconfont">&#xe61d;</i>全部分类</span></li>
  			<li><span><i class="iconfont">&#xe601;</i>点赞排序</span></li>
  			<li><span><i class="iconfont">&#xe616;</i>我DIY的</span></li>
  		</ul>
  	</div>
  	<div class="detail_box">
  		<div class="con">
        	<p class="title">手机能拍出什么样的照片？</p>
  			<p class="pic"><img src="../images/diy_detail.jpg"><i class="icon"><img src="../images/code.png"></i></p>
  		</div>
  		<div class="info clearfix">
			<span class="author"><img src="../images/user_mini.png">文娟</span>
			<span class="zan"><i class="iconfont">&#xe600;</i>298人点赞</span>
			<span class="collect"><i class="iconfont">&#xe605;</i>收藏</span>
		</div>
  	</div> 
  	<div class="user_card clearfix">
  		<i class="icon icon-left"></i>
  		<i class="icon icon-right"></i>
  	 	<div class="item pic">
  	 		<div class="userimg"><img src="../images/user.png"></div>
  	 		<div class="username">文娟~爱正顺久</div>
  	 	</div>
  	 	<div class="item info">
  	 		<div class="tel">电话：1384568899</div>
  	 		<div class="signature">个性签名：</div>
  	 		<p class="signature_txt">生活不仅有面包，还有诗和远方</p>
  	 	</div>
  	 	<div class="item code">
  	 		<div class="codeimg"><img src="../images/code.png"></div>
  	 	</div>
  	 </div>
  </div>
 
  <footer id="footer" class="foot">
        <ul>
            <li>
            	<a href="../index.jsp">
	                <span class="img"><img src="../images/nav1.png"></span>
	                <p>首页</p>
            	</a>
            </li>
            <li>
            	<a href="#">
                   <span class="img"><img src="../images/nav2.png"></span>
                   <p>贴DIY</p>
            	</a>
            </li>
            <li class="active">
            	<a href="../meidiy.jsp">
	                <span class="img"><img src="../images/nav3.png"></span>
	                <p>美DIY</p>
            	</a>
            </li>
            <li>
            	<a href="../user_login.jsp">
	                <span class="img"><img src="../images/nav4.png"></span>
	                <p>我的</p>
            	</a>
            </li>
        </ul>
  </footer>

</body>
</html>
