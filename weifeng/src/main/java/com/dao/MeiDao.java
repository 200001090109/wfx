package com.dao;

import com.model.Wmei;

import java.util.List;

public interface MeiDao {
    List<Wmei> getAllMei(long id);
    void addMei(Wmei wmei,long userId);
    long getLastMeiId(long userId);
    List<Wmei> getByType(long userId,String type);
    List<Wmei> getAllMei();
    List<Wmei> getJingxuan(long userId);

}
