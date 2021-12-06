package com.model;


public class FilePath {

  private long id;
  private long meiid;
  private String filePath;

  public FilePath(long id, long meiid, String filePath) {
    this.id = id;
    this.meiid = meiid;
    this.filePath = filePath;
  }

  public FilePath() {
  }


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getMeiid() {
    return meiid;
  }

  public void setMeiid(long meiid) {
    this.meiid = meiid;
  }


  public String getFilePath() {
    return filePath;
  }

  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }

}
