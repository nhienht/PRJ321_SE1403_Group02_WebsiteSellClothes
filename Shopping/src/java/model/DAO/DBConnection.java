/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dat
 */
public class DBConnection {

    private Connection conn;//Declare Connection

    /**
     * Connection to connect with database
     */
    public DBConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");//Declare Driver
            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/prj321", "root", "");//Declare url database
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Function to get Connection
     *
     * @return
     */
    public Connection getDBConnection() {
        return this.conn;
    }
}
