package com.dao.imp;

import com.dao.MeiDao;
import com.model.*;
import com.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class MeiDaoImp implements MeiDao{
    @Override
    public List<Wmei> getAllMei(long id) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "select * from mei where user = ? order by id desc ";
            String sql2 = "select * from filePath where meiid = ?";
            String sql3 = "select * from weifengxiang where id=?";
            User user = queryRunner.query(sql3,new BeanHandler<>(User.class),id);
            List<Mei> meis = queryRunner.query(sql1,new BeanListHandler<>(Mei.class),id);
            List<Wmei> wmeis = new ArrayList<>();
            for(Mei mei : meis) {
                List<FilePath> filePaths= queryRunner.query(sql2,new BeanListHandler<>(FilePath.class),mei.getId());
                if(filePaths.isEmpty()){
                    filePaths.add(new FilePath(0,0,"images/user1meiyan1.png"));
                }
                Wmei wmei =  new Wmei(mei,filePaths);
                wmei.setOwner(user);
                wmeis.add(wmei);
            }

            return wmeis;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }

    @Override
    public void addMei(Wmei wmei,long userId,String filePath) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "insert into mei(characters, fenlei, riqi,user, title) values(?,?,?,?,?)";
            String sql2 = "insert into filePath( meiid, filePath) values(?,?)";
            Mei mei = wmei.getMie();
            Timestamp riqi = new Timestamp(Calendar.getInstance().getTimeInMillis());
            Object[] params1 = {mei.getCharacters(), mei.getFenlei(),riqi,userId,mei.getTitle()};
            queryRunner.update(sql1,params1);
            String sql3 = "select max(id )from mei ";
            Number id = (Number) queryRunner.query(sql3,new ScalarHandler<>());
            Object[] params2 = {(id).longValue(),filePath};
            queryRunner.update(sql2,params2);
            System.out.printf(id+" ");
            System.out.printf(filePath);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public long getLastMeiId() {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "select max(id) from mei ";
            Number number = (Number) queryRunner.query(sql1,new ScalarHandler<>());
            return number.longValue();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    @Override
    public List<Wmei> getAllByType(long userId, String type) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "select * from mei where user = ? and fenlei =? order by id desc ";
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
            String sql1 = "select * from mei order by id desc ";
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

    @Override
    public List<Wmei> getAllMeiOrderByZan() {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "select * from mei order by beizan desc ";
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
    public List<Wmei> getAllMeiOrderByShoucang() {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "select * from mei order by beishoucang desc ";
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
    public Wmei getMeiById(long meiid) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "select * from mei where id = ? order by id desc";
            String sql2 = "select * from filePath where meiid = ?";
            String sql3 = "select * from weifengxiang where id=?";
            Mei mei = queryRunner.query(sql1,new BeanHandler<>(Mei.class),meiid);
            Wmei wmei = new Wmei(mei,queryRunner.query(sql2,new BeanListHandler<>(FilePath.class),mei.getId()));
            User user = queryRunner.query(sql3,new BeanHandler<>(User.class),mei.getUser());
            wmei.setOwner(user);
            return wmei;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Wmei> getAllMeiByUseridAndTypeAndOrder(long userId, int type, int zas) {
        String zanOrShou = " ";
        String leibie = " ";
        if(type == 1)leibie = "美拍";
        else if(type==2)leibie = "美言";
        else leibie = "美视";
        if(zas == 1)zanOrShou = "beishoucang";
        else zanOrShou = "beizan";
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = String.format("select * from mei where user = ? and fenlei = '%s' order by %s desc ", leibie, zanOrShou);
            String sql2 = "select * from filePath where meiid = ?";
            String sql3 = "select * from weifengxiang where id = ?";
            List<Mei> meis = queryRunner.query(sql1,new BeanListHandler<>(Mei.class),userId);
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
    public void del(long meiid) {
        try {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "delete from filePath where meiid=?";
            String sql2 = "delete from zan where meiid = ?";
            String sql3 = "delete from shoucang where meiid = ?";
            String sql4 = "delete from mei where id=?";
            queryRunner.update(sql1,meiid);
            queryRunner.update(sql2,meiid);
            queryRunner.update(sql3,meiid);
            queryRunner.update(sql4,meiid);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Wmei> getShouchangBytype(long userid, int type) {
        List<Wmei> wmeis = new ArrayList<>();
        try {
            String sql2;
            if(type ==0) sql2 = "select * from mei where id = ?";
            else if(type == 1)sql2 ="select * from mei where id = ? and fenlei = '美拍' ";
            else if(type == 2)sql2 ="select * from mei where id = ? and fenlei = '美言' ";
            else sql2 ="select * from mei where id = ? and fenlei = '美视' ";
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql1 = "select meiid from shoucang where userid = ?";
            String sql3 = "select * from weifengxiang where id = ?";
            String sql4 = "select * from filePath where meiid = ?;";
            List<Shoucang> s =  queryRunner.query(sql1,new BeanListHandler<>(Shoucang.class),userid);
            for(Shoucang sc:s){
                Mei mei = queryRunner.query(sql2,new BeanHandler<>(Mei.class),sc.getMeiid());
                if(mei == null) continue;
                User user = queryRunner.query(sql3,new BeanHandler<>(User.class),mei.getUser());
                List<FilePath> filePaths = queryRunner.query(sql4,new BeanListHandler<>(FilePath.class),mei.getId());
                wmeis.add(new Wmei(mei,filePaths,user));
            }
            return wmeis;

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        MeiDao md = new MeiDaoImp();
        md.getShouchangBytype(1,1);
    }
}
