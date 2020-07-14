/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entity;

/**
 *
 * @author
 */
public class BillDetail {
    private int bID;
    private int pID;
    private double price;
    private int quantity;

    public BillDetail() {
    }

    
    public BillDetail(int bID, int pID, double price, int quantity) {
        
        this.bID = bID;
        this.pID = pID;
        this.price = price;
        this.quantity = quantity;
    }

    
    public int getbID() {
        return bID;
    }

    public void setbID(int bID) {
        this.bID = bID;
    }

    public int getpID() {
        return pID;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
