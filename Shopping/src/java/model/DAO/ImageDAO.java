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
import model.entity.Image;

/**
 *
 * @author NhienHT
 */
public class ImageDAO {

    private Connection conn;

    public ImageDAO() {
        DBConnection db = new DBConnection();
        this.conn = db.getDBConnection();
    }

    public boolean insert(int pID, String path) {
        try {
            String sql = "INSERT INTO `image`(`pID`, `imageName`) VALUES (?,?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, pID);
            pst.setString(2, path);
            return pst.execute();
        } catch (SQLException ex) {
            Logger.getLogger(ImageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }
    public ResultSet getImage(int pID){
        try {
            String sql = "select * from image where pID = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, pID);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                return rs;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ImageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
        
    }

}
