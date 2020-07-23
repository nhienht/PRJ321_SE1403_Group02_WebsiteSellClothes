/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entity;

import java.sql.Date;

/**
 *
 * @author NhienHT
 */
public class Comment {
    private int cmtID;
    private int pID;
    private int cID;
    private String cmtMessage;
    private Date datetime;
    private int status;

    public Comment(int cmtID, int pID, int cID, String cmtMessage, Date datetime, int status) {
        this.cmtID = cmtID;
        this.pID = pID;
        this.cID = cID;
        this.cmtMessage = cmtMessage;
        this.datetime = datetime;
        this.status = status;
    }

    public Comment() {
    }

    public int getCmtID() {
        return cmtID;
    }

    public void setCmtID(int cmtID) {
        this.cmtID = cmtID;
    }

    public int getpID() {
        return pID;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public int getcID() {
        return cID;
    }

    public void setcID(int cID) {
        this.cID = cID;
    }

    public String getCmtMessage() {
        return cmtMessage;
    }

    public void setCmtMessage(String cmtMessage) {
        this.cmtMessage = cmtMessage;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
