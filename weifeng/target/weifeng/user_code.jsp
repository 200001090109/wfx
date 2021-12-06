<%@ page import="com.model.User" %>
<%@ page contentType="text/html;charset=UTF-8"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>微风向</title>
<meta charset="utf-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>我的二维码</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link href="iconfont/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <header id="header">
  	<a href="user_index.jsp" class="iconfont fl">&#xe63f;</a>
    <div class="title">我的二维码</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
  </header>
    <div>${user.code}</div>
  <div id="content">
      <div id="con-two">
          <div class="con-code">
          <p><img src="${pageContext.request.contextPath}/${user.code==null?'/images/loading.gif':user.code}" alt="null"
          /></p>
          <p>${codePath==null?'快生成专属二维码吧':'扫码上面的二维码，加为好友'}</p>
          </div>
          <div id="bottom">
             <a class="green-btn" href="/weifeng/GetCodeServlet?userId=${user.id}">一键生成</a>
          </div>
        </div>
        <div class="clearfix"></div>
  </div>
</body>
</html>
