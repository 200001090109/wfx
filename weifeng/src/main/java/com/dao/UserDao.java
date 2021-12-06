package com.dao;

import com.model.User;

public interface UserDao {
    User loginCheck(String userName,String passWord);
}
