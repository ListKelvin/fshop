/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.AccountInfo;
import DTO.UserInfo;
import Utils.DBUtils;
import Utils.RoleConstant;
import Utils.UserUtils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.NoResultException;
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
@WebServlet(name = "Login", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String ERROR_PAGE = "error.jsp";
    private static final String ERROR_LOGIN = "index.jsp";

    private static final String CUSTOMER_PAGE = "MainController?action=SearchProduct&searchTxt=";
//    private static final String SHOP_PAGE = "MainController?action=SearchOrder&searchTxt=";
    private static final String SHOP_PAGE = "MainController?action=ViewShopAnalysis&active=0";

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
        //String url = null;
        try {

            String password = request.getParameter("txtPass");
            String email = request.getParameter("txtEmail");
            AccountInfo accountInfo = DBUtils.login(email, password);

            if (accountInfo == null) {
                request.setAttribute("message", "Wrong email or password");
                url = ERROR_LOGIN;
            } else {
                String role = accountInfo.getRole();
                System.out.println("(accountController) userid:  " + accountInfo.getId());
                UserInfo userInfo = UserUtils.getUser(accountInfo.getId());
                HttpSession session = request.getSession();
                session.setAttribute("user", accountInfo);
                session.setAttribute("userInfo", userInfo);

                if (RoleConstant.SHOP.equals(role)) {
                    url = SHOP_PAGE;
                } else if (RoleConstant.CUSTOMER.equals(role)) {
                    url = CUSTOMER_PAGE;
                } else {
                    request.setAttribute("message", "Role is not support");
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
