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
    private int status;
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
    private int quantity;
    private float discount;
    private String gender;

    public Products() {
    }

    public Products(int pID, int status, int brID, int tID, int supID, String pName, double sellingPrice, double price, String describle, Date pDate, int size, String material, int quantity, float discount, String gender) {
        this.pID = pID;
        this.status = status;
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
        this.quantity = quantity;
        this.discount = discount;
        this.gender = gender;
    }

    
    public int getpID() {
        return pID;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public int getSpID() {
        return status;
    }

    public void setSpID(int status) {
        this.status = status;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    
    

}
