/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.AccountInfo;
import DTO.OrderInfo;
import Utils.OrderUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "UpdateOrderController", urlPatterns = {"/UpdateOrder"})
public class UpdateOrderController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String redirectPage = null;
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String status = request.getParameter("status");
            HttpSession session = request.getSession();
            AccountInfo user = (AccountInfo) session.getAttribute("user");
            if (user == null) {
                log("(ViewCartController) Unauthentication!!");
                request.setAttribute("message", "Unauthentication!!");
                redirectPage = ERROR_AUTHEN;
            } else {
                if (status.equals("checking") && user.getRole().equals("admin") || 
                        status.equals("preparing") && user.getRole().equals("admin") || 
                        status.equals("delivering") && user.getRole().equals("admin") || 
                        status.equals("done") && user.getRole().equals("admin")) {
                    boolean check = OrderUtils.updateOrderStatus(orderId, status);
                    if (check) {
                        request.setAttribute("mess", "update status successfully");
                        redirectPage = "manage-order-page.jsp";
                    }

                } else if (status.equals("cancel")) {
                    OrderInfo order = OrderUtils.ViewOrdersDetail(orderId);
                    if (order.getStatus().equals("checking") || order.getStatus().equals("preparing")) {
                        boolean check = OrderUtils.cancelOrder(orderId);
                        if (check && user.getRole().equals("admin")) {
                            request.setAttribute("mess", "Cancel order successfully");
                            redirectPage = "manage-order-page.jsp";
                        } else {
                            request.setAttribute("mess", "Cancel order fail");
                            redirectPage = "order-history-page.jsp";
                        }
                    }
                } else {
                    request.setAttribute("mess", "status is not valid");
                    redirectPage = "manage-order-page.jsp";
                }
            }

            RequestDispatcher rd = request.getRequestDispatcher(redirectPage);
            rd.forward(request, response);
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
