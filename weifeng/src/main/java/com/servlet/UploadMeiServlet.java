package com.servlet;

import com.service.imp.BusinessServiceImp;
import com.utils.Upload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UploadMeiServlet", value = "/UploadMeiServlet")
public class UploadMeiServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = Upload.upload(request, response);
        String[] webapps = filePath.split("\\\\");
        filePath = webapps[webapps.length-2] + "/" + webapps[webapps.length-1];
        BusinessServiceImp bs = new BusinessServiceImp();

    }
}
