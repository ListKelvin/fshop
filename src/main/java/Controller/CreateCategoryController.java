/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.CartInfo;
import DTO.CategoryInfo;
import Utils.CategoryUtils;
import Utils.Validation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 03lin
 */
@WebServlet(name = "CreateCategory", urlPatterns = {"/CreateCategory"})
public class CreateCategoryController extends HttpServlet {

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
        CategoryUtils ca = new CategoryUtils();
        Validation va = new Validation();
        try (PrintWriter out = response.getWriter()) {
            String redirectPage = "create-category.jsp";
            String categoryName = request.getParameter("category");
            if (ca.checkCategory(categoryName.toLowerCase()) == null) {
                boolean result = false;
                CategoryInfo newCategory = new CartInfo();
                newCategory.setCategoryName(categoryName);
                result = ca.insertCategory(categoryName.toLowerCase());
                if (result) {
                    request.setAttribute("message", "create category successfully");
                    redirectPage = "admin-home.jsp";
                } else {
                    request.setAttribute("message", "create category fail");
                    redirectPage = "create-category.jsp";
                }

            } else {
                request.setAttribute("message", "category already exist");
                redirectPage = "create-category.jsp";
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
