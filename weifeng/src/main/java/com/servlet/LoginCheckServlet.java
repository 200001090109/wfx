package com.servlet;

import com.dao.imp.UserDaoImp;
import com.model.User;
import com.model.Wmei;
import com.service.BusinessService;
import com.service.imp.BusinessServiceImp;

import javax.print.attribute.standard.RequestingUserName;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoginCheckServlet", value = "/LoginCheckServlet")
public class LoginCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String pwd = request.getParameter("pwd");
        UserDaoImp ud = new UserDaoImp();
        User user = ud.loginCheck(userName, pwd);
        if (user != null) {
            BusinessServiceImp bs = new BusinessServiceImp();
            List<Wmei> meis = bs.getAllZanById(user.getId());
            ArrayList<Long> zans = new ArrayList<>();
            for(Wmei mei:meis){
                zans.add(mei.getMie().getId());
            }
            meis = bs.getAllCollectById(user.getId());
            ArrayList<Long> collects = new ArrayList<>();
            for(Wmei mei:meis){
                collects.add(mei.getMie().getId());
            }
            request.getSession().setAttribute("user",user);
            request.getSession().setAttribute("zans", zans);
            request.getSession().setAttribute("collects", collects);
            if(request.getSession().getAttribute("friendId")!=null){
                long friendId = Long.parseLong(String.valueOf(request.getSession().getAttribute("friendId")));
                request.getSession().removeAttribute("friendId");
                bs.addFriend(user.getId(), friendId);
                bs.addFriend(friendId, user.getId());
            }
            response.sendRedirect("/weifeng/user_index.jsp?isLogin=ture");
        }else {
            request.getSession().setAttribute("user",new User(0,"?????????","?????????","weifeng//images//not_login.png",
                    "?????????","?????????","?????????","?????????","?????????",0,0));
            response.sendRedirect("/weifeng/user_login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
