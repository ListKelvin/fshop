/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.AccountInfo;
import DTO.CartInfo;
import DTO.OrderInfo;
import DTO.OrderProductInfo;
import DTO.UserInfo;
import Utils.CartUtils;
import Utils.OrderProductUtils;
import Utils.OrderUtils;
import Utils.ProductUtils;
import Utils.UserUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 03lin
 */
@WebServlet(name = "CreateOrder", urlPatterns = {"/CreateOrder"})
public class CreateOrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        OrderUtils ou = new OrderUtils();
        OrderInfo oi = new OrderInfo();
        OrderProductUtils opu = new OrderProductUtils();
        OrderProductInfo opi = new OrderProductInfo();
        ProductUtils pu = new ProductUtils();
        String uuid = null;
        List<CartInfo> cartItems = null;
        float total = 0;
        
        try (PrintWriter out = response.getWriter()) {
            
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date date = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());
            
            AccountInfo user = (AccountInfo) request.getSession().getAttribute("user");
            UserInfo userinfo = null;
            if (user == null) {
                request.setAttribute("message", "Unauthentication!!");
                response.sendRedirect("index.jsp");
            } else {
                userinfo = UserUtils.getUser(user.getId());
                if (userinfo != null) {
                    CartUtils cartUtils = new CartUtils();
                    cartItems = cartUtils.getCartProduct(userinfo.getId());
                    total = ProductUtils.getTotalCartPrice(cartItems);
                } else {
                    request.setAttribute("message", "sth wrong at user info!!");
                    response.sendRedirect("home.jsp");
                }
                
            }
            
            if (cartItems != null && userinfo.getPhone() != null && userinfo.getAddress() != null && userinfo.getName() != null) {
                OrderInfo order = null;
                
                uuid = UUID.randomUUID().toString();
                oi.setOrderNumber(uuid);
                oi.setCreateAt(sqlDate);
                oi.setUserId(userinfo.getId());
//                oi.setDelivery(request.getParameter("delivery"));
//                oi.setPayment(request.getParameter("payment"));
                oi.setDelivery("COD");
                oi.setPayment("cash");
                oi.setTotalBill(total);
                
                boolean result = ou.insertOrder(oi);
                if (result) {
                    System.out.println("create order successfull");
                    order = ou.findOrder(uuid);
                    int orderId = order.getOrderId();
                    System.out.println("the order ID:" + orderId);
                    for (CartInfo c : cartItems) {
                        opi.setOrderId(orderId);
                        opi.setId(c.getId());
                        opi.setQuantity(c.getCartQuantity());
                        opi.setTotal(c.getCartQuantity()*c.getPrice());
                        boolean r = opu.insertOrderProduct(opi);
                        if (r) {
                            //cart_list.clear();
                            //response.sendRedirect("cart.jsp");
                            System.out.println("its okiee !! ");
                        } else {
                            System.out.println("sth is wrong :((( ");
                        }
                    }
                } else {
                    System.out.println("create product fail");
                }
                
            } else {
                System.out.println("cart or user is null");
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
