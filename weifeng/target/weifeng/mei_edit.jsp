<%--发布美的界面--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title>微风向</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/iconfont/iconfont.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        #uploadCard {
            border: 2px solid #7FDAD0;
            height: 250px;
            width: 250px;
            position: absolute;
            top: 40%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #uploadCard img {
            height: 100%;
            width: 100%;
        }

        #customBtn {
            position: absolute;
            bottom: -60px;
            width: 150px;
            height: 40px;
            background-color: #7FDAD0;
            border: none;
            color: #ffffff;
        }
    </style>
</head>

<body style="background:#fff;">
<header id="header">
    <a href="mei_list.jsp" class="iconfont fl">&#xe63f;</a>
    <div class="title">美拍/美言</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
</header>
<form id="shangchuan" action="${pageContext.request.contextPath}/UploadMeiServlet" enctype="multipart/form-data"
      method="post">
    <input type="hidden" value="${user.id}" name="userId">
    <input type="hidden" value="美言" name="type">
    <div class="content mei_edit">
        <div class="detail_box">
            <div class="con">
                <div class="row-r1">
                    <input class="input_title" placeholder="请输入标题（必填）" pattern=".{1,20}" name="title">
                </div>
                <div class="row-r1">
                    <input class="input_title" placeholder="请输入内容（必填）" pattern=".{1,20}" name="text">
                </div>
                <div id="uploadCard">
                    <input type="button" id="customBtn" value="选择图片" onclick="upload()" />
                    <input type="file" id="defaultBtn" hidden name="file">
                    <img src="" alt="请选择图片" id="review">

                </div>
        </div>
    </div>

    </div>
    <footer id="footer" class="foot">
        <a onclick="document.getElementById('shangchuan').submit()" class="green-btn ft-btn">发布</a>
    </footer>
</form>
</body>

<script>
    const defaultBtn = document.getElementById("defaultBtn");
    const image = document.getElementById("review");
    function upload() {
        defaultBtn.click();
    }
    defaultBtn.addEventListener("change", function(){
        const file = this.files[0];
        if(file){
            const reader = new FileReader();
            reader.onload = function () {
                const result = reader.result;
                image.src = result;
            }
            reader.readAsDataURL(file);
        }
    })
</script>
</html>
