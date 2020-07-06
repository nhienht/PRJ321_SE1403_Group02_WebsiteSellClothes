/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entity;

import java.util.Date;

/**
 *
 * @author NhienHT
 */
public class Products {

    private int pID;
    private int spID;
    private int brID;
    private int tID;
    private int supID;
    private String pName;
    private double sellingPrice;
    private double price;
    private String describle;
    private Date pDate;
    private int size;
    private String material;

    public Products() {
    }

    public Products(int pID, int spID, int brID, int tID, int supID, String pName, double sellingPrice, double price, String describle, Date pDate, int size, String material) {
        this.pID = pID;
        this.spID = spID;
        this.brID = brID;
        this.tID = tID;
        this.supID = supID;
        this.pName = pName;
        this.sellingPrice = sellingPrice;
        this.price = price;
        this.describle = describle;
        this.pDate = pDate;
        this.size = size;
        this.material = material;
    }

    public int getpID() {
        return pID;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public int getSpID() {
        return spID;
    }

    public void setSpID(int spID) {
        this.spID = spID;
    }

    public int getBrID() {
        return brID;
    }

    public void setBrID(int brID) {
        this.brID = brID;
    }

    public int gettID() {
        return tID;
    }

    public void settID(int tID) {
        this.tID = tID;
    }

    public int getSupID() {
        return supID;
    }

    public void setSupID(int supID) {
        this.supID = supID;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescrible() {
        return describle;
    }

    public void setDescrible(String describle) {
        this.describle = describle;
    }

    public Date getpDate() {
        return pDate;
    }

    public void setpDate(Date pDate) {
        this.pDate = pDate;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

}
