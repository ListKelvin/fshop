/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.AccountInfo;
import Utils.DBUtils;
import Utils.GoogleSignIn;
import Utils.UserUtils;
import Utils.Validation;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet("/Account")
public class AccountController extends HttpServlet {

    private static final String ERROR_REGISTER = "register.jsp";
    private static final String ADMIN = "shop";
    private static final String ADMIN_PAGE = "AdminController";
    private static final String USER = "customer";
    private static final String USER_PAGE = "home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            String redirectPage = "index.jsp";
            String username = request.getParameter("txtUser");
            String password = request.getParameter("txtPass");
            String email = request.getParameter("txtEmail");
            String action = request.getParameter("btAction");

            if (action.equals("Login")) {
                AccountInfo accountInfo = DBUtils.login(email, password);

                if (accountInfo == null) {
                    request.setAttribute("message", "Wrong email or password");
                } else {
                    String role = accountInfo.getRole();
                    System.out.println("(accountController) userid:  " + accountInfo.getId());

                    HttpSession session = request.getSession();
                    session.setAttribute("user", accountInfo);

//                    if ((accountInfo.getEmail()).equals("admin123@gmail.com")) {
//                        redirectPage = "ADMIN_PAGE";
//                    }
                    if (ADMIN.equals(role)) {

                        redirectPage = ADMIN_PAGE;
                    } else if (USER.equals(role)) {

 
                        redirectPage = USER_PAGE;
                    } else {
                        request.setAttribute("ERROR", "Role is not support");
                    }

                }
            } else if (action.equals("Register")) {
                if (!Validation.readNonBlank(username)) {
                    request.setAttribute("messageUserName", "User Name is required");
                    System.out.println("User Name is required");
                    redirectPage = ERROR_REGISTER;
                } else if (!Validation.readEmail(email)) {
                    request.setAttribute("messageEmail", "Email is require");
                    System.out.println("Email is require");
                    redirectPage = ERROR_REGISTER;

                } else if (!Validation.readPassword(password)) {
                    request.setAttribute("messagePassword", "Password is required at least 8 character with at least one uppercase, "
                            + "one lowercase, one number and one specific character");
                    System.out.println("messagePassword");
                    redirectPage = ERROR_REGISTER;
                } else {
                    AccountInfo a = DBUtils.checkEmail(email);
                    if (a != null) {
                        request.setAttribute("message", "Email already exist");
                    } else {
                        DBUtils.register(username, password, email);
                        AccountInfo accountInfo = DBUtils.login(email, password);

                        UserUtils.createUser(accountInfo.getId());

                        request.setAttribute("message", "Register successfull");
                    }
                }

            } else if (action.equals("Logout")) {
                HttpSession session = request.getSession();
                session.setAttribute("user", null);
            }
            RequestDispatcher rd = request.getRequestDispatcher(redirectPage);
            rd.forward(request, response);
        } finally {
            out.close();
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
        try {
            processRequest(request, response);

        } catch (Exception ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
