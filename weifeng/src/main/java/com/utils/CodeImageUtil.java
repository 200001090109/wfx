package com.utils;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * 二维码接口
 */
public class CodeImageUtil {
    /**
     * 发送二维码请求
     * @param outFile 输出路径
     * @return 二维码文件名
     */
    public static String getCode(String outFile, long userId, String text) throws Exception{
        URL url = new URL("https://api.pwmqr.com/qrcode/create/?url=" + text);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setConnectTimeout(5 * 1000);
        InputStream in = conn.getInputStream();
        byte[] data = readInputStream(in);
        File imageFile = new File(outFile + userId + "_code.jpg");
        FileOutputStream outputStream = new FileOutputStream(imageFile);
        outputStream.write(data);
        outputStream.close();
        return  userId +"_code.jpg";
    }

    /**
     * 读取输入二进制流
     * @param in 输入二进制流
     * @return 二进制数列
     */
    private static byte[] readInputStream(InputStream in) throws Exception{
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int len = 0;
        while((len=in.read(buffer)) != -1){
            out.write(buffer, 0, len);
        }
        in.close();
        return out.toByteArray();
    }
}
