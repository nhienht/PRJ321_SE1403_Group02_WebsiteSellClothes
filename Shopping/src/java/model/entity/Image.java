/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entity;

/**
 *
 * @author NhienHT
 */
public class Image {
    private int imgID;
    private int pID;
    private String imageName;

    public Image() {
    }

    public Image(int imgID, int pID, String imageName) {
        this.imgID = imgID;
        this.pID = pID;
        this.imageName = imageName;
    }

    public int getImgID() {
        return imgID;
    }

    public void setImgID(int imgID) {
        this.imgID = imgID;
    }

    public int getpID() {
        return pID;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }
    
}
