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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 
 */
public class BillDetailDAO {

    private Connection conn;

    public BillDetailDAO() {
        DBConnection db = new DBConnection();
        conn = db.getDBConnection();
    }

    public void addBillDetail(int bID, int pID, int quantity, double total) {
        try {
            String sql = "Insert into billdetail values(?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, bID);
            pst.setInt(2, pID);
            pst.setInt(3, quantity);
            pst.setDouble(4, total);
            pst.executeUpdate();
            ProductsDAO pDao = new ProductsDAO();
            pDao.updateQuantity(pID, quantity);
        } catch (SQLException ex) {
            Logger.getLogger(BillDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getBillDetail(int id) {
        try {
            String sql = "SELECT * FROM `billdetail` WHERE bID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(BillDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public ResultSet getBillDetail(){
        try{
            String sql = "select * from billdetail";
            PreparedStatement pst = conn.prepareStatement(sql);
            return pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(BillDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
