/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.AccountInfo;
import Utils.DBUtils;
import Utils.UserUtils;
import Utils.Validation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Minh
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    private static final String ERROR_REGISTER = "register.jsp";
    private static final String ERROR = "error.jsp";
    private static final String LOGIN_PAGE = "login.jsp";

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
        String url = ERROR_REGISTER;

        String username = request.getParameter("txtUser");
        String password = request.getParameter("txtPass");
        String email = request.getParameter("txtEmail");

        try {
            if (!Validation.readNonBlank(username)) {
                request.setAttribute("messageUserName", "User Name is required");
                System.out.println("User Name is required");
                url = ERROR_REGISTER;
            } else if (!Validation.readEmail(email)) {
                request.setAttribute("messageEmail", "Email is require");
                System.out.println("Email is require");
                url = ERROR_REGISTER;

            } else if (!Validation.readPassword(password)) {
                request.setAttribute("messagePassword", "Password is required at least 8 character with at least one uppercase, "
                        + "one lowercase, one number and one specific character");
                System.out.println("messagePassword");
                url = ERROR_REGISTER;
            } else {
                AccountInfo a = DBUtils.checkEmail(email);
                if (a != null) {
                    request.setAttribute("message", "Email already exist");
                    url = ERROR_REGISTER;
                } else {
                    DBUtils.register(username, password, email);
                    AccountInfo accountInfo = DBUtils.login(email, password);
                    if (accountInfo != null) {
                        UserUtils.createUser(accountInfo.getId());
                        request.setAttribute("message", "Register successfull");
                        url = LOGIN_PAGE;
                    } else {
                        url = ERROR;
                    }

                }
            }
        } catch (Exception e) {
            log("Exception at RegisterController: " + e.getMessage());
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
