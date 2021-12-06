package com.dao.imp;



import com.dao.UserDao;
import com.model.User;
import com.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

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
}
