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
import model.entity.Comment;

/**
 *
 * @author NhienHT
 */
public class CommentDAO {
    private Connection conn;

    public CommentDAO() {
        DBConnection db = new DBConnection();
        this.conn = db.getDBConnection();
    }
    public ResultSet getAll(){
        try {
            String sql = "select * from comment";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public ResultSet getCommentbyProduct(int pID){
          try {
            String sql = "select * from comment where pID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, pID);
            ResultSet rs = pst.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public boolean insert(Comment c){
        try {
            String sql="INSERT INTO `comment`(`pID`, `cID`, `cmtMessage`, `cmtDate`, `status`) VALUES (?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, c.getpID());
            pst.setInt(2, c.getcID());
            pst.setString(3, c.getCmtMessage());
           pst.setDate(4, java.sql.Date.valueOf(LocalDate.now()));
            pst.setInt(5, 0);
           return pst.execute();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
        
    }
    public int delete(int cmtID){
        try {
            String sql = "DELETE FROM `comment` WHERE cmtID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, cmtID);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
}
