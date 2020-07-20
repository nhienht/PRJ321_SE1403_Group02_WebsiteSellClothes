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
public class Supplier {
    private int supID;
    private String supName;
    private String phone;
    private String address;
    private String email;

    public Supplier() {
    }

    public Supplier(int supID, String supName, String phone, String address, String email) {
        this.supID = supID;
        this.supName = supName;
        this.phone = phone;
        this.address = address;
        this.email = email;
    }

    
    public int getSupID() {
        return supID;
    }

    public void setSupID(int supID) {
        this.supID = supID;
    }

    public String getSupName() {
        return supName;
    }

    public void setSupName(String supName) {
        this.supName = supName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
