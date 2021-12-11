package com.servlet;

import com.model.Wmei;
import com.service.imp.BusinessServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CollectServlet", value = "/CollectServlet")
public class CollectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int flag = req.getParameter("flag").equals("0")?0:1;
        long meiId = Long.parseLong(req.getParameter("meiId"));
        long userId = Long.parseLong(req.getParameter("userId"));
        String[] urls = req.getParameter("url").split("/");
        String url = urls[urls.length-1];
        BusinessServiceImp bs = new BusinessServiceImp();
        bs.shoucang(meiId, userId, flag);
        List<Wmei> meis = bs.getAllCollectById(userId);
        ArrayList<Long> collects = new ArrayList<>();
        for(Wmei mei:meis){
            collects.add(mei.getMie().getId());
        }
        req.getSession().setAttribute("collects", collects);
        req.getRequestDispatcher("/" + url + "?meiid=" + meiId).forward(req, resp);
    }
}
