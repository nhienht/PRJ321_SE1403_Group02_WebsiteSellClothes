/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.entity.Bill;

/**
 *
 * @author
 */
public class BillDAO {

    private Connection conn;

    public BillDAO() {
        DBConnection db = new DBConnection();
        conn = db.getDBConnection();
    }

    public boolean addBill(int cusID, String bStatus, String cName, String address, String phone, String note, double total) {
        int rs = 0;
        try {
            String sql = "INSERT INTO `bill`(`cID`, `bStatus`, `customerName`, `bDate`, `address`, `phone`, `note`, `total`) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, cusID);
            pst.setString(2, bStatus);
            pst.setString(3, cName);
            pst.setDate(4, java.sql.Date.valueOf(LocalDate.now()));
            pst.setString(5, address);
            pst.setString(6, phone);
            pst.setString(7, note);
            pst.setDouble(8, total);
            rs = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs > 0 ? true : false;
    }

    public int getMaxBill() {
        try {
            DBConnection db = new DBConnection();
            String sql = "Select max(bID) as bID from bill";

            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("bID");
            }

        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ResultSet getAll() {
        try {
            String sql = "select * from bill";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Bill getBill(int id) {
        try {
            String sql = "select * from bill where bID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                Bill b = new Bill(id, rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDouble(9));
                return b;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int update(Bill b) {
        try {
            String sql = "UPDATE `bill` SET `cID`=?,`customerName`=?,`bDate`=?,`address`=?,`phone`=?,`note`=?,`total`=? WHERE bID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, b.getcID());
            pst.setString(2, b.getCustomerName());
            pst.setDate(3, java.sql.Date.valueOf(LocalDate.now()));
            pst.setString(4, b.getAddress());
            pst.setString(5, b.getPhone());
            pst.setString(6, b.getNote());
            pst.setDouble(7, b.getTotal());
            pst.setInt(8, b.getbID());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int delete(int id) {
        try {
            String sql = "delete from bill where bID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int changeStatus(int bID, String newStatus) {
        try {
            String sql = "UPDATE `bill` SET `bStatus`=? WHERE bID = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, newStatus);
            pst.setInt(2, bID);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ResultSet getBillbyCustomer(int cId) {
        try {
            String sql = "select * from bill where cID =?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, cId);
            return pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

}
