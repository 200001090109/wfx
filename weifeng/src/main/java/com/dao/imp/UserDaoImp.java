package com.dao.imp;



import com.dao.UserDao;
import com.model.*;
import com.utils.CodeImageUtil;
import com.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.util.ArrayList;
import java.util.List;

public class UserDaoImp implements UserDao {
    @Override
    public User loginCheck(String userName, String passWord) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            Object[] params = {userName, passWord};
            String sql = "select * from weifengxiang where name = ? and pwd = ?";
            return queryRunner.query(sql, new BeanHandler<>(User.class), params);
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
            Number yue = (Number) queryRunner.query(sql1, new ScalarHandler<>(), userId);
            if (jine > yue.doubleValue()) return -1;
            String sql2 = "update weifengxiang set yue =yue-?,tixian = tixian+? where id = ?";
            queryRunner.update(sql2, new Object[]{jine, jine, userId});
            return (int) (yue.doubleValue() - jine);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public void addCodeImage(long userId) {
        String filePath = "src/main/webapp/images/";
        try {
            String databasePath = "images/" + userId + "_code.jpg";
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "update weifengxiang set code = ? where id=?";
            queryRunner.update(sql1, new Object[]{databasePath, userId});
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public void userAlter(User user) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "update weifengxiang set nickname = ?,sex = ?,tel = ?,email = ?,qianming=?,filePath=? where id=?";
            Object[] params = {user.getNickname(), user.getSex(), user.getTel(), user.getEmail(), user.getQianming(),user.getFilePath(), user.getId()};
            queryRunner.update(sql1, params);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public User getUserById(long userId) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from weifengxiang where id= ?";
            return queryRunner.query(sql, new BeanHandler<>(User.class), userId);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /**
     * 根据id查询用户点赞的
     *
     * @param userId
     * @return
     */
    @Override
    public List<Wmei> getAllZanById(long userId) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from zan where userid = ?";
            List<Zan> zans = queryRunner.query(sql, new BeanListHandler<>(Zan.class), userId);
            List<Wmei> wmeis = new ArrayList<>();
            for (Zan zan : zans) {
                sql = "select * from mei where id= ?";
                Mei mei = queryRunner.query(sql, new BeanHandler<>(Mei.class), zan.getMeiid());
                sql = "select * from filePath where meiid = ?";
                List<FilePath> filePath = queryRunner.query(sql, new BeanListHandler<>(FilePath.class), zan.getMeiid());
                wmeis.add(new Wmei(mei, filePath));
            }
            return wmeis;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /**
     * 根据id查询用户收藏的
     *
     * @param userId
     * @return
     */
    @Override
    public List<Wmei> getAllCollectById(long userId) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from shoucang where userid = ?";
            List<Zan> zans = queryRunner.query(sql, new BeanListHandler<>(Zan.class), userId);
            List<Wmei> wmeis = new ArrayList<>();
            for (Zan zan : zans) {
                sql = "select * from mei where id= ?";
                Mei mei = queryRunner.query(sql, new BeanHandler<>(Mei.class), zan.getMeiid());
                sql = "select * from filePath where meiid = ?";
                List<FilePath> filePath = queryRunner.query(sql, new BeanListHandler<>(FilePath.class), zan.getMeiid());
                wmeis.add(new Wmei(mei, filePath));
            }
            return wmeis;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /**
     * 添加用户
     *
     * @param user
     */
    @Override
    public void addUser(User user) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "insert into weifengxiang( pwd, name, filePath, nickname, sex, tel, email, qianming) " +
                    "values( ?,?,?,?,?,?,?,?)";
            queryRunner.update(sql, user.getPwd(), user.getName(), user.getFilePath(), user.getNickname(), user.getSex(),
                    user.getTel(), user.getEmail(), user.getQianming());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean alterPwd(String name, String tel, String email, String newPwd) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from weifengxiang where name=? and tel=? and email=?";
            if(queryRunner.query(sql,new BeanHandler<>(User.class),name,tel,email)==null)return false;
            sql = "update weifengxiang set pwd = ? where name= ?";
            queryRunner.update(sql,newPwd,name);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public void addFriend(long myid, long frieddid) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "select friend from friend where userid = ?";
            String s = (String) queryRunner.query(sql1,new ScalarHandler<>(),myid);
            String sql2 = "update friend set friend = ? where userid = ?";
            queryRunner.update(sql2,s+frieddid+";",myid);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<User> getFriends(long userid) {
        List<User> users = new ArrayList<>();
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "select friend from friend where userid = ?";
            String s = (String) queryRunner.query(sql1,new ScalarHandler<>(),userid);
            String[] friends = s.split(";");
            String sql2 = "select * from weifengxiang where id = ?";
            for (String f:friends){
               User user =  queryRunner.query(sql2,new BeanHandler<>(User.class),Long.parseLong(f));
               if(user!=null)users.add(user);
            }

            return users;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }

    public static void main(String[] args) {
        UserDao ud = new UserDaoImp();
        for (User u:ud.getFriends(1)){
            System.out.println(u.getId()+u.getFilePath());
        }
    }
}

