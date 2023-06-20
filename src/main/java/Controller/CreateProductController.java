/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.ProductInfo;
import Utils.CategoryUtils;
import Utils.ProductUtils;
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
@WebServlet(name = "CreateProduct", urlPatterns = {"/CreateProduct"})
public class CreateProductController extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        String redirectPage = null;

        PrintWriter out = response.getWriter();
        ProductUtils pu = new ProductUtils();
        CategoryUtils ca = new CategoryUtils();
        Validation va = new Validation();
        try {

            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String category = request.getParameter("category");
            String priceStr = request.getParameter("priceStr");
            String quantityStr = request.getParameter("quantityStr");
            String image = request.getParameter("image");
            float price = 0;
            int quantity = 0;
            try {
                price = Float.parseFloat(priceStr);
                quantity = Integer.parseInt(quantityStr);

            } catch (Exception e) {
                // TODO: handle exception
            }
            if (!va.readNonBlank(title)) {
                request.setAttribute("message", "Title is required");
                redirectPage = "create-product.jsp";
            } else if (ca.checkCategory(category) == null) {
                request.setAttribute("message", "category not exist");
                redirectPage = "create-product.jsp";
            } else if (!va.readInteger(quantity)) {
                request.setAttribute("message", "quantity must be a number greater than 0");
                redirectPage = "create-product.jsp";
            } else if (!va.readFloat(priceStr)) {
                request.setAttribute("message", "price must be number");
                redirectPage = "create-product.jsp";
            } else {
                try {
                    boolean result = false;
                    ProductInfo newProduct = new ProductInfo();
                    newProduct.setTitle(title);
                    newProduct.setDescription(description);
                    newProduct.setCategoryName(category);
                    newProduct.setPrice(price);
                    newProduct.setQuantity(quantity);
                    newProduct.setImage(image);
                    result = pu.insertProduct(newProduct);
                    if (result) {
                        request.setAttribute("message", "Create Product successfull");
                        redirectPage = "admin-home.jsp";
                    } else {
                        request.setAttribute("message", "Create Product fail");
                        redirectPage = "create-product.jsp";
                    }
                } catch (Exception e) {
                }
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
