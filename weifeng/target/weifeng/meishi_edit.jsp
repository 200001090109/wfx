<%--发布美的界面--%>
<%@ page contentType="text/html;charset=UTF-8" errorPage="error.jsp"%>
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


        #Btn {
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
    <div class="title">美视</div>
    <a href="#" class="iconfont fr">&#xe6a0;</a>
</header>
<form id="shangchuan" action="${pageContext.request.contextPath}/UpVideoServlet" enctype="multipart/form-data"
      method="post">
    <input type="hidden" value="${user.id}" name="userId">
    <input type="hidden" value="美视" name="type">
    <div class="content mei_edit">
        <div class="detail_box">
            <div class="con">
                <div class="row-r1">
                    <input class="input_title" placeholder="请输入标题（必填）" pattern=".{1,20}" name="title">
                </div>
                <div class="row-r1">
                    <input class="input_title" placeholder="请输入内容（必填）" pattern=".{1,20}" name="text">
                </div>
                <br>
                <br>
                <div id="uploadCard">
                    <video width="320" height="240" controls>
                        <input type="file" id="videoInput">
                        <source src="video/a.mp4" type="video/mp4">
                    </video>
                    <button id="Btn">选择视频</button>
                </div>
            </div>
        </div>

    </div>
    <footer id="footer" class="foot">
        <a onclick="document.getElementById('shangchuan').submit()" class="green-btn ft-btn">发布</a>
    </footer>
</form>
<%--<input type="file" id="videoInput">--%>
<%--<video src="" alt="预览" id="video" controls="controls">--%>
    <script>
        const videoInput = document.getElementById('videoInput');
        videoInput.addEventListener('change', e => {
            previewByReader(e.target.files[0])
        })
        function previewByReader (file) {
            const fileReader = new FileReader()
            fileReader.readAsDataURL(file)
            fileReader.onload = (e) => {
                console.log(e.target)
                video.src = e.target.result
            }
        }
    </script>
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
