<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.model.User" %>
<%@ page import="com.model.Wmei" %>
<%@ page import="java.util.List" %>
<%@ page import="com.service.BusinessService" %>
<%@ page import="com.service.imp.BusinessServiceImp" %>
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
	User user = (User) session.getAttribute("user");
	BusinessService bs = new BusinessServiceImp();
	List<Wmei> wmeis = bs.getShouchangBytype(user.getId(),0);
%>
<body>
  <header id="header">
  	<a href="user_index.jsp" class="iconfont fl">&#xe63f;</a>
    <div class="title">我的收藏</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
  </header> 
  <div class="content">
	<div class="top-nav1">
  		<ul class="clearfix">
  			<li><span class="now"><a href="user_collect.jsp">贴贴</a></span></li>
  			<li><span><a href="user_collect1.jsp?type=1">美拍</a></span></li>
  			<li><span><a href="user_collect1.jsp?type=2">美言</a></span></li>
            <li><span><a href="user_collect1.jsp?type=3">美视</a></span></li>
  		</ul>
  	</div>
	  <c:if test="<%=wmeis.size()==0%>">
		  <p align="center"><i>你还没有收藏过哦</i></p>
	  </c:if>
	<div class="column imgtxt-list">
  	 	<div class="con-list">

  	 		<ul class="clearfix">
				<c:forEach items="<%=wmeis%>" var="wmei">
					<li>
						<div class="li-box clearfix">
							<a href="tiediy_detail.jsp?meiid=${wmei.mie.id}" class="img fl" style="background-image: url(${pageContext.request.contextPath}/${wmei.firstPath});"></a>
							<div class="txt-box">
								<p class="txt"><a href="tiediy_detail.jsp?meiid=${wmei.mie.id}">${wmei.mie.title}</a></p>
								<div class="info clearfix">
									<span class="zan"><i class="iconfont">&#xe600;</i>${wmei.mie.beizan}人点赞</span>
									<span class="collect"><i class="iconfont">&#xe605;</i>${wmei.mie.beishoucang}人收藏</span>
									<span class="author"><img src="${pageContext.request.contextPath}/${wmei.owner.filePath}">${wmei.owner.nickname}</span>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
  	 			
  	 		</ul>
  	 	</div>
  	</div>
     
  </div>
 
<%@include file="footer.jsp"%>
</body>
</html>
