package com.servlet;

import com.model.User;
import com.service.imp.BusinessServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ChangeMoneyServlet")
public class ChangeMoneyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 获取用户提交的参数
        double money = Double.parseDouble(request.getParameter("money"));
        User user = (User) request.getSession().getAttribute("user");
        if (money > 0) {
            BusinessServiceImp bs = new BusinessServiceImp();
            // result: 当前剩余金额
            double result = bs.tixian(user.getId(), money);
            user.setYue(result);
            user.setTixian(user.getTixian()+money);
            if (result > 0) {
                request.getRequestDispatcher("user_index.jsp").forward(request, response);
            }else {
                // 余额不足
                request.getRequestDispatcher("user_tixian.jsp").forward(request, response);
            }
        }else {
            // 输入金额小于0
            request.getRequestDispatcher("user_tixian.jsp").forward(request, response);
        }
    }
}
