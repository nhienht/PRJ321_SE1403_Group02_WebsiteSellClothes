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
import model.entity.Products;

/**
 *
 * @author NhienHT
 */
public class ProductsDAO {

    private Connection conn;

    public ProductsDAO() {
        DBConnection db = new DBConnection();
        this.conn = db.getDBConnection();
    }

    public ResultSet getAll() {
        try {
            String sql = "select * from products";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public Products getProduct(int id){
       String sql = "Select * from products where pId=? ";
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                Products p = new  Products(id, rs.getInt("spID"), rs.getInt("brID"), rs.getInt("tID"), rs.getInt("supID"),rs.getString("pName") , rs.getDouble("sellingPrice"), rs.getDouble("price"), rs.getString("describle"),rs.getDate("pDate"), rs.getInt("size"), rs.getString("material"));
                return p;
            }
        } catch (SQLException ex) {
        }
        return null;
    }
    
    public boolean insert(Products p) {
        try {
            String sql = "insert into products (`spID`, `brID`, `tID`, `supID`, `pName`, `sellingPrice`, `price`, `describle`, `pDate`, `size`, `material`) values (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, p.getSpID());
            pst.setInt(2, p.getBrID());
            pst.setInt(3, p.gettID());
            pst.setInt(4, p.getSupID());
            pst.setString(5, p.getpName());
            pst.setDouble(6, p.getSellingPrice());
            pst.setDouble(7, p.getPrice());
            pst.setString(8, p.getDescrible());
            pst.setDate(9, (Date) p.getpDate());
            pst.setInt(10, p.getSize());
            pst.setString(11, p.getMaterial());
            return pst.execute();
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int update(Products p) {
        try {
            String sql = "update products set spID=?, brID=?, tID=?, supID=?, pName=?, sellingPrice=?, price=?, describle=?, pDate=?, size=?, material=? where pID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, p.getSpID());
            pst.setInt(2, p.getBrID());
            pst.setInt(3, p.gettID());
            pst.setInt(4, p.getSupID());
            pst.setString(5, p.getpName());
            pst.setDouble(6, p.getSellingPrice());
            pst.setDouble(7, p.getPrice());
            pst.setString(8, p.getDescrible());
            pst.setDate(9, (Date) p.getpDate());
            pst.setInt(10, p.getSize());
            pst.setString(11, p.getMaterial());
            pst.setInt(12, p.getpID());
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int delete(int id) {
        try {
            String sql = "delete from products where pID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
