/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.AccountInfo;
import DTO.UserInfo;
import Utils.APIWrapper;
import Utils.DBUtils;
import Utils.UserUtils;
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
@WebServlet(name = "FaceBook", urlPatterns = {"/FaceBookController"})
public class FacebookController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String ERROR_PAGE = "error.jsp";
    private static final String ERROR_LOGIN = "index.jsp";
    private static final String CUSTOMER_PAGE = "MainController?action=SearchProduct&searchTxt=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR_PAGE;

        try {
            String code = request.getParameter("code");
            String redirectPage = null;
            APIWrapper wrapper = new APIWrapper();
            String accessToken = wrapper.getAccessToken(code);

            wrapper.setAccessToken(accessToken);

            AccountInfo accountInfo = wrapper.getAccountInfo();
            AccountInfo loginAccount = DBUtils.login(accountInfo.getFacebookID().trim());
            
            if (loginAccount == null) {
                boolean register = DBUtils.registerByFB(accountInfo.getName(), accountInfo.getFacebookID().trim(), accountInfo.getLink());
                
                if (register) {
                    UserUtils.createUser(loginAccount.getId());
                    UserInfo userInfo = UserUtils.getUser(loginAccount.getId());
                    HttpSession session = request.getSession();
                    session.setAttribute("user", loginAccount);
                    session.setAttribute("userInfo", userInfo);
                   
                    url = CUSTOMER_PAGE;
                } else {
                    request.setAttribute("mess", "register account fail");
                    url= ERROR_LOGIN;
                }

            } else {
                UserInfo userInfo = UserUtils.getUser(loginAccount.getId());
                HttpSession session = request.getSession();
                session.setAttribute("user", loginAccount);
                session.setAttribute("userInfo", userInfo);
                url = CUSTOMER_PAGE;
            }

            
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(FacebookController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(FacebookController.class.getName()).log(Level.SEVERE, null, ex);
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
