package com.servlet;

import com.utils.Upload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

@WebServlet(name = "UploadMeiServlet", value = "/UploadMeiServlet")
public class UploadMeiServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        //        String len;
//        while ((len = request.getReader().readLine())!=null) System.out.printf(len);;
//
//        String[] s;
//        response.getWriter().println("ok");

        //response.getWriter().flush();
//        BusinessServiceImp bs = new BusinessServiceImp();
//        User user = (User) request.getSession().getAttribute("user");
//        long userId = user.getId();
//        String title = request.getParameter("title");
//        String characters = request.getParameter("characters");
//        String fenlei = request.getParameter("fenlei");
//        System.out.println(title+characters+fenlei);
//        String[] webapps = filePath.split("\\\\");
//        filePath = webapps[webapps.length-2] + "/" + webapps[webapps.length-1];

//        Mei mei = new Mei(0,characters,0,0,null,title,fenlei,userId);
//        Wmei wmei = new Wmei(mei);
//        bs.addMei(wmei,userId,filePath);
//        response.sendRedirect("/weifeng/mei_list.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
