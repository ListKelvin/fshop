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
import Utils.OrderProductUtils;
import Utils.OrderUtils;
import Utils.ProductUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
        try (PrintWriter out = response.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();

            // retrieve all cart products
            ArrayList<CartInfo> cart_list = (ArrayList<CartInfo>) request.getSession().getAttribute("cart-list");
            // user authentication
            AccountInfo user = (AccountInfo) request.getSession().getAttribute("user");

            if (cart_list != null && user != null) {
                 OrderInfo order = null;
                do{
                    uuid=UUID.randomUUID().toString();   
                    order = ou.findOrder(uuid);
                }while(order != null);
                
                oi.setOrderNumber(uuid);
                oi.setCreateAt(date);
                oi.setUserId(user.getId());
                oi.setDelivery(request.getParameter("delivery"));
                oi.setPayment(request.getParameter("payment"));
                oi.setTotalBill(pu.getTotalCartPrice(cart_list));
                
                boolean result = ou.insertOrder(oi);
                if(result){
                    System.out.println("create product successfull");
                    order = ou.findOrder(uuid);
                    int orderId = order.getOrderId();
                    for (CartInfo c : cart_list) {
                    opi.setOrderId(orderId);
                    opi.setId(c.getId());
                    opi.setQuantity(c.getCartQuantity());
                    
                    boolean r = opu.insertOrderProduct(opi);
                    if(r){
                        cart_list.clear();
                        response.sendRedirect("cart.jsp");
                    }else{
                        System.out.println("sth is wrong :((( ");
                    }
                }
                }else{
                    System.out.println("create product fail");
                }
                
            }else{
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
