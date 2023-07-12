package Controller;

import DTO.AccountInfo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "404.jsp";

//ACTION
    private static final String LOGIN = "Login";
    /*1*/ private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGIN_GG = "GoogleLogin";
    /*2*/ private static final String LOGIN_GG_CONTROLLER = "GoogleLoginController";
    private static final String LOGIN_FB = "FaceBook";
    /*3*/ private static final String LOGIN_FB_CONTROLLER = "FaceBookController";
    private static final String REGISTER = "Register";
    /*4*/ private static final String REGISTER_CONTROLLER = "RegisterController";
    private static final String LOGOUT = "Logout";
    /*5*/ private static final String LOGOUT_CONTROLLER = "LogoutController";
//view
    private static final String VIEW_CART = "ViewCart";
    /*6*/ private static final String VIEW_CART_CONTROLLER = "ViewCartController";
    private static final String VIEW_USER_INFO = "ViewUserInfo";
    /*7*/ private static final String VIEW_USER_INFO_CONTROLLER = "ViewUserInfoController";
    private static final String VIEW_PRODUCT = "ViewProduct";
    /*7*/ private static final String VIEW_PRODUCT_CONTROLLER = "ViewProductController";
    private static final String VIEW_ORDER_HISTORY = "ViewOrderHistory";
    /*8*/ private static final String VIEW_ORDER_HISTORY_CONTROLLER = "ViewOrderHistoryController";
    private static final String VIEW_ORDER = "ViewOrder";
    /*9*/ private static final String VIEW_ORDER_CONTROLLER = "ViewOrderController";
    private static final String PRODUCT_BY_CATEGORY = "ProductByCategory";
    /*10*/ private static final String PRODUCT_BY_CATEGORY_CONTROLLER = "ProductByCategoryController";
    private static final String GET_ORDER_BY_STATUS = "GetOrderByStatus";
    /*11*/ private static final String GET_ORDER_BY_STATUS_CONTROLLER = "GetOrderByStatusController";
    private static final String VIEW_ALL_ORDERS = "ViewAllOrders";
    /*12*/ private static final String VIEW_ALL_ORDERS_CONTROLLER = "ViewAllOrdersController";
    private static final String VIEW_SHOP_ANALYSIS = "ViewShopAnalysis";
    /*13*/ private static final String VIEW_SHOP_ANALYSIS_CONTROLLER = "ViewShopAnalysisController";
    private static final String VIEW_ALL_PRODUCTS = "ViewAllProducts";
    /*14*/ private static final String VIEW_ALL_PRODUCTS_CONTROLLER = "ViewAllProductsController";
//    UPDATE
    private static final String UPDATE_PRODUCT = "UpdateProduct";
    /*15*/ private static final String UPDATE_PRODUCT_CONTROLLER = "UpdateProductController";
    private static final String UPDATE_CATEGORY = "UpdateCategory";
    /*16*/ private static final String UPDATE_CATEGORY_CONTROLLER = "UpdateCategoryController";
    private static final String UPDATE_CART = "UpdateCart";
    /*17*/ private static final String UPDATE_CART_CONTROLLER = "UpdateCartController";
    private static final String UPDATE_USERINFO = "UpdateUserInfo";
    /*18*/ private static final String UPDATE_USERINFO_CONTROLLER = "UpdateUserInfoController";
    private static final String UPDATE_ORDER_STATUS = "UpdateOrder";
    /*19*/ private static final String UPDATE_ORDER_STATUS_CONTROLLER = "UpdateOrderController";
//  CREATE
    private static final String CREATE_ORDER = "CreateOrder";
    /*20*/ private static final String CREATE_ORDER_CONTROLLER = "CreateOrderController";
    private static final String CREATE_PRODUCT = "CreateProduct";
    /*21*/ private static final String CREATE_PRODUCT_CONTROLLER = "CreateProductController";
    private static final String ADD_CATEGORY = "AddCategory";
    /*22*/ private static final String ADD_CATEGORY_CONTROLLER = "AddCategoryController";
    private static final String SEARCH_PRODUCT = "SearchProduct";
    /*23*/ private static final String SEARCH_PRODUCT_CONTROLLER = "SearchProductController";
    private static final String ADD_TO_CART = "Add To Cart";
    /*24*/ private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
//DELETE
    private static final String REMOVE_CART = "RemoveCart";
    /*25*/ private static final String REMOVE_CART_CONTROLLER = "RemoveCartController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            log("check run");
            String action = request.getParameter("action");

            log(action);

            if (null != action) {
                switch (action) {

                    case LOGIN:
                        url = LOGIN_CONTROLLER;
                        break;
                    case LOGIN_GG:
                        url = LOGIN_GG_CONTROLLER;
                        break;
                    case LOGIN_FB:
                        url = LOGIN_FB_CONTROLLER;
                        break;
                    case REGISTER:
                        url = REGISTER_CONTROLLER;
                        break;
                    case LOGOUT:
                        url = LOGOUT_CONTROLLER;
                        break;
                    case VIEW_CART:
                        url = VIEW_CART_CONTROLLER;
                        break;
                    case VIEW_ORDER_HISTORY:
                        url = VIEW_ORDER_HISTORY_CONTROLLER;
                        break;
                    case VIEW_ORDER:
                        url = VIEW_ORDER_CONTROLLER;
                        break;
                    case VIEW_ALL_ORDERS:
                        url = VIEW_ALL_ORDERS_CONTROLLER;
                        break;
                    case VIEW_USER_INFO:
                        url = VIEW_USER_INFO_CONTROLLER;
                        break;
                    case VIEW_PRODUCT:
                        url = VIEW_PRODUCT_CONTROLLER;
                        break;
                    case VIEW_SHOP_ANALYSIS:
                        url = VIEW_SHOP_ANALYSIS_CONTROLLER;
                        break;
                    case VIEW_ALL_PRODUCTS:
                        url = VIEW_ALL_PRODUCTS_CONTROLLER;
                        break;
                    case UPDATE_PRODUCT:
                        url = UPDATE_PRODUCT_CONTROLLER;
                        break;
                    case UPDATE_ORDER_STATUS:
                        url = UPDATE_ORDER_STATUS_CONTROLLER;
                        break;
                    case UPDATE_CATEGORY:
                        url = UPDATE_CATEGORY_CONTROLLER;
                        break;
                    case CREATE_PRODUCT:
                        url = CREATE_PRODUCT_CONTROLLER;
                        break;
                    case CREATE_ORDER:
                        url = CREATE_ORDER_CONTROLLER;
                        break;
                    case ADD_CATEGORY:
                        url = ADD_CATEGORY_CONTROLLER;
                        break;
                    case SEARCH_PRODUCT:
                        url = SEARCH_PRODUCT_CONTROLLER;
                        break;
                    case PRODUCT_BY_CATEGORY:
                        url = PRODUCT_BY_CATEGORY_CONTROLLER;
                        break;
                    case GET_ORDER_BY_STATUS:
                        url = GET_ORDER_BY_STATUS_CONTROLLER;
                        break;
                    case ADD_TO_CART:
                        url = ADD_TO_CART_CONTROLLER;
                        break;
                    case UPDATE_CART:
                        url = UPDATE_CART_CONTROLLER;
                        break;
                    case REMOVE_CART:
                        url = REMOVE_CART_CONTROLLER;
                        break;
                    case UPDATE_USERINFO:
                        url = UPDATE_USERINFO_CONTROLLER;
                        break;
                    default:
                        break;
                }
            }
        } catch (Exception e) {
            log("Error at MainController " + e.toString());
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
