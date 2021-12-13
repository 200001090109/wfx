<%@ page contentType="text/html;charset=UTF-8" errorPage="error.jsp" %>
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
  	<a href="#" class="iconfont fl">&#xe63f;</a>
    <div class="title">美DIY</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
  </header> 
  <div class="content meidiy">
  	   <ul>
  	   	   <li>
  	   	   	   <a href="mei_list.jsp?type=1&zas=1">
	  	   	   	   <div class="item item-1 clearfix">
	  	   	   	   	   <div class="pic fl"><i class="iconfont">&#xe62e;</i></div>
	  	   	   	   	   <div class="txt-box">
	  	   	   	   	   	  <h2>美拍</h2>
	  	   	   	   	   	  <p>自拍/摄影/风景/视角</p>
	  	   	   	   	   </div>
	  	   	   	   </div>
  	   	   	   </a>
  	   	   </li>
  	   	   <li>
			   <a href="mei_list.jsp?type=2&zas=1">
				   <div class="item item-2 clearfix">
					   <div class="pic fl"><i class="iconfont">&#xe69a;</i></div>
					   <div class="txt-box">
						  <h2>美言</h2>
						  <p>对白/思想/歌词/心情</p>
					   </div>
				   </div>
			   </a>
  	   	   </li>
  	   	   <li>
			   <a href="mei_list.jsp?type=3&zas=1">
  	   	   	   <div class="item item-3 clearfix">
  	   	   	   	   <div class="pic fl"><i class="iconfont">&#xe653;</i></div>
  	   	   	   	   <div class="txt-box">
  	   	   	   	   	  <h2>美视</h2>
  	   	   	   	   	  <p>搞笑/流行/价值/片段</p>
  	   	   	   	   </div>
  	   	   	   </div>
			   </a>
  	   	   </li>
  	   </ul>
  </div>
 
  <%@include file="footer.jsp"%>
</body>
</html>
