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

    /**
     * 根据用户名和密码判断用户
     * @param userName
     * @param passWord
     * @return 存在则返回用户,否则为空
     */
    @Override
    public User loginCheck(String userName, String passWord) {
        return userService.loginCheck(userName, passWord);
    }

    /**
     * 查询到该用户的所有美
     * @param id
     * @return
     * 返回一个有所有美的List
     */
    @Override
    public List<Wmei> getAllMei(long id) {
        return meiService.getAllMei(id);
    }

    /**
     * 添加美
     * @param wmei
     * @param userId
     */
    @Override
    public void addMei(Wmei wmei, long userId) {
        meiService.addMei(wmei, userId);
    }

    /**
     * 多余的
     * @param userId
     * @return
     */
    @Override
    public long getLastMeiId(long userId) {
        return meiService.getLastMeiId(userId)+1;
    }

    /**
     *
     * @param userId
     * @param type
     * @return
     * 根据美拍/言/视查询美,用于主页推荐,只会返回两个美
     */
    @Override
    public List<Wmei> getByType(long userId, String type) {
        return meiService.getByType(userId, type);
    }

    /**
     * 返回所有用户的美
     * @return
     */
    @Override
    public List<Wmei> getAllMei() {
        return meiService.getAllMei();
    }

    /**
     *
     * @param userId
     * @return
     * 获取所有的精选美,参数未使用,可随意传参数
     */
    @Override
    public List<Wmei> getJingxuan(long userId) {
        return meiService.getJingxuan(userId);
    }

    /**
     *
     * @param userId 提现的用户id
     * @param jine  提现金额
     * @return 返回-1余额不足,成功返回剩余金额
     */
    @Override
    public int tixian(long userId, double jine) {
        return userService.tixian(userId, jine);
    }

    public static void main(String[] args) {
        BusinessService bs = new BusinessServiceImp();
        System.out.println(bs.tixian(1,2000));
    }
}
