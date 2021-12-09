package com.utils;

import com.model.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

public class Upload {

    public static String upload(HttpServletRequest request, HttpServletResponse response) {
        String filepath = "";
        try {
            // 设置Content-Type字段
            response.setContentType("text/html;chatset=utf-8");
            // 创建DiskFileItemFactory对象
            DiskFileItemFactory factory = new DiskFileItemFactory();

            //
            File f = new File("/tempFolder");
            // 设置文件缓存路径
            factory.setRepository(f);
            // 创建ServletFileUpload对象
            ServletFileUpload fileUpload = new ServletFileUpload(factory);
            fileUpload.setHeaderEncoding("utf-8");
            // 解析request对象，获取fileItem对象
            List<FileItem> fileItems = fileUpload.parseRequest(request);
            // 获取字符流
            PrintWriter writer = response.getWriter();
            // 遍历集合
            for (FileItem fileItem : fileItems) {
                // 判断是否为普通字段
                if (fileItem.isFormField()) {
                    String name = fileItem.getFieldName();
                    if (name.equals("name")) {
                        // 如果文件不为空，保存到value中
                        if (!fileItem.getString().equals("")) {
                            String value = fileItem.getString("utf-8");
                        }
                    }
                }else {
                    // 获取上传的文件名
                    String filename = fileItem.getName();
                    // 处理上传的文件
                    if (fileItem!=null && !fileItem.equals("")) {
                        filename = filename.substring(filename.lastIndexOf("\\") + 1);
                        // 文件名需要唯一
                        User user = (User) request.getSession().getAttribute("user");
                        String name = user.getName();
                        // 文件名为：名称+文件名
                        filename = name + '_'+filename;
                        // 在服务创建同名文件
                        String webPath = "/images/";
                        filepath = "E:\\git\\wfx\\wfx\\weifeng\\src\\main\\webapp\\images\\" + filename;
                        // 创建文件
                        File file = new File(filepath);
                        file.getParentFile().mkdirs();
                        file.createNewFile();
                        // 获取文件上传流
                        InputStream in = fileItem.getInputStream();
                        // 打开服务器端上传文件
                        FileOutputStream out = new FileOutputStream(file);
                        byte[] buffer = new byte[1024];
                        int len;
                        while ((len = in.read(buffer)) != -1) {
                            out.write(buffer, 0 ,len);
                        }
                        in.close();
                        out.close();
                        // 删除临时文件
                        fileItem.delete();
                    }
                }
            }
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
        return filepath;
    }
}
