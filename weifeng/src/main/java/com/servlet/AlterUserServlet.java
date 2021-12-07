package com.servlet;

import com.model.User;
import com.service.BusinessService;
import com.service.imp.BusinessServiceImp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AlterUserServlet", value = "/AlterUserServlet")
public class AlterUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nickname = request.getParameter("nickname");
        String sex = request.getParameter("sex");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String qianming = request.getParameter("qianming");
        int userid = Integer.parseInt(request.getParameter("userid"));
        BusinessService bs = new BusinessServiceImp();
        bs.userAlter(new User(userid,null,null,null,nickname,sex,tel,email,qianming));
        request.getSession().setAttribute("user",bs.getYserById(userid));
        response.sendRedirect("/weifeng/user_info.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
