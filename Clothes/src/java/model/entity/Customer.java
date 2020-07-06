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
public class Customer {
    private int cID;
    private String cUsername;
    private String cPassword;
    private String cName;
    private String phonenumber;
    private String address;
    private Date birthday;
    private String email;
    private int status;
    private int gender;

    public Customer() {
    }

    public Customer(int cID, String cUsername, String cPassword, String cName, String phonenumber, String address, Date birthday, String email, int status, int gender) {
        this.cID = cID;
        this.cUsername = cUsername;
        this.cPassword = cPassword;
        this.cName = cName;
        this.phonenumber = phonenumber;
        this.address = address;
        this.birthday = birthday;
        this.email = email;
        this.status = status;
        this.gender = gender;
    }

    public int getcID() {
        return cID;
    }

    public void setcID(int cID) {
        this.cID = cID;
    }

    public String getcUsername() {
        return cUsername;
    }

    public void setcUsername(String cUsername) {
        this.cUsername = cUsername;
    }

    public String getcPassword() {
        return cPassword;
    }

    public void setcPassword(String cPassword) {
        this.cPassword = cPassword;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }
    
}
