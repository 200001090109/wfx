package com.servlet;

import com.service.BusinessService;
import com.service.imp.BusinessServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/delServlet")
public class delServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       long meiid = Long.parseLong(req.getParameter("meiid"));
        BusinessService bs = new BusinessServiceImp();
        bs.del(meiid);
        resp.sendRedirect("/weifeng/tiediy.jsp?type=3");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
