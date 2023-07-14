/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.AccountInfo;
import DTO.OrderInfo;
import Utils.OrderUtils;
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
@WebServlet(name = "CancelOrder", urlPatterns = {"/CancelOrderController"})
public class CancelOrderController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String ERROR_AUTHEN = "403.jsp";
    private static final String MANAGE_ORDER_PAGE = "MainController?action=ViewAllOrders&active=2&status=all";

    private static final String CUSTOMER_ORDER_PAGE = "MainController?action=ViewOrderHistory";

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
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String status = request.getParameter("status");
            if (status.equals("cancel")) {
                OrderInfo order = OrderUtils.ViewOrdersDetail(orderId);
                if (order.getStatus().equals("checking") || order.getStatus().equals("preparing")) {
                    boolean check = OrderUtils.cancelOrder(orderId);
                    if (check) {
                        request.setAttribute("message", "Cancel order successfully");
                    } else {
                        request.setAttribute("message", "Cancel order fail");
                    }
                }
            } else {
                request.setAttribute("message", "status is not valid");

            }

            if (user.getRole().equals(RoleConstant.CUSTOMER)) {
                url = CUSTOMER_ORDER_PAGE;
            } else if (user.getRole().equals(RoleConstant.SHOP)) {
                url = MANAGE_ORDER_PAGE;
            } else {
                url = ERROR_AUTHEN;
            }
        } catch (NumberFormatException ex) {
            log("Error in CancelOrderController: " + ex.getMessage());
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
