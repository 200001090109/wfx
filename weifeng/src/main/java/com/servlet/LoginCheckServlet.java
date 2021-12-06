package com.servlet;

import com.dao.imp.UserDaoImp;
import com.model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LoginCheckServlet", value = "/LoginCheckServlet")
public class LoginCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String pwd = request.getParameter("pwd");
        UserDaoImp ud = new UserDaoImp();
        User user = ud.loginCheck(userName, pwd);
        if (user != null) {
            request.getSession().setAttribute("user",user);
            response.sendRedirect("/wf/user_index.jsp?isLogin=ture");
        }else {
            request.getSession().setAttribute("user",new User(0,"未登陆","未登陆","weifeng//images//not_login.png",
                    "未登陆","未登陆","未登陆","未登陆","未登陆",0,0));
            response.sendRedirect("/wf/user_login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
