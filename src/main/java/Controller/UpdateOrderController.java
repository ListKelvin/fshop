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
@WebServlet(name = "UpdateOrder", urlPatterns = {"/UpdateOrderController"})
public class UpdateOrderController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String ERROR_AUTHEN = "403.jsp";
    private static final String MANAGE_ORDER_PAGE = "MainController?action=ViewAllOrders&active=2&status=all";

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

            int orderId = Integer.parseInt(request.getParameter("orderId"));
            OrderInfo o = OrderUtils.ViewOrdersDetail(orderId);
            String status = request.getParameter("status");
            HttpSession session = request.getSession();
            AccountInfo user = (AccountInfo) session.getAttribute("user");
            if (o.getStatus().equals("cancel")) {
                log("order is already cancel!");
                request.setAttribute("message", "order is cancel!!!");
                url = MANAGE_ORDER_PAGE;
            }

            if (user == null) {
                log("(ViewCartController) Unauthentication!!");
                request.setAttribute("message", "Unauthentication!!");
                url = ERROR_AUTHEN;
            } else {

                if (status.equals("preparing") && user.getRole().equals(RoleConstant.SHOP) && o.getStatus().equals("checking")
                        || status.equals("delivering") && user.getRole().equals(RoleConstant.SHOP) && o.getStatus().equals("preparing")
                        || status.equals("done") && user.getRole().equals(RoleConstant.SHOP) && o.getStatus().equals("delivering")) {
                    log("get data successfully");
                    boolean check = OrderUtils.updateOrderStatus(orderId, status);
                    if (check) {
                        log("update status successfully");
                        request.setAttribute("message", "update status successfully");
                        url = MANAGE_ORDER_PAGE;
                    }

                } else if (status.equals("cancel")) {
                    OrderInfo order = OrderUtils.ViewOrdersDetail(orderId);
                    if (order.getStatus().equals("checking") || order.getStatus().equals("preparing")) {
                        boolean check = OrderUtils.cancelOrder(orderId);
                        if (check && user.getRole().equals(RoleConstant.SHOP)) {
                            request.setAttribute("message", "Cancel order successfully");
                            url = MANAGE_ORDER_PAGE;
                        } else {
                            request.setAttribute("message", "Cancel order fail");
                            url = MANAGE_ORDER_PAGE;
                        }
                    } else {
                        request.setAttribute("message", "Cannot Cancel Order");
                        url = MANAGE_ORDER_PAGE;
                    }
                } else {
                    request.setAttribute("message", "status is not valid");
                    url = MANAGE_ORDER_PAGE;
                }
            }

        } catch (Exception e) {
            request.setAttribute("message", "get data failed");

            log("Error at UpdateOrderController " + e.toString());
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
