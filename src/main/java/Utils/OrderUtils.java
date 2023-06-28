/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Connection.DBConnection;
import DTO.OrderInfo;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 03lin
 */
public class OrderUtils {

    private static Connection con = null;
    private String query = null;
    private static PreparedStatement stm = null;
    private static ResultSet rs = null;

    public boolean insertOrder(OrderInfo order) {
        boolean result = false;
        try {
            con = DBConnection.getConnection();
            query = "INSERT INTO order (order_number, user, delivery, payment, create_at, total_bill) values(?,?,?,?,?,?)";
            stm = this.con.prepareStatement(query);
            stm.setString(1, order.getOrderNumber());
            stm.setInt(2, order.getUserId());
            stm.setString(3, order.getDelivery());
            stm.setString(4, order.getPayment());
            stm.setDate(5, (Date) order.getCreateAt());
            stm.setFloat(6, order.getTotalBill());
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
    
    public OrderInfo findOrder(String orderNumber){
        OrderInfo order = new OrderInfo();
        try {
            con = DBConnection.getConnection();
            query = "SELECT * FROM order WHERE order_number=?";
            stm = this.con.prepareStatement(query);
            stm.setString(1, orderNumber);
            rs = stm.executeQuery();
            while(rs.next()){
                order.setOrderId(rs.getInt("id"));
                order.setOrderNumber(rs.getString("order_number"));
                order.setUserId(rs.getInt("user"));
                order.setDelivery(rs.getString("delivery"));
                order.setPayment(rs.getString("payment"));
                order.setCreateAt(rs.getDate("create_at"));
                order.setStatus(rs.getString("status"));
                order.setTotalBill(rs.getFloat("total_bill"));
            }
        }  catch (SQLException ex) {
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
        return order;
    }

    public List<OrderInfo> userOrders(int id) {
        List<OrderInfo> list = new ArrayList<OrderInfo>();
        try {
            con = DBConnection.getConnection();
            query = "SELECT * FROM order WHERE user=? ORDER BY order.id DESC";
            stm = this.con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                OrderInfo order = new OrderInfo();
                order.setOrderId(rs.getInt("id"));
                order.setOrderNumber(rs.getString("order_number"));
                order.setUserId(rs.getInt("user"));
                order.setDelivery(rs.getString("delivery"));
                order.setPayment(rs.getString("payment"));
                order.setCreateAt(rs.getDate("create_at"));
                order.setStatus(rs.getString("status"));
                order.setTotalBill(rs.getFloat("total_bill"));
                list.add(order);
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
