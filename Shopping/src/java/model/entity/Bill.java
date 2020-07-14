/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entity;

import java.sql.Date;

/**
 *
 * @author
 */
public class Bill {
    private int bID;
    private int cID;
    private String bStatus;
    private String customerName;
    private Date date;
    private String address;
    private String phone;
    private String note;
    private double total;

    public Bill() {
    }

    
    public Bill(int bID, int cID, String bStatus, String customerName, Date date, String address, String phone, String note, double total) {
        this.bID = bID;
        this.cID = cID;
        this.bStatus = bStatus;
        this.customerName = customerName;
        this.date = date;
        this.address = address;
        this.phone = phone;
        this.note = note;
        this.total = total;
    }

    public int getbID() {
        return bID;
    }

    public void setbID(int bID) {
        this.bID = bID;
    }

    public int getcID() {
        return cID;
    }

    public void setcID(int cID) {
        this.cID = cID;
    }

    public String getbStatus() {
        return bStatus;
    }

    public void setbStatus(String bStatus) {
        this.bStatus = bStatus;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
}
