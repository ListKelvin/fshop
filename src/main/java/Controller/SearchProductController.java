/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.CategoryInfo;
import DTO.ProductInfo;
import Utils.CategoryUtils;
import Utils.ProductUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "SearchProduct", urlPatterns = {"/SearchProductController"})
public class SearchProductController extends HttpServlet {

    private static final String ERROR_PAGE = "error.jsp";
    private static final String CUSTOMER_HOME = "customer-home.jsp";
    private static final String SEARCH = "search.jsp";

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
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            String search = request.getParameter("searchTxt");
            ProductUtils pu = new ProductUtils();
            List<ProductInfo> products;
            if (search.isEmpty()) {
                products = pu.getAllProduct();
                List<ProductInfo> bestSeller = ProductUtils.getBestSeller();
                System.out.println(bestSeller.size());
                request.setAttribute("best_seller", bestSeller);
                url = CUSTOMER_HOME;
            } else {
                products = pu.searchProduct(search);
                int numberOfProducts = products.size();
                List<CategoryInfo> categories = CategoryUtils.getAllCategory();
                request.setAttribute("numberOfProducts", numberOfProducts);
                request.setAttribute("category", "all");
                request.setAttribute("categories", categories);
                url = SEARCH;
            }
            request.setAttribute("LIST_PRODUCT", products);
        } catch (Exception e) {
            log("Error at Search Product Controller: " + e.getMessage());
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
