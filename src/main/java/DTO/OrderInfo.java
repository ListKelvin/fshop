/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.util.Date;

/**
 *
 * @author 03lin
 */
public class OrderInfo extends UserInfo{
    private int orderId;
    private String orderNumber;
    private int userId;
    private String payment;
    private String delivery;
    private Date createAt;
    private String status;
    private float totalBill;

    public OrderInfo() {
    }

    public OrderInfo(int orderId, String orderNumber, int userId, String payment, String delivery, Date createAt, String status, float totalBill) {
        this.orderId = orderId;
        this.orderNumber = orderNumber;
        this.userId = userId;
        this.payment = payment;
        this.delivery = delivery;
        this.createAt = createAt;
        this.status = status;
        this.totalBill = totalBill;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getDelivery() {
        return delivery;
    }

    public void setDelivery(String delivery) {
        this.delivery = delivery;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public float getTotalBill() {
        return totalBill;
    }

    public void setTotalBill(float totalBill) {
        this.totalBill = totalBill;
    }
    
    

}
