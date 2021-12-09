package com.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import com.service.imp.BusinessServiceImp;
import com.utils.Upload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.*;
import java.util.List;
import java.util.UUID;

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
