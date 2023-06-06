/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Connection.DBConnection;
import DTO.AccountInfo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
/**
 *
 * @author 03lin
 */
public class DBUtils {

    public static boolean register(String username, String password, String email) {
        PreparedStatement stm = null;
        Connection conn = null;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO [account](user_name,password,email)" + "VALUES (?,?,?)";
            stm = conn.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.setString(3, email);
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
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }

    public static AccountInfo login(String email, String password) {
        PreparedStatement stm = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM [account] WHERE email=? AND password=?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                String accountName = rs.getString("user_name");
                String accountEmail = rs.getString("email");
                String accountRole = rs.getString("role");
                AccountInfo accountInfo = new AccountInfo();
                accountInfo.setName(accountName);
                accountInfo.setEmail(accountEmail);
                accountInfo.setRole(accountRole);
                return accountInfo;
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
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }
    
     public static AccountInfo checkEmail(String email) {
        PreparedStatement stm = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM [account] WHERE email=?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                String accountEmail = rs.getString("email");
                AccountInfo accountInfo = new AccountInfo();
                accountInfo.setEmail(accountEmail);
                return accountInfo;
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
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }
    
     public static boolean registerByFB(String username, String facebookID, String facebookLink) {
        PreparedStatement stm = null;
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO [account](user_name,facebook_id,facebook_link)" + "VALUES (?,?,?)";
            stm = conn.prepareStatement(sql);
           
            stm.setString(1, username);
            stm.setString(2, facebookID);
            stm.setString(3, facebookLink);
            
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
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }
     
      public static AccountInfo login(String facebookID) {
        PreparedStatement stm = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM [account] WHERE facebook_id=?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, facebookID);
            rs = stm.executeQuery();
            if (rs.next()) {
                String user = rs.getString(2);
                String faceId = rs.getString(4);
                String faceLink = rs.getString(5);
                String accountEmail = rs.getString("email");
                String accountRole = rs.getString("role"); 
                
                AccountInfo accountInfo = new AccountInfo();
                accountInfo.setName(user);
                accountInfo.setFacebookID(faceId.trim());
                accountInfo.setLink(faceLink);
                accountInfo.setEmail(accountEmail);
                accountInfo.setRole(accountRole);
                
                return accountInfo;
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
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }
     
}
