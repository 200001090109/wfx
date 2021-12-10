package com.servlet;

import com.model.User;
import com.service.imp.BusinessServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ChangePwdServlet")
public class ChangePwdServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1.获取用户传来的参数
        String utel = request.getParameter("tel");
        String uemail = request.getParameter("email");
        String upwd = request.getParameter("pwd");
        BusinessServiceImp bs = new BusinessServiceImp();
        User user = (User) request.getSession().getAttribute("user");
        boolean flag = bs.alterPwd(user.getId(), utel, uemail, upwd);
        if (flag) {
            request.getRequestDispatcher("/weifeng/user_login.jsp").forward(request,response);
        }else {
            request.getRequestDispatcher("/weifeng/user_mima.html").forward(request,response);
        }

    }
}
