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
import Utils.ProductUtils;
import Utils.UserUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "ViewCart", urlPatterns = {"/ViewCartController"})
public class VỉewCartController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String ERROR_AUTHEN = "403.jsp";
    private static final String CART_PAGE = "cart.jsp";

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
            HttpSession session = request.getSession();
            AccountInfo user = (AccountInfo) session.getAttribute("user");
            UserInfo userinfo = null;
            if (user == null) {
                log("(ViewCartController) Unauthentication!!");
                request.setAttribute("message", "Unauthentication!!");
                url = ERROR_AUTHEN;
            } else {
                userinfo = UserUtils.getUser(user.getId());
                if (userinfo != null) {
                    CartUtils cartUtils = new CartUtils();
                    List<CartInfo> cartItems = cartUtils.getCartProduct(userinfo.getId());
                    request.setAttribute("cartItems", cartItems);
                    request.setAttribute("userinfo", userinfo);
                    float total = ProductUtils.getTotalCartPrice(cartItems);
                    request.setAttribute("total", total);
                    url = CART_PAGE;
                } else {
                    request.setAttribute("message", "sth wrong at user info!!");
                    url = ERROR;
                }

            }

        } catch (Exception ex) {
            log("Error in LoginController: " + ex.getMessage());
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
