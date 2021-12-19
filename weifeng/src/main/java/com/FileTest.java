package com;

import java.io.File;

public class FileTest {
    public static void main(String[] args) {
        String pathname = "src/main/webapp/images/1_code.jpg";
        File file = new File(pathname);
        System.out.println(file.exists());
    }
}
