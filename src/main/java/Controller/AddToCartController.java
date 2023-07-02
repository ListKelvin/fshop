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
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCartController extends HttpServlet {

    private static final long serialVersionUID = 1L;

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

        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();

            AccountInfo user = (AccountInfo) session.getAttribute("user");
       
            
            UserInfo userinfo = UserUtils.getUser(user.getId());

            int id = Integer.parseInt(request.getParameter("id"));
            System.out.println("(addtocart) id product:  " + id);

            CartInfo ci = new CartInfo();
            ci.setUserId(userinfo.getId());
            ci.setId(id);

            CartInfo checkCart = (CartInfo) CartUtils.checkCartProduct(ci);
            if (checkCart != null) {
                CartUtils.updateCartQuantity(checkCart.getCartId(), checkCart.getCartQuantity() + 1);
                request.setAttribute("message", "add to cart successfully");
                RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                rd.forward(request, response);
            } else {
                result = CartUtils.addToCart(ci);

                if (result) {
                    request.setAttribute("message", "add to cart successfully");
                    RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("message", "add to cart fail");
                    RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
                    rd.forward(request, response);

                }
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
