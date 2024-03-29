package Controller;

import DTO.OrderInfo;
import Utils.OrderUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ViewAllOrders", urlPatterns = {"/ViewAllOrdersController"})
public class ViewAllOrdersController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String ERROR_AUTHEN = "403.jsp";
    private static final String SHOP_ORDER_PAGE = "shop-order.jsp";

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
            String status = request.getParameter("status");

            if (status.equals("checking") || status.equals("preparing") || status.equals("delivering") || status.equals("done") || status.equals("cancel")) {
                List<OrderInfo> orderList = OrderUtils.getALLOrdersByStatus(status);
                request.setAttribute("orders", orderList);
                url = SHOP_ORDER_PAGE;
            } else if (status.equals("all")) {
                List<OrderInfo> orderList = OrderUtils.getALLOrders();
                request.setAttribute("orders", orderList);

                url = SHOP_ORDER_PAGE;

            }

        } catch (Exception ex) {
            request.setAttribute("message", "status is not valid");
            log("Error in ViewAllOrdersByStatus: " + ex.getMessage());
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
