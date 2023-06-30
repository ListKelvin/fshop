/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Connection.DBConnection;
import DTO.CartInfo;
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
public class CartUtils {
    private static Connection con = null;
    private String query = null;
    private static PreparedStatement stm = null;
    private static ResultSet rs = null;
    
    public static List<CartInfo> getCartProduct(int userId) {
        List<CartInfo> carts = new ArrayList<CartInfo>();
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM [product] p JOIN [cart] c ON c.productId = p.id WHERE c.userId = ? ";
            stm = con.prepareStatement(sql);
            stm.setInt(1, userId);
            rs = stm.executeQuery();
            while (rs.next()) {
                CartInfo row = new CartInfo();
                row.setCartId(rs.getInt(10));
                row.setUserId(rs.getInt("userId"));
                row.setId(rs.getInt("productId"));
                row.setTitle(rs.getString("title"));
                row.setDescription(rs.getString("description"));
                row.setCategoryName(rs.getString("category"));
                row.setPrice(rs.getFloat("price"));
                row.setImage(rs.getString("image"));
                row.setCartQuantity(rs.getInt("cart_quantity"));
                row.setQuantity(rs.getInt("quantity"));
                row.setSold(rs.getInt("sold"));
                row.setSoldOut(rs.getString("sold_out"));
                carts.add(row);
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
        return carts;
    }
    
    public static CartInfo checkCartProduct(CartInfo items) {
        CartInfo item = null;
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM [cart] WHERE userId = ? AND productId = ? ";
            stm = con.prepareStatement(sql);
            stm.setInt(1, items.getUserId());
            stm.setInt(2, items.getId());
            rs = stm.executeQuery();
            while (rs.next()) {
                item = new CartInfo();
                item.setCartId(rs.getInt("id"));
                item.setUserId(rs.getInt("userId"));
                item.setId(rs.getInt("productId"));
                item.setCartQuantity(rs.getInt("cart_quantity"));
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
        return item;
    }
    
     public static boolean addToCart(CartInfo items) {
        boolean result = false;
        try {
            con = DBConnection.getConnection();
            String query = "insert into cart(userId,productId) values (?,?)";
            stm = con.prepareStatement(query);
            stm.setInt(1, items.getUserId());
            stm.setInt(2, items.getId());
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
     
     public static boolean updateCartQuantity(int id, int quantity) {
        boolean result = false;
        try {
            con = DBConnection.getConnection();
            String query = "UPDATE cart SET cart_quantity=? WHERE id=?";
            stm = con.prepareStatement(query);
            stm.setInt(1, quantity);
            stm.setInt(2, id);
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
     
      public static boolean removeCart(int id) {
        boolean result = false;
        try {
            con = DBConnection.getConnection();
            String query = "DELETE FROM cart WHERE id=?";
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
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
