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
    /**
     * 根据美id和userId增加或减少赞,flags为1时增加,为0时候取消赞
     * @param meiid
     * @param flags
     */
    void zan(long meiid,long userId,int flags);
    /**
     * 根据美id和userId增加或减少收藏,flags为1时增加,为0时候取消收藏
     * @param meiid
     * @param flags
     */
    void shoucang(long meiid,long userId,int flags);
    List<Wmei> getAllMeiOrderByZan();
    List<Wmei> getAllMeiOrderByShoucang();
    Wmei getMeiById(long meiid);
    List<Wmei> getAllMeiByUseridAndTypeAndOrder(long userId,int type,int zas);
    void  del(long meiid);
}
