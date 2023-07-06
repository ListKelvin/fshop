/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.AccountInfo;
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
@WebServlet("/Facebook")
public class FacebookController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        try {
            String code = request.getParameter("code");
            String redirectPage = null;
            APIWrapper wrapper = new APIWrapper();
            String accessToken = wrapper.getAccessToken(code);
            wrapper.setAccessToken(accessToken);

            AccountInfo accountInfo = wrapper.getAccountInfo();
            AccountInfo loginAccount = DBUtils.login(accountInfo.getFacebookID().trim());
            System.out.println("the id1: " + loginAccount.getId());
            if (loginAccount == null) {
                boolean register = DBUtils.registerByFB(accountInfo.getName(), accountInfo.getFacebookID().trim(), accountInfo.getLink());
                System.out.println("the id2: " + loginAccount.getId());
                if (register) {
                    UserUtils.createUser(loginAccount.getId());
                    HttpSession session = request.getSession();
                    session.setAttribute("user", loginAccount);
                    System.out.println("the id3: " + loginAccount.getId());
                    redirectPage = "MainController?action=SearchProduct&searchTxt=";
                } else {
                    request.setAttribute("mess", "register account fail");
                    redirectPage = "index.jsp";
                }

            } else {
                HttpSession session = request.getSession();
                session.setAttribute("user", loginAccount);
                System.out.println("the id4: " + loginAccount.getId());
                redirectPage = "MainController?action=SearchProduct&searchTxt=";
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
