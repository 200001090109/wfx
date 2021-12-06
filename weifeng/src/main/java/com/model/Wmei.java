package com.model;

import java.util.List;

/**
 * 一个完整的美拍/言/视
 * firstPath为一个美的首个文件路径,用作封面
 */
public class Wmei {
    private Mei mie;
    private List<FilePath> filePath;
    private String firstPath;
    private User owner;
    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public String getFirstPath() {
        return firstPath;
    }

    public void setFirstPath(String firstPath) {
        this.firstPath = firstPath;
    }

    public Wmei() {
    }

    public Wmei(Mei mie, List filePath) {
        this.mie = mie;
        this.filePath = filePath;
        this.firstPath = ((FilePath)filePath.get(0)).getFilePath();
    }

    public Mei getMie() {
        return mie;
    }

    public void setMie(Mei mie) {
        this.mie = mie;
    }

    public Wmei(Mei mie,List filePath, User owner) {
        this.mie = mie;
        this.filePath = filePath;
        this.firstPath = ((FilePath)filePath.get(0)).getFilePath();
        this.owner = owner;
    }

    public List<FilePath> getFilePath() {
        return filePath;
    }

    public void setFilePath(List<FilePath> filePath) {
        this.filePath = filePath;
    }
}
