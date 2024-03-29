/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.OrderInfo;
import DTO.OrderProductInfo;
import Utils.OrderProductUtils;
import Utils.OrderUtils;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 03lin
 */
@WebServlet(name = "ExportPDFServlet", urlPatterns = {"/ExportPDF"})
public class ExportPDFController extends HttpServlet {

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

        response.setContentType("application/pdf");

        response.setHeader(
                "Content-disposition",
                "inline; filename=ExportOrder.pdf");

        int orderId = Integer.parseInt(request.getParameter("id"));
        OrderInfo order = OrderUtils.ViewOrdersDetail(orderId);
        List<OrderProductInfo> orderProduct = OrderProductUtils.viewOrderProduct(orderId);

        try {

            Document document = new Document();

            PdfWriter.getInstance(
                    document, response.getOutputStream());

            document.open();

            document.add(new Paragraph("***************************ORDER INFORMATION***************************"));
            document.add(new Paragraph(
                    "Order ID: " + order.getOrderNumber() + ".\n"
                    + "Address: " + order.getAddress() + ".\n"
                    + "Delivery: " + order.getDelivery() + ".\n"
                    + "Payment: " + order.getPayment() + ".\n"
                    + "Total Bill: " + order.getTotalBill() + ".\n"
                    + "Order create at: " + order.getCreateAt() + ".\n" + "\n"
            ));
            document.add(new Paragraph("***************************ORDER PRODUCT***************************"));
            for (OrderProductInfo op : orderProduct) {
                document.add(new Paragraph(
                        "Product Name: " + op.getTitle() + ".\n"
                        + "Product Category: " + op.getCategoryName() + ".\n"
                        + "Order Quantity: " + op.getQuantity() + ".\n"
                        + "Subtotal: " + op.getTotal() + ".\n"
                        + "---------------------------------------------------------------------------------\n"
                ));
            }

            document.close();
        } catch (DocumentException de) {
            throw new IOException(de.getMessage());
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
