package com.dao.imp;



import com.dao.UserDao;
import com.model.User;
import com.utils.CodeImageUtil;
import com.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.io.File;

public class UserDaoImp implements UserDao {
    @Override
    public User loginCheck(String userName,String passWord) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            Object[] params = {userName,passWord};
            String sql = "select * from weifengxiang where name = ? and pwd = ?";
            return queryRunner.query(sql,new BeanHandler<>(User.class),params);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /**
     * @param userId 提现的用户id
     * @param jine   提现金额
     */
    @Override
    public int tixian(long userId, double jine) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "select yue from weifengxiang where id = ?";
            Number yue = (Number) queryRunner.query(sql1,new ScalarHandler<>(),userId);
            if(jine>yue.doubleValue())return -1;
            String sql2 = "update weifengxiang set yue =yue-?,tixian = tixian+? where id = ?";
            queryRunner.update(sql2,new Object[]{jine,jine,userId});
            return (int) (yue.doubleValue()-jine);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public void addCodeImage(String text,long userId) {
        String filePath = "src/main/webapp/images/";
        try {
            String databasePath = "images/" + CodeImageUtil.getCode(text,filePath,userId);
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "update weifengxiang set code = ?";
            queryRunner.update(sql1,databasePath);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

}
