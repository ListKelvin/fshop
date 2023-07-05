/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.CartInfo;
import Utils.CartUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 03lin
 */
@WebServlet(name = "UpdateCart", urlPatterns = {"/UpdateCartController"})
public class UpdateCartController extends HttpServlet {

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
        String url = ERROR_PAGE;
        try {

            String action = request.getParameter("btnAction");
            int id = Integer.parseInt(request.getParameter("cartid"));
            int currentQuantiy = Integer.parseInt(request.getParameter("quantity"));
            log(action);
            if (action != null && id >= 1) {

                if (action.equals("inc")) {
                    CartUtils.updateCartQuantity(id, currentQuantiy + 1);

                    url = CART_PAGE;
                } else if (action.equals("dec") & currentQuantiy > 1) {
                    CartUtils.updateCartQuantity(id, currentQuantiy - 1);
                    url = CART_PAGE;
                } else {
                    CartUtils.removeCart(id);
                    url = CART_PAGE;
                }

            } else {
                request.setAttribute("message", "Update cart faiiled ");
                url = ERROR_PAGE;
            }

        } catch (NumberFormatException ex) {
            log("Error in UpdateCartController: " + ex.getMessage());
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
