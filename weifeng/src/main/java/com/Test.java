package com;

import com.utils.CodeImageUtil;

public class Test {
    public static void main(String[] args) {
        try{
            CodeImageUtil.getCode("E:\\Projects\\wfx\\weifeng\\src\\main\\webapp\\images\\",1);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
