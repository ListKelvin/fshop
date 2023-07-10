/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.ProductInfo;
import Utils.CategoryUtils;
import Utils.ProductUtils;
import Utils.Utility;
import Utils.Validation;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author 03lin
 */
@WebServlet(name = "CreateProduct", urlPatterns = {"/CreateProductController"})
public class CreateProductController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String ERROR_CREATE_PRODUCT = "PRJ301_FShop/create-product.jsp";
    private static final String SHOP_PRODUCT_PAGE = "MainController?action=ViewAllProducts&active=1";

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
        String url = ERROR;
        ProductUtils pu = new ProductUtils();

        try {

            String title = "";
            String description = "";
            String category = "";
            String priceStr = "";
            String quantityStr = "";
            String image = "";
            float price = 0;
            int quantity = 0;

            try {
                List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                for (FileItem item : items) {
                    if (item.isFormField()) {
                        // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString("utf-8");
                        switch (fieldName) {
                            case "title":
                                title = fieldValue;
                                break;
                            case "description":
                                description = fieldValue;
                                break;
                            case "category":
                                category = fieldValue;
                                break;
                            case "priceStr":
                                priceStr = fieldValue;
                                price = Float.parseFloat(priceStr);
                                break;
                            case "quantityStr":
                                quantityStr = fieldValue;
                                quantity = Integer.parseInt(quantityStr);

                                break;
                            case "image":
                                image = fieldValue;
                                break;

                        }
                    } else {
                        // Process form file field (input type="file").
                        String fieldName = item.getFieldName();
                        if (fieldName.equals("image")) {
                            String fileName = item.getName();
                            if (!fileName.equals("")) {
                                fileName = Utility.getFileName(fileName);
                            }

                            if (!fileName.equals("") && (fileName.endsWith("png") || fileName.endsWith("bmp") || fileName.endsWith("jpg")
                                    || fileName.endsWith("PNG") || fileName.endsWith("BMP") || fileName.endsWith("JPG"))) {
                                String realPath = getServletContext().getRealPath("/") + "images\\" + fileName;
                                File saveFile = new File(realPath);
                                item.write(saveFile);
                                log(saveFile.getPath());
                                image = realPath.substring(realPath.lastIndexOf("\\") + 1);
                            }
                        }

                    }
                }
            } catch (Exception e) {
                // TODO: handle exception
            }
            if (!Validation.readNonBlank(title)) {
                request.setAttribute("message", "Title is required");
                url = ERROR_CREATE_PRODUCT;
            } else if (CategoryUtils.checkCategory(category) == null) {
                request.setAttribute("message", "category not exist");
                url = ERROR_CREATE_PRODUCT;
            } else if (!Validation.readInteger(quantity)) {
                request.setAttribute("message", "quantity must be a number greater than 0");
                url = ERROR_CREATE_PRODUCT;
            } else if (!Validation.readFloat(priceStr)) {
                request.setAttribute("message", "price must be number");
                url = ERROR_CREATE_PRODUCT;
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
                        log("true");
                        request.setAttribute("message", "Create Product successfull");
                        url = SHOP_PRODUCT_PAGE;
                    } else {
                        log("false");

                        request.setAttribute("message", "Create Product fail");
                        url = ERROR_CREATE_PRODUCT;
                    }
                } catch (Exception e) {
                }
            }

        } catch (Exception e) {
            log("Error at Create Product Controller: " + e.getMessage());
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
