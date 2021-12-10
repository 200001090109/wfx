package com.servlet;

import com.model.User;
import com.service.imp.BusinessServiceImp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChangePwdServlet", value = "/ChangePwdServlet")
public class ChangePwdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String utel = request.getParameter("tel");
        String uemail = request.getParameter("email");
        String upwd = request.getParameter("pwd");

        BusinessServiceImp bs = new BusinessServiceImp();
        User user = (User) request.getSession().getAttribute("user");
        boolean flag = bs.alterPwd(username, utel, uemail, upwd);
        if (flag) {
            response.sendRedirect("/weifeng/user_login.jsp");
        }else {
            response.sendRedirect("/weifeng/user_mima.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
