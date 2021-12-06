package com.model;


import java.sql.Timestamp;

public class Mei {

  private long id;
  private String characters;
  private long beizan;
  private long beishoucang;
  private Timestamp riqi;
  private String title;
  private int jingxuan;

  public int getJingxuan() {
    return jingxuan;
  }

  public void setJingxuan(int jingxuan) {
    this.jingxuan = jingxuan;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public Mei(long id, String characters, long beizan, long beishoucang, Timestamp riqi, String title, String fenlei, long user) {
    this.id = id;
    this.characters = characters;
    this.beizan = beizan;
    this.beishoucang = beishoucang;
    this.riqi = riqi;
    this.title = title;
    this.fenlei = fenlei;
    this.user = user;
  }

  public Mei() {
  }

  private String fenlei;
  private long user;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getCharacters() {
    return characters;
  }

  public void setCharacters(String characters) {
    this.characters = characters;
  }


  public long getBeizan() {
    return beizan;
  }

  public void setBeizan(long beizan) {
    this.beizan = beizan;
  }


  public long getBeishoucang() {
    return beishoucang;
  }

  public void setBeishoucang(long beishoucang) {
    this.beishoucang = beishoucang;
  }


  public Timestamp getRiqi() {
    return riqi;
  }

  public void setRiqi(Timestamp riqi) {
    this.riqi = riqi;
  }


  public String getFenlei() {
    return fenlei;
  }

  public void setFenlei(String fenlei) {
    this.fenlei = fenlei;
  }


  public long getUser() {
    return user;
  }

  public void setUser(long user) {
    this.user = user;
  }

}
