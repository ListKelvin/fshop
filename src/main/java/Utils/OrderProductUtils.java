/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Connection.DBConnection;
import DTO.OrderProductInfo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author 03lin
 */
public class OrderProductUtils {

    private static Connection con = null;
    private static String query = null;
    private static PreparedStatement stm = null;
    private static ResultSet rs = null;

    public boolean insertOrderProduct(OrderProductInfo orderInfo) {
        boolean result = false;
        try {
            con = DBConnection.getConnection();
            query = "INSERT INTO order_product (order_id, product, quantity, total) VALUES (?,?,?,?)";
            stm = con.prepareStatement(query);
            stm.setInt(1, orderInfo.getOrderId());
            stm.setInt(2, orderInfo.getId());
            stm.setInt(3, orderInfo.getQuantity());
            stm.setFloat(4, orderInfo.getTotal());
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
    
    public static List<OrderProductInfo> viewOrderProduct (int orderId){
        List<OrderProductInfo> list = new ArrayList<OrderProductInfo>();
        try {
            con = DBConnection.getConnection();
            query = "  SELECT p.id, p.title, p.image, p.category, o.order_id, o.quantity, o.total FROM product p JOIN [order_product] o ON o.product = p.id WHERE o.order_id=?";
            stm = con.prepareStatement(query);
            stm.setInt(1, orderId);
            rs = stm.executeQuery();
         while (rs.next()) {
                OrderProductInfo row = new OrderProductInfo();
                row.setId(rs.getInt("id"));
                row.setTitle(rs.getString("title"));
                row.setImage(rs.getString("image"));
                row.setCategoryName(rs.getString("category"));
                row.setOrderId(rs.getInt("order_id"));
                row.setQuantity(rs.getInt("quantity"));
                row.setTotal(rs.getFloat("total"));
                list.add(row);
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
        return list;
    }
}
