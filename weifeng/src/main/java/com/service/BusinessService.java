package com.service;

import com.model.User;
import com.model.Wmei;

import java.util.List;

public interface BusinessService {
    User loginCheck(String userName,String passWord);
    List<Wmei> getAllMei(long id);
    void addMei(Wmei wmei,long userId,String filePath);
    long getLastMeiId(long userId);
    List<Wmei> getByType(long userId, String type);
    List<Wmei> getAllMei();
    List<Wmei> getJingxuan(long userId);

    /**
     *
     * @param userId 提现的用户id
     * @param jine  提现金额
     */
    int tixian(long userId,double jine);
    void addCodeImage(String text,long userId);
    void userAlter(User user);
    User getYserById(long userId);
    void shoucang(long meiId, long userId, int flags);
    void zan(long meiId, long userId, int flags);
    List<Wmei> getAllZanById(long userId);
    List<Wmei> getAllCollectById(long userId);
    void addUser(User user);

    /**
     * 点赞排序获取所有美
     * @return
     */
    List<Wmei> getAllMeiOrderByZan();

    /**
     * 收藏排序获取所有美
     * @return
     */
    List<Wmei> getAllMeiOrderByShoucang();
    Wmei getMeiById(long meiid);
    boolean alterPwd(long userId, String tel, String email, String newPwd);
}
