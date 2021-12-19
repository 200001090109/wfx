<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.model.Wmei" %>
<%@ page import="com.model.User" %>
<%@ page import="com.service.imp.BusinessServiceImp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.service.BusinessService" %>
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
<%
	int type = 1;
	if(request.getParameter("type")!=null){
		type = Integer.parseInt(request.getParameter("type"));
	}
	if(type>3||type<1)type=1;
	User user = (User) session.getAttribute("user");
	BusinessService bs = new BusinessServiceImp();
	List<Wmei> wmeis = bs.getShouchangBytype(user.getId(),type);
%>
<body>
  <header id="header">
  	<a href="user_index.jsp" class="iconfont fl">&#xe63f;</a>
    <div class="title">我的收藏</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
  </header> 
  <div class="content mei_list">
	<div class="top-nav1">
  		<ul class="clearfix">
  			<li><span><a href="user_collect.jsp">贴贴</a></span></li>
  			<li><span><a href="user_collect1.jsp?type=1">美拍</a></span></li>
  			<li><span><a href="user_collect1.jsp?type=2">美言</a></span></li>
            <li><span><a href="user_collect1.jsp?type=3">美视</a></span></li>
  		</ul>
  	</div>
	<div class="card-list">
  		<div class="con-list">
			<c:if test="<%=wmeis.size()==0%>">
				<p align="center"><i>你还没有收藏过哦</i></p>
			</c:if>
  	 		<ul class="clearfix">
				<c:forEach items="<%=wmeis%>" var="mei">
					<li>
						<div class="photo-card">
							<a href="tiediy_detail.jsp?meiid=${wmei.mie.id}" class="img" style="background-image: url(${pageContext.request.contextPath}/${mei.firstPath});"></a>
							<p class="txt"><a href="#">${wmei.mie.title}</a></p>
							<div class="info clearfix">
								<span class="author"><img src="${pageContext.request.contextPath}/${user.filePath}">${user.nickname}</span>
								<span class="zan"><i class="iconfont">&#xe600;</i>${wmei.mie.beizan}</span>
								<span class="collect"><i class="iconfont">&#xe605;</i>${wmei.mie.beishoucang}</span>
							</div>
						</div>
					</li>
				</c:forEach>
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
