/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.AccountInfo;
import DTO.UserInfo;
import Utils.UserUtils;
import Utils.Utility;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Minh
 */
@WebServlet(name = "UpdateUserInfo", urlPatterns = {"/UpdateUserInfoController"})
public class UpdateUserInfoController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "MainController?action=SearchProduct&searchTxt=";

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

        boolean check = false;
        try {
            log("test update");
            String name = "";
            String avatar = "";
            String dob = "";
            String gender = "";
            String phone = "";
            String address = "";
            String account_id = "";
            String avtTmp = "";

            try {
                List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                
                for (FileItem item : items) {
                    if (item.isFormField()) {
                        // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString("utf-8");
                        switch (fieldName) {
                            case "accountId":
                                account_id = fieldValue;
                                break;
                            case "dobTxt":
                                dob = fieldValue;
                                break;
                            case "genderTxt":
                                gender = fieldValue;
                                break;
                            case "phoneTxt":
                                phone = fieldValue;
                                break;
                            case "nameTxt":
                                name = fieldValue;
                                break;
                            case "avtUrl":
                                avatar = fieldValue;
                                break;
                            case "avtStr":
                                avtTmp = fieldValue;
                                break;
                            case "addressTxt":
                                address = fieldValue;
                                break;
                        }
                    } else {
                        // Process form file field (input type="file").
                        String fieldName = item.getFieldName();
                        if (fieldName.equals("avtUrl")) {
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
                                avatar = realPath.substring(realPath.lastIndexOf("\\") + 1);
                            }
                        }

                    }
                }
                
                UserInfo user = new UserInfo();
                user.setName(name);
                user.setAddress(address);
                user.setAccount_id(Integer.parseInt(account_id));
                user.setPhone(phone);
                if (avatar == null || avatar.trim().equals("")) {
                    user.setAvatar(avtTmp);
                } else {

                    user.setAvatar(avatar);
                }
                user.setGender(gender);
                user.setPhone(phone);

                user.setDob(Utility.handleParseDate(dob));

                UserUtils userDAO = new UserUtils();
                check = userDAO.updateUserInfo(user);

                if (check) {
             
                    url = SUCCESS;

                } else {
                    request.setAttribute("message", "Something wrong!");

                }
            } catch (FileUploadException e) {
                log("Cannot parse multipart request." + e.getMessage());

            }
        } catch (Exception e) {
            log("Exception at Edit Profile Controller: " + e.getMessage());
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
