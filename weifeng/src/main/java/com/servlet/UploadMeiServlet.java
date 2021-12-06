package com.servlet;

import com.model.User;
import com.service.BusinessService;
import com.service.imp.BusinessServiceImp;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.*;
import java.util.List;

@WebServlet(name = "UploadMeiServlet", value = "/UploadMeiServlet")
public class UploadMeiServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user= (User) request.getSession().getAttribute("user");
        if(user.getId() == 0){
            response.sendRedirect("/wf/user_login.jsp");
        }
        BusinessService bs = new BusinessServiceImp();
        String filename = user.getName()+bs.getLastMeiId(user.getId());
        response.setContentType("text/html;charset=utf-8");
        DiskFileItemFactory factory = new DiskFileItemFactory();
        String target = "src/main/webapp/image";
        File f = new File(target);
        factory.setRepository(f);
        PrintWriter writer = response.getWriter();
        writer.println("已经执行");
        ServletFileUpload fileupload = new ServletFileUpload(factory);
        try {
            List<FileItem> fileItems = fileupload.parseRequest((RequestContext) request);
            if(fileItems == null)writer.println("为空");
            for(FileItem fileItem : fileItems){
                if(fileItem.isFormField()){
                    String name = fileItem.getFieldName();
                    if(name.equals("name")){
                        if(!fileItem.getString().equals("")){

                        }
                    }
                    writer.println("已执行");
                }else {
                    writer.println("上传的文件名为"+filename);
                    File file = new File(target+"/"+filename);
                    file.createNewFile();
                    InputStream in = fileItem.getInputStream();
                    FileOutputStream out = new FileOutputStream(file);
                    byte[] bytes = new byte[1024];
                    int len;
                    while ((len = in.read(bytes)) >0)
                        out.write(bytes, 0, len);
                    in.close();
                    out.close();
                    fileItem.delete();
                    writer.println("文件上传成功");

                }
            }
        }catch (Exception e){

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
