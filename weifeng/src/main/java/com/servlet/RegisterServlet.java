package com.servlet;

import com.model.User;
import com.service.imp.BusinessServiceImp;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.UUID;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        // 1.获取上传的信息
        // 手机号
        String newtel = request.getParameter("newtel");
        // 密码
        String newpwd = request.getParameter("newpwd");
        String newpwds = request.getParameter("newpwds");
        // 名称
        String newname = request.getParameter("newname");
        // 昵称
        String newnickname = request.getParameter("newnickname");
        // 邮箱
        String newemail = request.getParameter("newemail");
        // 签名
        String newqianming = request.getParameter("newqianming");
        // 性别
        String[] radio1s = request.getParameterValues("radio1");
        String newsex = radio1s[0];

        BusinessServiceImp bs = new BusinessServiceImp();
        User user = new User(0,newname,newpwd,"images/login.png", newnickname, newsex, newtel, newemail, newqianming, 0,0);
        bs.addUser(user);
        request.getRequestDispatcher("user_login.jsp").forward(request,response);
    }


}
