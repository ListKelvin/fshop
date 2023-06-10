/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Connection.DBConnection;
import DTO.CartInfo;
import DTO.CategoryInfo;
import DTO.ProductInfo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 03lin
 */
public class CategoryUtils {
     private static Connection con = null;
    private String query = null;
    private static PreparedStatement stm = null;
    private static ResultSet rs = null;
     public static List<CategoryInfo> getAllCategory() {
        List<CategoryInfo> category = new ArrayList<CategoryInfo>();
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM [category] ";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                CategoryInfo row = new CartInfo();
                row.setCategoryName(rs.getString("name"));
                category.add(row);
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
        return category;
    }
     
     public static CategoryInfo checkCategory (String cate) {
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM [category] WHERE name=?";
            stm = con.prepareStatement(sql);
            stm.setString(1, cate);
            rs = stm.executeQuery();
            if (rs.next()) {
                CategoryInfo category = new CategoryInfo();
                category.setCategoryName(rs.getString("name"));
                return category;
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
        return null;
    }
     
     public boolean insertCategory(String name) {
        boolean result = false;
        try {
            query = "insert into category(name) values (?)";
            stm = this.con.prepareStatement(query);
            stm.setString(1, name);
            stm.executeUpdate();
            result = true;
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
        return result;
    }
}
