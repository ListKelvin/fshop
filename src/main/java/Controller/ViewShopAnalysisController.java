/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.AccountInfo;
import DTO.OrderInfo;
import Utils.OrderUtils;
import Utils.ProductUtils;
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
@WebServlet(name = "ViewShopAnalysis", urlPatterns = {"/ViewShopAnalysisController"})
public class ViewShopAnalysisController extends HttpServlet {

    private static final String ERROR = "error.jsp";

    private static final String ERROR_AUTHEN = "403.jsp";
    private static final String SHOP_HOME_PAGE = "shop-home.jsp";

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
            HttpSession session = request.getSession(true);
            AccountInfo account = (AccountInfo) session.getAttribute("user");

            if (account.getRole().equals(RoleConstant.SHOP)) {
                log(account.getName());
                List<OrderInfo> orderList = OrderUtils.getALLOrdersByStatus("checking");
                int totalOrder = OrderUtils.countOrder();
                int totalProduct = ProductUtils.countProduct();
                int totalUser = OrderUtils.countUser();
                request.setAttribute("totalUser", totalUser);
                request.setAttribute("totalProduct", totalProduct);
                request.setAttribute("totalOrder", totalOrder);
                request.setAttribute("orders", orderList);
                url = SHOP_HOME_PAGE;
            } else {
                log(account.getRole());
                url = ERROR_AUTHEN;
            }

        } catch (Exception e) {
            log("Error at ViewShopAnalysisController " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
//        try (PrintWriter out = response.getWriter()) {
//            String redirectPage = "dashboard-admin.jsp";
//            String term = request.getParameter("term");
//            if (term.equals("order")) {
//                int total = OrderUtils.countOrder();
//                request.setAttribute("total", total);
//                redirectPage = "dashboard-admin.jsp";
//            } else if (term.equals("product")) {
//                int total = ProductUtils.countProduct();
//                request.setAttribute("total", total);
//                redirectPage = "dashboard-admin.jsp";
//            } else if (term.equals("customer")) {
//                int total = OrderUtils.countUser();
//                request.setAttribute("total", total);
//                redirectPage = "dashboard-admin.jsp";
//            }
//
//            RequestDispatcher rd = request.getRequestDispatcher(redirectPage);
//            rd.forward(request, response);
//        }
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
