/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author 03lin
 */
public class DBConnection {
     public static Connection getConnection() throws Exception {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=fshop;instanceName=MSSQLSERVER";
            Connection conn = DriverManager.getConnection(dbURL,"Minh2","minh1234");
            return conn;
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
        try {
            System.out.println(new DBConnection().getConnection());
        } catch (Exception e) {
        }
        
    }
}
