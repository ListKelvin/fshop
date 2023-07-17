/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.AccountInfo;

import DTO.OrderInfo;
import DTO.OrderProductInfo;
import DTO.ProductInfo;
import DTO.UserInfo;

import Utils.OrderProductUtils;
import Utils.OrderUtils;
import Utils.ProductUtils;
import Utils.UserUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "Buy Now", urlPatterns = {"/BuyNowController"})
public class BuyNowController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String CART_PAGE = "MainController?action=ViewOrderHistory";
    private static final String ERROR_AUTHEN = "403.jsp";

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
        int productId = Integer.parseInt(request.getParameter("id"));
        float total = 0;
        String url = ERROR;
        String uuid = null;
        OrderUtils ou = new OrderUtils();
        OrderProductUtils opu = new OrderProductUtils();
        ProductUtils pu = new ProductUtils();
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        try {
            AccountInfo user = (AccountInfo) request.getSession().getAttribute("user");
            UserInfo userinfo = null;
            ProductInfo product = null;
            if (user == null) {
                request.setAttribute("message", "Unauthentication!!");
                url = ERROR_AUTHEN;
            } else {
                userinfo = UserUtils.getUser(user.getId());
                product = ProductUtils.getSingleProduct(productId);
            }
            if (product != null && userinfo != null) {
                if (product.getSoldOut().equals("false") && product.getQuantity() >= 1 && userinfo.getPhone() != null && userinfo.getAddress() != null && userinfo.getName() != null) {
                    OrderInfo order = new OrderInfo();
                    uuid = UUID.randomUUID().toString();
                    order.setOrderNumber(uuid);
                    order.setCreateAt(sqlDate);
                    order.setUserId(userinfo.getId());
                    order.setDelivery(request.getParameter("delivery"));
                    order.setPayment(request.getParameter("payment"));
                    order.setTotalBill(product.getPrice());

                    boolean result = ou.insertOrder(order);

                    if (result) {
                        System.out.println("create order successfull");
                        order = ou.findOrder(uuid);
                        int orderId = order.getOrderId();
                        OrderProductInfo oi = new OrderProductInfo();
                        oi.setOrderId(orderId);
                        oi.setId(productId);
                        oi.setQuantity(1);
                        oi.setTotal(product.getPrice());

                        boolean r = opu.insertOrderProduct(oi);

                        if (r) {
                            if (product.getQuantity() == 1) {
                                product.setSoldOut("true");
                            } else {
                                product.setSoldOut("false");
                            }
                            product.setQuantity(product.getQuantity() - 1);
                            product.setSold(product.getSold() + 1);
                            boolean update = pu.updateProductSold(product);
                            if (update) {
                                System.out.println("its okiee !! ");
                                url = CART_PAGE;
                            } else {
                                request.setAttribute("message", "ERROR IN CREATE ORDER!!");
                                url = ERROR;
                            }

                        } else {
                            request.setAttribute("message", "ERROR IN CREATE ORDER!!");
                            url = ERROR;
                        }
                    } else {
                        request.setAttribute("message", "ERROR IN CREATE ORDER!!");
                        url = ERROR;
                    }
                } else {
                    request.setAttribute("message", "Product or User Info is not available!!");
                    url = ERROR;
                }

            } else {
                request.setAttribute("message", "Product or User is not available!!");
                url = ERROR;
            }

        } catch (Exception e) {
            log("Exception at BuyNowController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
