package com.model;

import java.util.List;

public class Wmei {
    private Mei mie;
    private List<FilePath> filePath;
    private String firstPath;

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    private User owner;


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
