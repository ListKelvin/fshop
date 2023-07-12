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
import java.util.List;
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
@WebServlet(name = "UpdateProduct", urlPatterns = {"/UpdateProductController"})
public class UpdateProductController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String ERROR_CREATE_PRODUCT = "MainController?action=UpdateProduct&update=0";
    private static final String SHOP_PRODUCT_PAGE = "MainController?action=ViewAllProducts&active=1";
    private static final String UPDATE_PRODUCT_PAGE = "update-product.jsp";

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
        String url = ERROR;

        try {
            int update = Integer.parseInt(request.getParameter("update"));
            int id = Integer.parseInt(request.getParameter("id"));

            switch (update) {
                case 0:
//                    ProductUtils productDAO = new ProductUtils();
                    ProductInfo product = ProductUtils.getSingleProduct(id);
                    request.setAttribute("product", product);
                    url = UPDATE_PRODUCT_PAGE;
                    break;
                case 1:
                    String title = "";
                    String description = "";
                    String category = "";
                    String priceStr = "";
                    String quantityStr = "";
                    String image = "";
                    float price = 0;
                    int quantity = 0;
                    String status = "";
                    String sold_out = "false";
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
                                    case "status":
                                        status = fieldValue;
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

                    if (status.equals("sold out")) {
                        sold_out = "true";
                    } else {
                        sold_out = "false";
                    }

                    if (!Validation.readNonBlank(title)) {
                        request.setAttribute("message", "title is required");
                        url = ERROR_CREATE_PRODUCT + "&id=" + id;
                    } else if (CategoryUtils.checkCategory(category) == null) {
                        request.setAttribute("message", "category not exist");
                        url = ERROR_CREATE_PRODUCT + "&id=" + id;
                    } else if (!Validation.readInteger(quantity)) {
                        request.setAttribute("message", "quantity must be a number greater than 0");
                        url = ERROR_CREATE_PRODUCT + "&id=" + id;
                    } else if (!Validation.readFloat(priceStr)) {
                        request.setAttribute("message", "price must be number");
                        url = ERROR_CREATE_PRODUCT + "&id=" + id;
                    } else if (!Validation.readNonBlank(image)) {
                        request.setAttribute("message", "Image is required");
                        url = ERROR_CREATE_PRODUCT + "&id=" + id;
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
                            url = SHOP_PRODUCT_PAGE;
                        } else {
                            request.setAttribute("message", "Update Product fail");
                            url = ERROR;
                        }
                    }
                    break;
                default:
                    request.setAttribute("message", "Update Product fail");
                    url = SHOP_PRODUCT_PAGE;
                    break;
            }

        } catch (Exception e) {
            log("Error at Update Product Controller: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
//            response.sendRedirect(url);

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
