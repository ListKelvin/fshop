/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.AccountInfo;
import DTO.UserInfo;
import Utils.DBUtils;
import Utils.GoogleSignIn;
import Utils.UserUtils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "GoogleLogin", urlPatterns = {"/GoogleLoginController"})
public class GoogleLoginController extends HttpServlet {

    private static final String ERROR_PAGE = "error.jsp";
    private static final String ERROR_LOGIN = "index.jsp";
    private static final String CUSTOMER_PAGE = "MainController?action=SearchProduct&searchTxt=&cate=";

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
            HttpSession session = request.getSession();
            /* TODO output your page here. You may use following sample code. */
            String credential = request.getParameter("credential");

            AccountInfo ggAcc = GoogleSignIn.authenticate(credential);
        
            if (ggAcc.getEmail() != null) {

                AccountInfo accDB = DBUtils.checkEmail(ggAcc.getEmail());
                if (accDB != null) {
                    UserInfo userInfo2 = UserUtils.getUser(accDB.getId());

                    session.setAttribute("userInfo", userInfo2);
                    session.setAttribute("user", accDB);
                    url = CUSTOMER_PAGE;
                } else {
                    boolean registerSuccess = DBUtils.registerByGG(ggAcc.getEmail(), ggAcc.getName().trim());
                    if (registerSuccess) {
                        UserUtils.createUser(accDB.getId());
                        UserInfo userInfo2 = UserUtils.getUser(accDB.getId());
                        session.setAttribute("userInfo", userInfo2);

                        session.setAttribute("user", accDB);
                        url = CUSTOMER_PAGE;
                    }
                }

            } else {
                request.setAttribute("message", "Something wrong with GG please try later!");
                url = ERROR_LOGIN;
            }

        } catch (Exception ex) {
            log("Error in GoogleLoginController: " + ex.getMessage());
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
