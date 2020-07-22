/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import static java.nio.charset.StandardCharsets.UTF_8;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.entity.Customer;
import sun.security.provider.MD5;

/**
 *
 * @author Dat
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
            String sql = "insert into customer(`cPassword`, `cUsername`, `cName`, `phonenumber`, `address`, `birthday`, `email`, `status`, `gender`) values (MD5(?),?,?,?,?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, c.getcPassword());
            pst.setString(2, c.getcUsername());
            pst.setString(3, c.getcName());
            pst.setString(4, c.getPhonenumber());
            pst.setString(5, c.getAddress());
            pst.setDate(6, (Date) c.getBirthday());
            pst.setString(7, c.getEmail());
            pst.setInt(8, c.getStatus());
            pst.setString(9, c.getGender());
            return pst.execute();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int update(Customer c) {
        try {
            String sql = "UPDATE `customer` SET `cPassword`=MD5(?),`cUsername`=?,`cName`=?,`phonenumber`=?,`address`=?,`birthday`=?,`email`=?,`status`=?,`gender`=? WHERE `cID`=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, c.getcPassword());
            pst.setString(2, c.getcUsername());
            pst.setString(3, c.getcName());
            pst.setString(4, c.getPhonenumber());
            pst.setString(5, c.getAddress());
            pst.setDate(6, (Date) c.getBirthday());
            pst.setString(7, c.getEmail());
            pst.setInt(8, c.getStatus());
            pst.setString(9, c.getGender());
            pst.setInt(10, c.getcID());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int delete(int id) {
        try {
            String sql = "DELETE FROM `customer` WHERE cID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int ChangeStatus(int id, int status) {
        try {
            String sql = "UPDATE `customer` SET `status`=? WHERE  `cID`=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, status);
            pst.setInt(2, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int login(String user, String pass) {
        try {
            String sql = "SELECT * FROM `customer` WHERE `cUsername`=? AND `cPassword`=MD5(?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, user);
            pst.setString(2, pass);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt("cID");
            } else {
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public ResultSet getAll() {
        try {
            String sql = "SELECT * FROM `customer`";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Customer getCustomer(int id) {
        try {
            String sql = "select * from customer where cID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                Customer c = new Customer(id, rs.getString(3), rs.getString(2), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getInt(9), rs.getString(10));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public int changePass(int cID, String oldPass, String newPass) {
        try {
            String sql = "select * from customer where cID = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, cID);
            ResultSet rs = pst.executeQuery();
             // mã hóa MD5 
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] bytes = md.digest(oldPass.getBytes("UTF-8"));
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < bytes.length; i++) {
                byte b = bytes[i];
                String hex = Integer.toHexString((int) 0x00FF & b);
                if (hex.length() == 1) {
                    sb.append("0");
                }
                sb.append(hex);
            }
            String old = sb.toString();
            if (rs.next()) {
                if (rs.getString(2).equalsIgnoreCase(old)) {
                    String sql2 = "UPDATE customer set cPassword=md5(?) where cID=?";
                    PreparedStatement pst2 = conn.prepareStatement(sql2);
                    pst2.setString(1, newPass);
                    pst2.setInt(2, cID);
                    return pst2.executeUpdate();
                }
            } else {
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
     public int getMaxCustomer() {
        try {
            DBConnection db = new DBConnection();
            String sql = "Select max(cID) as cID from customer";

            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("cID");
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
