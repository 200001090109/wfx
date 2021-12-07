package com.dao;

import com.model.User;
import com.model.Wmei;

import java.util.List;

public interface UserDao {
    User loginCheck(String userName,String passWord);
    /**
     *
     * @param userId 提现的用户id
     * @param jine  提现金额
     */
    int tixian(long userId,double jine);
    void addCodeImage(long userId);
    void userAlter(User user);
    User getUserById(long userId);

    /**
     * 根据id查询用户点赞的
     * @param userId
     * @return
     */
    List<Wmei> getAllZanById(long userId);

    /**
     * 根据id查询用户收藏的
     * @param userId
     * @return
     */
    List<Wmei> getAllCollectById(long userId);


}
