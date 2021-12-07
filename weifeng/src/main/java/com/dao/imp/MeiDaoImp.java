package com.dao.imp;

import com.dao.MeiDao;
import com.model.FilePath;
import com.model.Mei;
import com.model.User;
import com.model.Wmei;
import com.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.util.ArrayList;
import java.util.List;

public class MeiDaoImp implements MeiDao{
    @Override
    public List<Wmei> getAllMei(long id) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "select * from mei where user = ?";
            String sql2 = "select * from filePath where meiid = ?";
            List<Mei> meis = queryRunner.query(sql1,new BeanListHandler<>(Mei.class),id);
            List<Wmei> wmeis = new ArrayList<>();
            for(Mei mei : meis) {
                wmeis.add(new Wmei(mei,queryRunner.query(sql2,new BeanListHandler<>(FilePath.class),mei.getId())));
            }

            return wmeis;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }

    @Override
    public void addMei(Wmei wmei,long userId) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "insert into mei(characters, beizan, beishoucang, riqi," +
                    " fenlei, user, title) values(?,?,?,?,?,?,?)";
            String sql2 = "insert into filePath( meiid, filePath) values(?,?)";
            Mei mei = wmei.getMie();
            Object[] params1 = {mei.getCharacters(),mei.getBeizan(),mei.getBeishoucang(),mei.getRiqi(),
                    mei.getFenlei(),userId,mei.getTitle()};
            FilePath filePath = (FilePath) wmei.getFilePath().get(0);
            Object[] params2 = {mei.getId(),filePath.getFilePath()};
            queryRunner.update(sql1,params1);
            queryRunner.update(sql2,params2);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public long getLastMeiId(long userId) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "select max(id) from mei where user = ?";
            Number number = (Number) queryRunner.query(sql1,new ScalarHandler<>(),userId);
            return number.longValue();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Wmei> getByType(long userId, String type) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "select * from mei where user = ? and fenlei =? order by id limit 0,2";
            String sql2 = "select * from filePath where meiid = ?";
            List<Mei> meis = queryRunner.query(sql1,new BeanListHandler<>(Mei.class),new Object[]{userId,type});
            List<Wmei> wmeis = new ArrayList<>();
            for(Mei mei : meis) {
                wmeis.add(new Wmei(mei,queryRunner.query(sql2,new BeanListHandler<>(FilePath.class),mei.getId())));
            }
            return wmeis;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Wmei> getAllMei() {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "select * from mei";
            String sql2 = "select * from filePath where meiid = ?";
            String sql3 = "select * from weifengxiang where id = ?";
            List<Mei> meis = queryRunner.query(sql1,new BeanListHandler<>(Mei.class));
            List<Wmei> wmeis = new ArrayList<>();
            for(Mei mei : meis) {
                wmeis.add(new Wmei(mei,queryRunner.query(sql2,new BeanListHandler<>(FilePath.class),mei.getId()),
                        queryRunner.query(sql3,new BeanHandler<>(User.class),mei.getUser())));
            }
            return wmeis;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Wmei> getJingxuan(long userId) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "select * from mei where jingxuan = 1";
            String sql2 = "select * from filePath where meiid = ?";
            String sql3 = "select * from weifengxiang where id = ?";
            List<Mei> meis = queryRunner.query(sql1,new BeanListHandler<>(Mei.class));
            List<Wmei> wmeis = new ArrayList<>();
            for(Mei mei : meis) {
                wmeis.add(new Wmei(mei,queryRunner.query(sql2,new BeanListHandler<>(FilePath.class),mei.getId()),
                        queryRunner.query(sql3,new BeanHandler<>(User.class),mei.getUser())));
            }
            return wmeis;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /**
     * 根据美id和userId增加或减少赞,flags为1时增加,为0时候取消赞
     *
     * @param meiId
     * @param userId
     * @param flags
     */
    @Override
    public void zan(long meiId, long userId, int flags) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            if(flags ==1){
                String sql1 ="insert into zan(userid, meiid) values (?,?)";
                String sql2 = "update mei set beizan = beizan+1 where id=?";
                queryRunner.update(sql1, userId,meiId);
                queryRunner.update(sql2, meiId);
            }else {
                String sql1 ="delete from zan where userid = ? and meiid=?  ";
                String sql2 = "update mei set beizan = beizan-1 where id=?";
                queryRunner.update(sql1, userId,meiId);
                queryRunner.update(sql2, meiId);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /**
     * 根据美id和userId增加或减少收藏,flags为1时增加,为0时候取消收藏
     *
     * @param meiId
     * @param userId
     * @param flags
     */
    @Override
    public void shoucang(long meiId, long userId, int flags) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            if(flags ==1){
                String sql1 ="insert into shoucang(userid, meiid) values (?,?)";
                String sql2 = "update mei set beishoucang = beishoucang+1 where id=?";
                queryRunner.update(sql1, userId,meiId);
                queryRunner.update(sql2, meiId);
            }else {
                String sql1 ="delete from shoucang where userid = ? and meiid=?  ";
                String sql2 = "update mei set beishoucang = beishoucang-1 where id=?";
                queryRunner.update(sql1, userId,meiId);
                queryRunner.update(sql2, meiId);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        Class cls = MeiDaoImp.class;
        System.out.println(cls.getName());
    }

}
