<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.service.BusinessService" %>
<%@ page import="com.service.imp.BusinessServiceImp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Wmei" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title>微风向</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="iconfont/iconfont.css" rel="stylesheet" type="text/css"/>
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
            <li><span><i class="iconfont">&#xe61d;</i><a href="tiediy.jsp?type=1">收藏排序</a></span></li>
            <li><span><i class="iconfont">&#xe601;</i><a href="tiediy.jsp?type=2">收藏排序</a></span></li>
            <li><span><i class="iconfont">&#xe616;</i><a href="tiediy.jsp?type=3">我DIY的</a></span></li>
        </ul>
    </div>
    <%
        BusinessService bs = new BusinessServiceImp();
        User user = (User) session.getAttribute("user");
        List<Wmei> wmeis;
        if (request.getParameter("type") == null) {
            wmeis = bs.getAllMei();
        } else {
            int type = Integer.parseInt(request.getParameter("type"));
            if (type == 1) wmeis = bs.getAllMeiOrderByShoucang();
            else if (type == 2) wmeis = bs.getAllMeiOrderByZan();
            else {
                wmeis = bs.getAllMei(user.getId());
            }
        }
    %>
    <c:if test="${user.id == 0}">
        <p class="">
            你当前还没有登陆哦<a href="user_login.jsp"><i style="color: #2dcc70">点击这里去登陆</i></a>
        </p>
    </c:if>
    <c:if test="${user.id != 0}">
        <c:if test="<%=wmeis.size()==0%>">
            <p>
                你还没有发布过美哦,<a href="meidiy.jsp"><i style="color: #2dcc70">点击这里去发布</i></a>
            </p>
        </c:if>
        <div class="column imgtxt-list">
            <div class="con-list">
                <ul class="clearfix">
                    <c:forEach items="<%=wmeis%>" var="wmei">
                        <li>
                            <div class="li-box clearfix">
                                <a href="tiediy_detail.jsp?meiid=${wmei.mie.id}" class="img fl"><img
                                        src="${pageContext.request.contextPath}/${wmei.firstPath}"></a>
                                <div class="txt-box">
                                    <p class="txt"><a href="tiediy_detail.jsp">${wmei.mie.title}</a></p>
                                    <div class="info clearfix">
	  	 						<span class="zan">
									<a href="/weifeng/ZanServlet?flag=${zans.contains(wmei.mie.id)?'0':1}&meiId=${wmei.mie.id}&userId=${user.id}&url=${pageContext.request.requestURL}">
                                        <i class="iconfont"
                                           style="color: ${zans.contains(wmei.mie.id)?'red':'grey'};">&#xe600;
                                        </i>${wmei.mie.beizan}
                                    </a>
								</span>
                                        <span class="collect">
									<a href="/weifeng/CollectServlet?flag=${collects.contains(wmei.mie.id)?'0':1}&meiId=${wmei.mie.id}&userId=${user.id}&url=${pageContext.request.requestURL}">
                                        <i class="iconfont" style="color:
                                                           ${collects.contains(wmei.mie.id)?'orange':'grey'}">&#xe605;
                                        </i>${wmei.mie.beishoucang}
                                    </a>
								</span>
                                        <span class="author"><img
                                                src="${pageContext.request.contextPath}/${wmei.owner.filePath}">${wmei.owner.nickname}</span>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>


                </ul>

                <div class="Edit">
                    <a href="meidiy.jsp" class="edit-btn"><i class="iconfont">&#xe62e;</i>我要贴</a>
                </div>
            </div>
        </div>
    </c:if>
</div>

<%@include file="footer.jsp" %>
</body>
</html>
