<%@ page import="com.service.BusinessService" %>
<%@ page import="com.service.imp.BusinessServiceImp" %>
<%@ page import="com.model.Wmei" %>
<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.User" %>
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
	long meiid = Long.parseLong(request.getParameter("meiid"));
	BusinessService bs = new BusinessServiceImp();
	Wmei wmei =  bs.getMeiById(meiid);
	User user = (User) session.getAttribute("user");
	List<Wmei> meis = bs.getAllZanById(user.getId());
	ArrayList<Long> zans = new ArrayList<>();
	for(Wmei mei:meis){
		zans.add(mei.getMie().getId());
	}
	meis = bs.getAllCollectById(user.getId());
	ArrayList<Long> collects = new ArrayList<>();
	for(Wmei mei:meis){
		collects.add(mei.getMie().getId());
	}
%>
<body>
  <header id="header">
  	<a href="#" class="iconfont fl">&#xe63f;</a>
    <div class="title">贴DIY详情</div>
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
  			<p class="title"><%=wmei.getMie().getTitle()%></p>
  			<p><img src="<%=wmei.getFirstPath()%>"></p>
  		</div>
  		<div class="info clearfix">
			<span class="author"><img src="images/user_mini.png"><%=wmei.getOwner().getNickname()%></span>
			<span class="zan">
				<a href="/weifeng/ZanServlet?flag=<%=zans.contains(meiid)?"0":"1"%>&meiId=<%=meiid%>&userId=${user.id}&url=${pageContext.request.requestURL}">
				<i class="iconfont"
				   style="color: <%=zans.contains(meiid)?"orange":"grey"%>;">&#xe600;
				</i><%=wmei.getMie().getBeizan()%>人点赞
			</a>
			</span>
			<span class="collect">
				<a
						href="/weifeng/CollectServlet?flag=<%=collects.contains(meiid)?"0":"1"%>&meiId=<%=meiid%>&userId=${user.id}&url=${pageContext.request.requestURL}">
				<i class="iconfont" style="color: <%=collects.contains(meiid)?"orange":"grey"%>;">&#xe605;
				</i><%=wmei.getMie().getBeishoucang()%>收藏
			</a>
			</span>
		</div>
  	</div> 
  	<div class="user_card clearfix">
  		<i class="icon icon-left"></i>
  		<i class="icon icon-right"></i>
  	 	<div class="item pic">
  	 		<div class="userimg"><img src="images/user.png"></div>
  	 		<div class="username"><%=wmei.getOwner().getNickname()%></div>
  	 	</div>
  	 	<div class="item info">
  	 		<div class="tel">电话：<%=wmei.getOwner().getTel()%></div>
  	 		<div class="signature">个性签名：</div>
  	 		<p class="signature_txt"><%=wmei.getOwner().getQianming()%></p>
  	 	</div>
  	 	<div class="item code">
  	 		<div class="codeimg"><img src="${pageContext.request.contextPath}/<%=wmei.getOwner().getCode()%>"></div>
  	 	</div>
  	 </div>
  </div>
<%@include file="footer.jsp"%>
</body>
</html>
