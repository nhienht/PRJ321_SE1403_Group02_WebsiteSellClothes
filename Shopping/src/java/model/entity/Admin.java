/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entity;

import java.sql.Date;

/**
 *
 * @author Dat
 */
public class Admin {

    private int aID;
    private int rID;
    private String aPassword;
    private String aUsername;
    private String aName;
    private String aPhonenumber;
    private String aAddress;
    private Date aBirthday;
    private String aEmail;
    private int status;

    public Admin() {

    }

    public Admin(int aID, int rID, String aPassword, String aUsername, String aName, String aPhonenumber, String aAddress, Date aBirthday, String aEmail, int status) {
        this.aID = aID;
        this.rID = rID;
        this.aPassword = aPassword;
        this.aUsername = aUsername;
        this.aName = aName;
        this.aPhonenumber = aPhonenumber;
        this.aAddress = aAddress;
        this.aBirthday = aBirthday;
        this.aEmail = aEmail;
        this.status = status;
    }

    public int getaID() {
        return aID;
    }

    public void setaID(int aID) {
        this.aID = aID;
    }

    public int getrID() {
        return rID;
    }

    public void setrID(int rID) {
        this.rID = rID;
    }

    public String getaPassword() {
        return aPassword;
    }

    public void setaPassword(String aPassword) {
        this.aPassword = aPassword;
    }

    public String getaUsername() {
        return aUsername;
    }

    public void setaUsername(String aUsername) {
        this.aUsername = aUsername;
    }

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName;
    }

    public String getaPhonenumber() {
        return aPhonenumber;
    }

    public void setaPhonenumber(String aPhonenumber) {
        this.aPhonenumber = aPhonenumber;
    }

    public String getaAddress() {
        return aAddress;
    }

    public void setaAddress(String aAddress) {
        this.aAddress = aAddress;
    }

    public Date getaBirthday() {
        return aBirthday;
    }

    public void setaBirthday(Date aBirthday) {
        this.aBirthday = aBirthday;
    }

    public String getaEmail() {
        return aEmail;
    }

    public void setaEmail(String aEmail) {
        this.aEmail = aEmail;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
