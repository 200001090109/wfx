<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.service.BusinessService" %>
<%@ page import="com.service.imp.BusinessServiceImp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Wmei" %>
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
  	<a href="#" class="iconfont fl">&#xe63f;</a>
    <div class="title">贴DIY</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
  </header> 
  <div class="content">
  	<div class="top-nav">
  		<ul class="clearfix">
  			<li><span><i class="iconfont">&#xe61d;</i>全部分类</span></li>
  			<li><span><i class="iconfont">&#xe601;</i>点赞排序</span></li>
  			<li><span><i class="iconfont">&#xe616;</i>我DIY的</span></li>
  		</ul>
  	</div>
	  <%
		  BusinessService bs = new BusinessServiceImp();
		  List<Wmei> wmeis = bs.getAllMei();
	  %>
  	<div class="column imgtxt-list">
  	 	<div class="con-list">
  	 		<ul class="clearfix">
				<c:forEach items="<%=wmeis%>" var="wmei">
  	 			<li>
  	 				<div class="li-box clearfix">
  	 					<a href="tiediy_detail.html" class="img fl" ><img src="${pageContext.request.contextPath}/${wmei.firstPath}"></a>
  	 					<div class="txt-box">
	  	 					<p class="txt"><a href="tiediy_detail.html">${wmei.mie.title}</a></p>
	  	 					<div class="info clearfix">
	  	 						<span class="zan"><i class="iconfont">&#xe600;</i>${wmei.mie.beizan}</span>
	  	 						<span class="collect"><i class="iconfont">&#xe605;</i>${wmei.mie.beishoucang}</span>
	  	 						<span class="author"><img src="${pageContext.request.contextPath}/${wmei.owner.filePath}">${wmei.owner.nickname}</span>
	  	 					</div>
	  	 				</div>
  	 				</div>
  	 			</li>
				</c:forEach>


  	 		</ul>

  	 	    <div class="Edit">
  	 	    	<a href="meidiy.html" class="edit-btn"><i class="iconfont">&#xe62e;</i>我要贴</a>
  	 	    </div>
  	 	</div>
  	</div>  
  </div>
 
<%@include file="footer.jsp"%>
</body>
</html>
