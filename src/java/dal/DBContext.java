/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nqtie
 */
public class DBContext {

  
     protected Connection connection;
    public DBContext()  {
        // Edit URL , username, password to authenticate with your MS SQL Server
        try {
             String url = "jdbc:sqlserver://localhost:1433;databaseName=Assgn_PRJ;encrypt=true;trustServerCertificate=true";
        String username = "thanhhai";
        String password = "123456";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        connection = DriverManager.getConnection(url, username, password);
        }
       
         catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        DBContext a = new DBContext();
        System.out.println(a.connection);
    }
}

