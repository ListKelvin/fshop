/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Connection.DBConnection;
import DTO.AccountInfo;
import DTO.CartInfo;
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
public class ProductUtils {

    private static Connection con = null;
    private String query = null;
    private static PreparedStatement stm = null;
    private static ResultSet rs = null;

    public static List<ProductInfo> getAllProduct() {
        List<ProductInfo> products = new ArrayList<ProductInfo>();
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM [product]";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                ProductInfo row = new ProductInfo();
                row.setId(rs.getInt("id"));
                row.setTitle(rs.getString("title"));
                row.setDescription(rs.getString("description"));
                row.setCategoryName(rs.getString("category"));
                row.setPrice(rs.getInt("price"));
                row.setImage(rs.getString("image"));
                row.setQuantity(rs.getInt("quantity"));
                row.setSoldOut(rs.getInt("sold_out"));
                products.add(row);
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
        return products;
    }

    public List<CartInfo> getCartProducts(ArrayList<CartInfo> cartList) {
        List<CartInfo> products = new ArrayList<CartInfo>();
        try {
            if (cartList.size() > 0) {
                for (CartInfo item : cartList) {
                    query = "SELECT * FROM product WHERE id=?";
                    stm = this.con.prepareStatement(query);
                    stm.setInt(1, item.getId());
                    rs = stm.executeQuery();
                    while (rs.next()) {
                        CartInfo row = new CartInfo();
                        row.setId(rs.getInt("id"));
                        row.setTitle(rs.getString("title"));
                        row.setDescription(rs.getString("description"));
                        row.setCategoryName(rs.getString("category"));
                        row.setPrice(rs.getInt("price"));
                        row.setImage(rs.getString("image"));
                        row.setSoldOut(rs.getInt("sold_out"));
                        row.setPrice(rs.getInt("price") * item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        products.add(row);
                    }

                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());

        }
        return products;
    }

}
