package com.model;


public class Shoucang {

  private long id;
  private long userid;
  private long meiid;

  public Shoucang() {
  }

  public Shoucang(long id, long userid, long meiid) {
    this.id = id;
    this.userid = userid;
    this.meiid = meiid;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getUserid() {
    return userid;
  }

  public void setUserid(long userid) {
    this.userid = userid;
  }


  public long getMeiid() {
    return meiid;
  }

  public void setMeiid(long meiid) {
    this.meiid = meiid;
  }

}
