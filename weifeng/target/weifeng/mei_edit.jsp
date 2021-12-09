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
        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
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
    <div class="content mei_edit">
        <div class="detail_box">
            <div class="con">
                <div class="row-r1">
                    <input class="input_title" placeholder="请输入标题（必填）" pattern=".{1,20}" name="title">
                </div>
                <div class="row-r1">
                    <input class="input_title" placeholder="请输入内容（必填）" pattern=".{1,20}" name="characters">
                </div>
                
        </div>
        <div class=" clearfix"></div>
    </div>

    </div>
    <footer id="footer" class="foot">
        <a href="javascript:;" onclick="document.getElementById('shangchuan').submit()" class="green-btn ft-btn">发布</a>
    </footer>
</form>
<div id="uploadFile" style="width: 100%;text-align: center;">
    <div class="wrapper">
        <div class="image">
            <img src="" style="height: 200px;width: 200px;">
        </div>
        <div class="content" style="padding: 0;">
            <div class="icon"><i class="fas fa-cloud-upload-alt"></i></div>
            <div class="text">No file chosen, yet!</div>
        </div>
        <div id="cancel-btn"><i class="" fas fa-times></i></div>
        <div class="file-name" style="height: 30px;line-height: 30px;margin: 10px auto;">File name here</div>
    </div>
    <input id="default-btn" type="file" hidden>
    <button onclick="defaultBtnActive()" id="custom-btn">Choose a file</button>
</div>
</body>

<script>
    const wrapper = document.querySelector(".wrapper");
    const fileName = document.querySelector(".file-name");
    const cancelBtn = document.querySelector("#cancel-btn");
    const defaultBtn = document.querySelector("#default-btn");
    const customBtn = document.querySelector("#custom-btn");
    const text = document.getElementsByClassName("text")[0];
    const img = document.querySelector("img");
    let regExp = /[0-9a-zA-Z\^\&\'\@\{\}\[\]\,\$\=\!\-\#\(\)\.\%\+\~\_ ]+$/;

    function defaultBtnActive() {
        defaultBtn.click();
    }

    defaultBtn.addEventListener("change", function () {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function () {
                const result = reader.result;
                img.src = result;
                text.style.visibility = "hidden";
            }
            cancelBtn.addEventListener("click", function () {
                img.src = "";
                wrapper.classList.remove("active");
            });
            reader.readAsDataURL(file);
        }
        if (this.value) {
            let valueStore = this.value.match(regExp);
            fileName.textContent = valueStore;
        }
    });
</script>
</html>
