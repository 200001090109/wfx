package com.service;

import com.model.User;
import com.model.Wmei;

import java.util.List;

public interface BusinessService {
    User loginCheck(String userName,String passWord);
    List<Wmei> getAllMei(long id);
    void addMei(Wmei wmei,long userId);
    long getLastMeiId(long userId);
    List<Wmei> getByType(long userId, String type);
    List<Wmei> getAllMei();
    List<Wmei> getJingxuan(long userId);
}