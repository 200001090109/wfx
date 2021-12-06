package com.servlet;

import com.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "GetCodeServlet", value = "/GetCodeServlet")
public class GetCodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        user.setCode("images/code.png");
        session.setAttribute("user", user);
        req.getRequestDispatcher("/user_code.jsp").forward(req, resp);
    }
}
