/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.AccountInfo;
import DTO.CartInfo;
import DTO.UserInfo;
import Utils.CartUtils;
import Utils.UserUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 03lin
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String ERROR_PAGE = "error.jsp";


    private static final String CART_PAGE = "MainController?action=ViewCart";

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
        request.setCharacterEncoding("utf-8");
        boolean result = false;
        String url = ERROR_PAGE;
        try {
            HttpSession session = request.getSession();

            AccountInfo user = (AccountInfo) session.getAttribute("user");
            if (user != null) {
                UserInfo userinfo = UserUtils.getUser(user.getId());
                int id = Integer.parseInt(request.getParameter("id"));

                CartInfo ci = new CartInfo();
                ci.setUserId(userinfo.getId());
                ci.setId(id);

                CartInfo checkCart = (CartInfo) CartUtils.checkCartProduct(ci);
                if (checkCart != null) {
                    CartUtils.updateCartQuantity(checkCart.getCartId(), checkCart.getCartQuantity() + 1);
                    request.setAttribute("message", "add to cart successfully");
                    System.out.println("(addtocart) add to cart successfully  ");

                    url = CART_PAGE;
                } else {
                    result = CartUtils.addToCart(ci);

                    if (result) {

                        request.setAttribute("message", "add to cart successfully");
                        System.out.println("(addtocart) line 78 add to cart successfully  ");

                        url = CART_PAGE;
                    } else {
                        System.out.println("(addtocart) line 82 add to cart successfully  ");

                        request.setAttribute("message", "add to cart fail");
                        url = ERROR_PAGE;

                    }
                }
            } else {
                request.setAttribute("message", "CAN NOT FIND USER");
                url = ERROR_PAGE;
            }

        } catch (Exception ex) {
            log("Error in AddToCartController: " + ex.getMessage());
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
