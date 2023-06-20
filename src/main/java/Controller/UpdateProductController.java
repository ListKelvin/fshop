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
@WebServlet(name = "UpdateProduct", urlPatterns = {"/UpdateProduct"})
public class UpdateProductController extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        Validation va = new Validation();
        CategoryUtils ca = new CategoryUtils();
        try {
            String redirectPage = "update-product.jsp";
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String category = request.getParameter("category");
            String priceStr = request.getParameter("price");
            String quantityStr = request.getParameter("quantityStr");
            String image = request.getParameter("image");
            String status = request.getParameter("status");
            float price = 0;
            int quantity = 0;
            String sold_out = "false";
            try {
                price = Float.parseFloat(priceStr);
                quantity = Integer.parseInt(quantityStr);

            } catch (Exception e) {
                // TODO: handle exception
            }
            if (status.equals("sold out")) {
                sold_out = "true";
            } else {
                sold_out = "false";
            }
            if (!va.readNonBlank(title)) {
                request.setAttribute("message", "Title is required");
                redirectPage = "update-product.jsp";
            } else if (ca.checkCategory(category) == null) {
                request.setAttribute("message", "category not exist");
                redirectPage = "update-product.jsp";
            } else if (!va.readInteger(quantity)) {
                request.setAttribute("message", "quantity must be a number greater than 0");
                redirectPage = "update-product.jsp";
            } else if (!va.readFloat(priceStr)) {
                request.setAttribute("message", "price must be number");
                redirectPage = "update-product.jsp";
            } else {
                boolean result = false;
                if (id >= 1 && title != null || id >= 1 && description != null || id >= 1 && category != null || id >= 1 && priceStr != null || id >= 1 && quantityStr != null || id >= 1 && image != null) {
                    ProductInfo updateProduct = new ProductInfo();
                    ProductUtils pu = new ProductUtils();
                    updateProduct.setId(id);
                    updateProduct.setTitle(title);
                    updateProduct.setDescription(description);
                    updateProduct.setCategoryName(category);
                    updateProduct.setPrice(price);
                    updateProduct.setQuantity(quantity);
                    updateProduct.setImage(image);
                    updateProduct.setSoldOut(sold_out);

                    result = pu.updateProduct(updateProduct);
                }
                if (result) {
                    request.setAttribute("message", "Update Product successfull");
                    redirectPage = "adminHome.jsp";
                } else {
                    request.setAttribute("message", "Update Product fail");
                    redirectPage = "update-product.jsp";
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
