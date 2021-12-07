package com;

import com.utils.CodeImageUtil;

public class Test {
    public static void main(String[] args) {
        try{
            CodeImageUtil.getCode("123", "E:\\Projects\\wfx\\weifeng\\src\\main\\webapp\\images\\");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
