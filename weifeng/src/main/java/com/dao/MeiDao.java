package com.dao;

import com.model.Wmei;

import java.util.List;

public interface MeiDao {
    List<Wmei> getAllMei(long id);
    void addMei(Wmei wmei,long userId,String filePath);
    long getLastMeiId();
    List<Wmei> getByType(long userId,String type);
    List<Wmei> getAllMei();
    List<Wmei> getJingxuan(long userId);
    List<Wmei> getAllByType(long userId, String type);
    void zan(long meiid,long userId,int flags);
    void shoucang(long meiid,long userId,int flags);
    List<Wmei> getAllMeiOrderByZan();
    List<Wmei> getAllMeiOrderByShoucang();
    Wmei getMeiById(long meiid);
    List<Wmei> getAllMeiByUseridAndTypeAndOrder(long userId,int type,int zas);
    void  del(long meiid);
    List<Wmei> getShouchangBytype(long userid,int type);
}
