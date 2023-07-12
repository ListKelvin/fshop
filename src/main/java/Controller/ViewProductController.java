/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.AccountInfo;
import DTO.ProductInfo;
import Utils.ProductUtils;
import Utils.RoleConstant;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Minh
 */
@WebServlet(name = "ViewProduct", urlPatterns = {"/ViewProductController"})
public class ViewProductController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String ERROR_AUTHEN = "403.jsp";
    private static final String VIEW_PRODUCT_CUSTORMER_PAGE = "productdetails.jsp";
    private static final String VIEW_PRODUCT_ADMIN_PAGE = "shop-product.jsp";

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
        String url = ERROR;
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            HttpSession session = request.getSession();
            AccountInfo user = (AccountInfo) session.getAttribute("user");
            ProductInfo po = ProductUtils.getSingleProduct(id);

            request.setAttribute("product", po);

            if (user.getRole().equals(RoleConstant.CUSTOMER)) {
                url = VIEW_PRODUCT_CUSTORMER_PAGE;
            } else if (user.getRole().equals(RoleConstant.SHOP)) {
                url = VIEW_PRODUCT_ADMIN_PAGE;
            } else {
                url = ERROR_AUTHEN;
            }
        } catch (NumberFormatException ex) {
            request.setAttribute("message", "id invalid");
            log("Error in ViewOrderController: " + ex.getMessage());
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
