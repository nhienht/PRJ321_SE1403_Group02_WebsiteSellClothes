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
 * @author DAt
 */
public class AdminDAO {

    Connection conn;

    public AdminDAO() {
        DBConnection dbConnect = new DBConnection();
        this.conn = dbConnect.getDBConnection();
    }

    public int login(String user, String pass) {
        try {
            String sql = "SELECT * FROM `admin` WHERE `aUsername`=? AND `aPassword`=MD5(?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, user);
            pst.setString(2, pass);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
}
