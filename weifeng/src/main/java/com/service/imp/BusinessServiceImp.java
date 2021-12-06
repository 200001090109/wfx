package com.service.imp;

import com.dao.MeiDao;
import com.dao.UserDao;
import com.dao.imp.UserDaoImp;
import com.model.User;
import com.model.Wmei;
import com.service.BusinessService;
import com.utils.DaoFactory;

import java.util.List;

public class BusinessServiceImp implements BusinessService {
    private UserDao userService = DaoFactory.getInstance().createDao("com.dao.imp.UserDaoImp");
    private MeiDao meiService = DaoFactory.getInstance().createDao("com.dao.imp.MeiDaoImp");

    @Override
    public User loginCheck(String userName, String passWord) {
        return userService.loginCheck(userName, passWord);
    }

    @Override
    public List<Wmei> getAllMei(long id) {
        return meiService.getAllMei(id);
    }

    @Override
    public void addMei(Wmei wmei, long userId) {
        meiService.addMei(wmei, userId);
    }

    @Override
    public long getLastMeiId(long userId) {
        return meiService.getLastMeiId(userId)+1;
    }

    @Override
    public List<Wmei> getByType(long userId, String type) {
        return meiService.getByType(userId, type);
    }

    @Override
    public List<Wmei> getAllMei() {
        return meiService.getAllMei();
    }

    @Override
    public List<Wmei> getJingxuan(long userId) {
        return meiService.getJingxuan(userId);
    }

    public static void main(String[] args) {
        BusinessService bs = new BusinessServiceImp();
        System.out.println(bs.getAllMei(1));
    }
}
