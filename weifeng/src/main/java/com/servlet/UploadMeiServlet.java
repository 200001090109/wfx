package com.servlet;

import com.model.FilePath;
import com.model.Mei;
import com.model.User;
import com.model.Wmei;
import com.service.imp.BusinessServiceImp;
import com.utils.Upload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UploadMeiServlet", value = "/UploadMeiServlet")
public class UploadMeiServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = Upload.upload(request, response);
        String[] webapps = filePath.split("\\\\");
        filePath = webapps[webapps.length-2] + "/" + webapps[webapps.length-1];
        BusinessServiceImp bs = new BusinessServiceImp();
        User user = (User) request.getSession().getAttribute("user");
        long userId = user.getId();
        String title = request.getParameter("title");
        String characters = request.getParameter("characters");
        String fenlei = request.getParameter("fenlei");
        Mei mei = new Mei(0,characters,0,0,null,title,fenlei,userId);
        Wmei wmei = new Wmei(mei);
        bs.addMei(wmei,userId,filePath);
        response.sendRedirect("/weifeng/mei_list.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
