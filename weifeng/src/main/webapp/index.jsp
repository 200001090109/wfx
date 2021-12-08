<%--首页--%>
<%@ page import="com.service.BusinessService" %>
<%@ page import="com.service.imp.BusinessServiceImp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Wmei" %>
<%@ page import="com.model.User" %>
<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title>微风向</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/iconfont/iconfont.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
</head>
<%
    User user = (User) session.getAttribute("user");
%>
<body>
<header id="header">
    <a href="#" class="iconfont fl">&#xe63f;</a>
    <div class="title">微风向首页</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
</header>
<div class="content">

    <div class="user_card clearfix">
        <div class="item pic">
            <div class="userimg"><img src="${pageContext.request.contextPath}/${user.filePath}"></div>
            <div class="username">${user.nickname}</div>
        </div>
        <div class="item info">
            <div class="tel">电话：${user.tel}</div>
            <div class="signature">个性签名：</div>
            <p class="signature_txt">${user.nickname}</p>
        </div>
        <div class="item code">
            <div class="codeimg" style="position: relative;">
                <c:choose>
                    <c:when test="${user.code==null}">
                        <img src="${pageContext.request.contextPath}/images/login.png" alt="" style="opacity: 0.1;">
                        <a href="/weifeng/user_code.jsp" style="position: absolute;top: 50%;left: 50%;transform:
                        translate(-50%, -50%);text-decoration: underline;color: #2d95de;font-size: 12px;">
                            去生成二维码</a>
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/${user.code}" alt="">
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <c:if test="${user.id == 0}">
        <p class="">
            你当前还没有登陆哦<a href="user_login.jsp"><i style="color: #2dcc70">点击这里去登陆</i></a>
        </p>
    </c:if>

    <c:if test="${user.id != 0}">


    <div class="column column-1 card-list">
        <div class="title">
            <span class="titletext fl"><i class="iconfont">&#xe62e;</i>美拍推荐</span>
            <a href="mei_list.jsp" class="more fr">更多<i class="iconfont">&#xe65f;</i></a>
        </div>
        <div class="con-list">
            <ul class="clearfix">
                <%
                    BusinessService bs = new BusinessServiceImp();
                    List<Wmei> meipai = bs.getByType(user.getId(),"美拍");
                %>
                <c:forEach items="<%=meipai%>" var="pai">
                    <li>
                        <div class="photo-card">
                            <a href="tiediy_detail.jsp?meiid=${pai.mie.id}" class="img"><img src="${pageContext.request.contextPath}/${pai.firstPath}" ></a>
                            <p class="txt"><a href="tiediy_detail.jsp">${pai.mie.title}</a></p>
                            <div class="info clearfix">
                                <span class="author"><img src="${pageContext.request.contextPath}/${user.filePath}">${user.nickname}</span>
                                <span class="zan">
                                    <a href="/weifeng/ZanServlet?flag=${zans.contains(pai.mie.id)?'0':1}&meiId=${pai.mie.id}&userId=${user.id}&url=${pageContext.request.requestURL}">
                                        <i class="iconfont"
                                           style="color: ${zans.contains(pai.mie.id)?'red':'grey'};">&#xe600;
                                        </i>${pai.mie.beizan}
                                    </a>
                                </span>
                                <span class="collect">
                                    <a href="/weifeng/CollectServlet?flag=${collects.contains(pai.mie.id)?'0':1}&meiId=${pai.mie.id}&userId=${user.id}&url=${pageContext.request.requestURL}">
                                        <i class="iconfont" style="color:
                                                           ${collects.contains(pai.mie.id)?'orange':'grey'}">&#xe605;</i>${pai.mie.beishoucang}
                                    </a>
                                </span>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>

        </div>
    </div>
        <hr>
    <div class="column column-2 card-list">
        <div class="title">
            <span class="titletext fl"><i class="iconfont">&#xe69a;</i>美言推荐</span>
            <a href="mei_list.jsp" class="more fr">更多<i class="iconfont">&#xe65f;</i></a>
        </div>
        <div class="con-list">
            <ul class="clearfix">
                <%
                    List<Wmei> yans = bs.getByType(user.getId(),"美言");
                %>
                <c:forEach items="<%=yans%>" var="yan">
                <li>
                    <div class="photo-card">
                        <a href="${pageContext.request.contextPath}/yan_detail.jsp?meiid=${yan.mie.id}" class="img" ><img src="${pageContext.request.contextPath}/${yan.firstPath}" ></a>
                        <p class="txt"><a href="#">${yan.mie.title}</a></p>
                        <div class="info clearfix">
                            <span class="author"><img src="${pageContext.request.contextPath}/${user.filePath}">${yan.mie.title}</span>
                            <span class="zan">
                                <a href="/weifeng/ZanServlet?flag=${zans.contains(yan.mie.id)?'0':1}&meiId=${yan.mie.id}&userId=${user.id}&url=${pageContext.request.requestURL}">
                                        <i class="iconfont"
                                           style="color: ${zans.contains(yan.mie.id)?'red':'grey'};">&#xe600;
                                        </i>${yan.mie.beizan}
                                    </a>
                            </span>
                            <span class="collect">
                                <a href="/weifeng/CollectServlet?flag=${collects.contains(yan.mie.id)?'0':1}&meiId=${yan.mie.id}&userId=${user.id}&url=${pageContext.request.requestURL}">
                                        <i class="iconfont" style="color:
                                                           ${collects.contains(yan.mie.id)?'orange':'grey'}">&#xe605;
                                        </i>${yan.mie.beishoucang}
                                    </a>
                            </span>
                        </div>
                    </div>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="column column-3 card-list">
        <div class="title">
            <span class="titletext fl"><i class="iconfont">&#xe653;</i>美视推荐</span>
            <a href="#" class="more fr">更多<i class="iconfont">&#xe65f;</i></a>
        </div>
        <div class="con-list">
            <ul class="clearfix">
                <li>
                    <div class="photo-card">
                        <a href="${pageContext.request.contextPath}/shi_detail.jsp" class="img" ><img src="images/img5.jpg" ></a>
                        <p class="txt"><a href="#">霍比屯的日常</a></p>
                        <div class="info clearfix">
                            <span class="author"><img src="images/user_mini.png">sfjjkjh</span>
                            <span class="zan"><i class="iconfont">&#xe600;</i>298</span>
                            <span class="collect"><i class="iconfont">&#xe605;</i>55</span>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="photo-card">
                        <a href="#" class="img" ><img src="images/img6.jpg" ></a>
                        <p class="txt"><a href="#">霍比屯的日常</a></p>
                        <div class="info clearfix">
                            <span class="author"><img src="images/user_mini.png">sfjjkjh</span>
                            <span class="zan"><i class="iconfont">&#xe600;</i>298</span>
                            <span class="collect"><i class="iconfont">&#xe605;</i>54</span>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <div class="column column-4 imgtxt-list">
        <div class="title">
            <span class="titletext fl"><i class="iconfont">&#xe603;</i>贴贴精选</span>
            <a href="tiediy.jsp" class="more fr">更多<i class="iconfont">&#xe65f;</i></a>
        </div>
        <div class="con-list">
            <ul class="clearfix">
            <%
                List<Wmei> jxs = bs.getJingxuan(0);
            %>
                <c:forEach items="<%=jxs%>" var="jx">
                    <li>
                        <div class="li-box clearfix">
                            <a href="tiediy_detail.jsp" class="img fl"><img src="${pageContext.request.contextPath}/${jx.firstPath}" ></a>
                            <div class="txt-box">
                                <p class="txt"><a href="tiediy_detail.jsp">${jx.mie.title}</a></p>
                                <div class="info clearfix">
                                    <span class="zan">
                                        <a href="/weifeng/ZanServlet?flag=${zans.contains(jx.mie.id)?'0':1}&meiId=${jx.mie.id}&userId=${user.id}&url=${pageContext.request.requestURL}">
                                        <i class="iconfont"
                                           style="color: ${zans.contains(jx.mie.id)?'red':'grey'};">&#xe600;
                                        </i>${jx.mie.beizan}人赞
                                    </a>
                                    </span>
                                    <span class="collect">
                                        <a
                                                href="/weifeng/CollectServlet?flag=${collects.contains(jx.mie.id)?'0':1}&meiId=${jx.mie.id}&userId=${user.id}&url=${pageContext.request.requestURL}">
                                        <i class="iconfont" style="color:
                                                           ${collects.contains(jx.mie.id)?'orange':'grey'}">&#xe605;
                                        </i>${jx.mie.beishoucang}人收藏
                                    </a>
                                    </span>
                                    <span class="author"><img src="${pageContext.request.contextPath}/${jx.owner.filePath}"></span>
                                </div>
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

<!--回到顶部-->
<script type="text/javascript">
    var $top = $('#go-top');
    $(window).bind('scroll',function(){
        var $this = $(this);
        if($this.scrollTop() > 360){
            $top.show();
        }else{
            $top.hide();
        }
    })
    function goTop(){
        $('html,body').animate({
            scrollTop:0
        },400)
    }
</script>

</html>
