package com.servlet;

import com.model.User;
import com.service.BusinessService;
import com.service.imp.BusinessServiceImp;
import com.utils.CodeImageUtil;

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
        long userId = Long.parseLong(req.getParameter("userId"));
        try {
            BusinessServiceImp bs = new BusinessServiceImp();
            bs.addCodeImage("", userId);
            String friendUrl = "http://192.168.43.61:8080/weifeng/makefriend?userId=" + userId;
            String codePath = CodeImageUtil.getCode("E:\\git\\wfx\\wfx\\weifeng\\src\\main\\webapp\\images\\", userId,friendUrl);
//            String codePath = CodeImageUtil.getCode("E:\\Projects\\wfx\\weifeng\\src\\main\\webapp\\images\\", userId, friendUrl);
        } catch (Exception e) {
            e.printStackTrace();
        }
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        user.setCode("images/" + userId +"_code.jpg");
        session.setAttribute("user", user);
        req.getRequestDispatcher("/user_code.jsp").forward(req, resp);
    }
}
