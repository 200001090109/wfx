package com.model;

public class User {
    private long id;
    private String name;
    private String pwd;
    private String filePath;
    private String nickname;
    private String sex;
    private String tel;
    private String email;
    private String qianming;
    private double yue;
    private double tixian;

    public User(long id, String name, String pwd, String filePath, String nickname, String sex, String tel,
                String email, String qianming, double yue, double tixian) {
        this.id = id;
        this.name = name;
        this.pwd = pwd;
        this.filePath = filePath;
        this.nickname = nickname;
        this.sex = sex;
        this.tel = tel;
        this.email = email;
        this.qianming = qianming;
        this.yue = yue;
        this.tixian = tixian;
    }

    public double getYue() {
        return yue;
    }

    public void setYue(double yue) {
        this.yue = yue;
    }

    public double getTixian() {
        return tixian;
    }

    public void setTixian(double tixian) {
        this.tixian = tixian;
    }

    public User() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQianming() {
        return qianming;
    }

    public void setQianming(String qianming) {
        this.qianming = qianming;
    }

    public User(int id, String name, String pwd, String filePath, String nickname, String sex, String tel, String email, String qianming) {
        this.id = id;
        this.name = name;
        this.pwd = pwd;
        this.filePath = filePath;
        this.nickname = nickname;
        this.sex = sex;
        this.tel = tel;
        this.email = email;
        this.qianming = qianming;
    }
}
