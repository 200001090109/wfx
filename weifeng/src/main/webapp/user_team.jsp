<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.service.imp.BusinessServiceImp" %>
<%@ page import="com.dao.imp.UserDaoImp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	User user = (User) session.getAttribute("user");
	UserDaoImp userDaoImp = new UserDaoImp();
	List<User> friends = userDaoImp.getFriends(user.getId());
%>
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
    <div class="title">我的团队</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
  </header> 
  <div class="content">
	  <div class="ul-list">
  	  	   <ul class="team">
			   <%
				   for (User friend : friends) {
			   %>
			   <li class="pic">
				   <span class="fl"><img src="<%=friend.getFilePath()%>"></span><%=friend.getNickname()%>
			   </li>
			   <%
				   }
			   %>
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
