package com.servlet;

import com.model.Mei;
import com.model.Wmei;
import com.service.imp.BusinessServiceImp;
import com.utils.Upload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "UploadMeiServlet", value = "/UploadMeiServlet")
public class UploadMeiServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> message = Upload.upload(request, response);
        String type = message.get("type");
        long userId = Long.parseLong(message.get("userId"));
        String title = message.get("title");
        String text = message.get("text");
        String filePath = message.get("webPath");
        BusinessServiceImp bs = new BusinessServiceImp();
        Mei mei = new Mei(0,text,0,0,null,title,type,userId);
        Wmei wmei = new Wmei(mei);
        bs.addMei(wmei,userId,filePath);
        if(type.equals("美拍")) response.sendRedirect("/weifeng/mei_list.jsp");
        else response.sendRedirect("/weifeng/meiyan_list.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
