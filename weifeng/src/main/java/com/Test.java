package com;

import com.model.Wmei;
import com.service.imp.BusinessServiceImp;

import java.util.ArrayList;
import java.util.List;

public class Test {
    public static void main(String[] args) {
        BusinessServiceImp bs = new BusinessServiceImp();
        List<Wmei> meis = bs.getAllZanById(1);
        ArrayList<Long> zans = new ArrayList();
        for(Wmei mei:meis){
            zans.add(mei.getMie().getId());
        }
        System.out.println(zans.contains(Long.parseLong("3")));
    }
}
