package com.servlet;

import com.model.User;
import com.service.BusinessService;
import com.service.imp.BusinessServiceImp;
import com.utils.alterUpload;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "TAlterUserServlet", value = "/TAlterUserServlet")
public class TAlterUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> message = alterUpload.upload(request, response);
        String nickname = message.get("nickname");
        String sex = message.get("sex");
        String email = message.get("email");
        String tel = message.get("tel");
        String qianming = message.get("qianming");
        int userid = Integer.parseInt(message.get("userid"));
        String filePath = (String) message.get("webPath");
        BusinessService bs = new BusinessServiceImp();
        bs.userAlter(new User(userid,null,null,filePath,nickname,sex,tel,email,qianming));
        request.getSession().setAttribute("user",bs.getYserById(userid));
        response.sendRedirect("/weifeng/user_info.jsp");


        for (Map.Entry<String, String> entry : message.entrySet()) {
            String mapKey = entry.getKey();
            String mapValue = entry.getValue();
            System.out.printf(mapKey + "：" + mapValue+"<br>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
