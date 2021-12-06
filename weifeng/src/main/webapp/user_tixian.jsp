<%--
  Created by IntelliJ IDEA.
  User: UP
  Date: 2021/12/6
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div class="title">个人资料</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
</header>
<div class="content u-index">
    <div class="tixian">
        <p class="tx_img">当前可提现余额</p>
        <p class="numeber">${sessionScope.user.yue}</p>
    </div>
    <div class="row tx-row-btn">
        <form action="/weifeng/ChangeMoneyServlet" method="post">
            <h3>输入提现金额</h3>
            <input type="text" name="money"><br/>
            <input type="submit" value="提交">
        </form>
<%--        <a href="" class="green-btn">提现</a>--%>
    </div>
</div>
</body>
</html>

