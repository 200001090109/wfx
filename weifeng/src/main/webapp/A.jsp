<%--用于测试的jsp--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title>微风向</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/iconfont/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body>

<header id="header">
    <a href="user_index.jsp" class="iconfont fl">&#xe63f;</a>
    <div class="title">个人资料</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
</header>
<div class="content">
    <div class="ul-list">
        <ul>
            <li class="pic">
                <a>头像
                    <span class="fr"><img src="${sessionScope.curUser.filePath}"></span>
                </a>
            </li>
        </ul>
    </div>
    <div class="ul-list">
        <ul>
            <li>
                <a href="#" class="arrow-right">昵称
                    <span class="fr">${sessionScope.curUser.name}</span>
                </a>
            </li>
            <li>
                <a href="#" class="arrow-right">性别
                    <span class="fr">${sessionScope.curUser.sex}</span>
                </a>
            </li>
            <li>
                <a href="#" class="arrow-right">电话
                    <span class="fr">${sessionScope.curUser.tel}</span>
                </a>
            </li>
            <li>
                <a href="#" class="arrow-right">邮箱
                    <span class="fr">${sessionScope.curUser.email}</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="ul-list">
        <ul>
            <li>
                <a class="arrow-right">个性签名
                    <span class="fr">修改</span>
                </a>
            </li>
        </ul>
    </div>
</div>

<%@include file="footer.jsp"%>>
</body>
</html>

