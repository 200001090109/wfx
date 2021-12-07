package com.dao;

import com.model.User;

public interface UserDao {
    User loginCheck(String userName,String passWord);
    /**
     *
     * @param userId 提现的用户id
     * @param jine  提现金额
     */
    int tixian(long userId,double jine);
    void addCodeImage(String text,long userId);
    void userAlter(User user);
    User getUserById(long userId);
}
