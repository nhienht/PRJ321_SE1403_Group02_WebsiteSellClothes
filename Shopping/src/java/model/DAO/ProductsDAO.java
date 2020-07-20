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

    public Products getProduct(int id) {
        String sql = "Select * from products where pId=? ";
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                Products p = new Products(id, rs.getInt("status"), rs.getInt("brID"), rs.getInt("tID"), rs.getInt("supID"), rs.getString("pName"), rs.getDouble("sellingPrice"), rs.getDouble("price"), rs.getString("describle"), rs.getDate("pDate"), rs.getInt("size"), rs.getString("material"), rs.getInt("quantity"), rs.getFloat("discount"), rs.getString("gender"));
                return p;
            }
        } catch (SQLException ex) {
        }
        return null;
    }

    public boolean insert(Products p) {
        try {
            String sql = "insert into products (`status`, `brID`, `tID`, `supID`, `pName`, `sellingPrice`, `price`, `describle`, `pDate`, `size`, `material`, `quantity`, `discount`, gender) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            pst.setInt(12, p.getQuantity());
            pst.setFloat(13, p.getDiscount());
            pst.setString(14, p.getGender());
            return pst.execute();
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int update(Products p) {
        try {
            String sql = "update products set status=?, brID=?, tID=?, supID=?, pName=?, sellingPrice=?, price=?, describle=?, pDate=?, size=?, material=?, quantity = ?, discount=?, gender=? where pID=?";
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
            pst.setInt(12, p.getQuantity());
            pst.setFloat(13, p.getDiscount());
            pst.setString(14, p.getGender());
            pst.setInt(15, p.getpID());
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

    public int getQuantity(int pID) {
        try {
            String sql = "Select quantity from products where pID = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, pID);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt("quantity");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void updateQuantity(int pID, int quantity) {
        int nowQuantity = this.getQuantity(pID);
        if (nowQuantity > 0) {
            String sql = "Update products set quantity=? where pID=?";
            try {
                PreparedStatement st = conn.prepareStatement(sql);
                st.setInt(1, nowQuantity - quantity);
                st.setInt(2, pID);
                st.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public int ChangeStatus(int id, int status) {
        try {
            String sql = "UPDATE `products` SET `status`=? WHERE  `cID`=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, status);
            pst.setInt(2, id);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ResultSet getProductByType(int id) {

        try {
            String sql = "Select * from products where tID = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            return pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ResultSet getProductByStatus(int status) {
        try {
            String sql = "select * from products where status=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, status);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ResultSet getProductConHang(){
        try {
            String sql = "select * from product where quantity > 0";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ResultSet getProductHetHang(){
        try {
            String sql = "select * from product where quantity = 0";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getMax() {
        try {

            String sql = "Select max(pID) as pID from products";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("pID");
            }

        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ResultSet getProductbyPrice(double startPrice, double endPrice) {
        try {
            String sql = "SELECT * FROM `products` WHERE price > ? and price < ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setDouble(1, startPrice);
            pst.setDouble(2, endPrice);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public ResultSet getProductBySupplier(int supID){
        try {
            String sql = "select * from products where supID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, supID);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public ResultSet getProductByBrand(int brID){
        try {
            String sql = "select * from products where brID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, brID);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    

}
