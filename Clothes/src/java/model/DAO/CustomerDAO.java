/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.entity.Customer;

/**
 *
 * @author NhienHT
 */
public class CustomerDAO {

    private Connection conn;

    public CustomerDAO() {
        DBConnection db = new DBConnection();
        conn = db.getDBConnection();
    }

    public boolean checkUser(String user) {
        try {
            String sql = "select * from customer where cUsername=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return false;
            } else {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean insert(Customer c) {
        try {
            String sql = "insert into customer(`cPassword`, `cUsername`, `cName`, `phonenumber`, `address`, `birthday`, `email`, `status`, `gender`) values (?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, c.getcPassword());
            pst.setString(2, c.getcUsername());
            pst.setString(3, c.getcName());
            pst.setString(4, c.getPhonenumber());
            pst.setString(5, c.getAddress());
            pst.setDate(6, (Date) c.getBirthday());
            pst.setString(7, c.getEmail());
            pst.setInt(8, c.getStatus());
            pst.setInt(9, c.getGender());
            return pst.execute();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    

    public boolean login(String user, String pass) {
        try {
            String sql = "SELECT * FROM `customer` WHERE `cUsername`=? AND `cPassword`=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, user);
            pst.setString(2, pass);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
