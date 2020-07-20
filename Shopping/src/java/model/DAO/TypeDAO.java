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
 * @author NhienHT
 */
public class TypeDAO {
     private Connection conn;

    public TypeDAO() {
        DBConnection db = new DBConnection();
        this.conn = db.getDBConnection();
    }
    public ResultSet getAll(){
         try {
             String sql = "Select * from type";
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery();
             if(rs.next()){
                 return rs;
             }} catch (SQLException ex) {
             Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
         }         
         return null;
    }
    
}
