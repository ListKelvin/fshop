/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Connection.DBConnection;
import DTO.UserInfo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author 03lin
 */
public class UserUtils {
     private static Connection con = null;
    private String query = null;
    private static PreparedStatement stm = null;
    private static ResultSet rs = null;
    public static boolean createUser(int account ) {
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO [user](account)" + "VALUES (?)";
            stm = con.prepareStatement(sql);
            stm.setInt(1, account);
            int row = stm.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }
    
    public static UserInfo getUser(int account){
        UserInfo userinfo = null;
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM [user] WHERE account = ?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, account);
            rs = stm.executeQuery();
             while (rs.next()) {
                userinfo = new UserInfo();
                userinfo.setId(rs.getInt("id"));
                userinfo.setName(rs.getString("name"));
                userinfo.setAvatar(rs.getString("avatar"));
                userinfo.setDob(rs.getDate("dob"));
                userinfo.setGender(rs.getString("gender"));
                userinfo.setPhone(rs.getString("phone"));
                userinfo.setAddress(rs.getString("address"));
                userinfo.setAccount_id(rs.getInt("account"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return userinfo;
    }
}
