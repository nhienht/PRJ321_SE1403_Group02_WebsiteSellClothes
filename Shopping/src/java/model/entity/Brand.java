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
public class Brand {
    private int brID;
    private int brName;

    public Brand(int brID, int brName) {
        this.brID = brID;
        this.brName = brName;
    }

    public Brand() {
    }

    public int getBrID() {
        return brID;
    }

    public void setBrID(int brID) {
        this.brID = brID;
    }

    public int getBrName() {
        return brName;
    }

    public void setBrName(int brName) {
        this.brName = brName;
    }
    
}
