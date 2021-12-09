<%@ page import="com.service.BusinessService" %>
<%@ page import="com.model.User" %>
<%@ page import="com.service.imp.BusinessServiceImp" %>
<%@ page import="com.model.Wmei" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: UP
  Date: 2021/12/9
  Time: 8:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title>微风向</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/iconfont/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<%
    BusinessService bs = new BusinessServiceImp();
    Long id = ((User) session.getAttribute("user")).getId();
    List<Wmei> wmeis = bs.getByType(id, "美言");
%>
<body>
<header id="header">
    <a href="#" class="iconfont fl">&#xe63f;</a>
    <div class="title">美言</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
</header>
<div class="content mei_list">
    <div class="top-nav">
        <ul class="clearfix">
            <li><span><i class="iconfont">&#xe61d;</i>全部分类</span></li>
            <li><span><i class="iconfont">&#xe601;</i>点赞排序</span></li>
            <li><span><i class="iconfont">&#xe616;</i>我DIY的</span></li>
        </ul>
    </div>

    <c:if test="${user.id == 0}">
        <p class="">
            你当前还没有登陆哦<a href="user_login.jsp"><i style="color: #2dcc70">点击这里去登陆</i></a>
        </p>
    </c:if>
    <c:if test="${user.id !=0}">
        <div class="card-list">
            <div class="con-list">
                <ul class="clearfix">

                    <li class="first">
                        <div class="photo-card" style=" background:#f0f0f0;">
                            <a href="mei_edit.jsp" class="upload_btn">
                                <i class="iconfont">&#xe602;</i>
                                <p>上传图片/文字</p>
                            </a>
                        </div>
                    </li>
                    <c:forEach var="wmei" items="<%=wmeis%>">
                        <li>
                            <div class="photo-card">
                                <a href="tiediy_detail.jsp?meiid=${wmei.mie.id}" class="img" style="background-image: url(${pageContext.request.contextPath}/${wmei.firstPath});"></a>
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
    </c:if>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
