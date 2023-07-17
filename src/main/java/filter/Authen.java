/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import DTO.AccountInfo;
import DTO.UserInfo;
import Utils.RoleConstant;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Minh
 */
//@WebFilter(filterName = "Authen", urlPatterns = {"/*"})
public class Authen implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    public static final String GUEST_FIRST_PAGE = "index.jsp";

    public static final String SHOP_PAGE = "MainController?action=ViewShopAnalysis&active=0";
    public static final String CUSTOMER_PAGE = "MainController?action=SearchProduct&searchTxt=";
    private ArrayList<String> shop = null;
    private ArrayList<String> customer = null;
    private ArrayList<String> guest = null;

    private static final String LOGIN_PAGE = "index.jsp";

    public Authen() {
        customer = new ArrayList<>();
        shop = new ArrayList<>();
        guest = new ArrayList<>();
        //shop

        shop.add("create-product.jsp");
        shop.add("shop-home.jsp");
        shop.add("shop-order.jsp");
        shop.add("shop-product.jsp");
        shop.add("shop-view-product.jsp");
        shop.add("shop-viewOrder.jsp");
        shop.add("update-product.jsp");

//        shop.add("Login");
        shop.add("ViewAllOrders");
        shop.add("ViewShopAnalysis");
        shop.add("UpdateProduct");
        shop.add("CreateProduct");
        shop.add("AddCategory");

        //customer
        customer.add("cart.jsp");
        customer.add("customer-home.jsp");
        customer.add("editUserProfile.jsp");
        customer.add("order-history.jsp");
        customer.add("productdetails.jsp");
        customer.add("search.jsp");
        customer.add("view-order.jsp");

        customer.add("Logout");
        customer.add("ViewCart");
        customer.add("ViewUserInfo");
        customer.add("ViewProduct");
        customer.add("ViewOrderHistory");
        customer.add("ViewOrder");
        customer.add("ProductByCategory");
        customer.add("GetOrderByStatus");
        customer.add("UpdateCart");
        customer.add("UpdateUserInfo");
        customer.add("UpdateOrder");
        customer.add("CreateOrder");
        customer.add("SearchProduct");
        customer.add("Add To Cart");
        customer.add("Buy Now");
        customer.add("RemoveCart");
        customer.add("CancelOrder");

        //guest
        guest.add("customer-home.jsp");
        guest.add("403.jsp");
        guest.add("404.jsp");
        guest.add("error.jsp");
        guest.add("index.jsp");
        guest.add("productdetails.jsp");
        guest.add("register.jsp");
        guest.add("search.jsp");
        guest.add("Login");
        guest.add("GoogleLogin");
        guest.add("FaceBook");
        guest.add("Register");
        guest.add("SearchProduct");
        guest.add("ProductByCategory");
        guest.add("ViewProduct");

//        guest.add("MainController");
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("Authen:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("Authen:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        try {
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            String uri = req.getRequestURI();
            String action = req.getParameter("action");

            int index = uri.lastIndexOf("/");
            String resource = uri.substring(index + 1);

//            log("test actiono: " + action);
            boolean checkContain = false;
            for (String value : guest) {
                if (value.equals(action) || uri.contains(value)) {
                    checkContain = true;
                    break;
                }
            }
            if (checkContain || uri.endsWith(".jpg") || uri.endsWith(".png") || uri.endsWith(".jpeg") || uri.endsWith(".js") || uri.endsWith(".css")) {
                chain.doFilter(request, response);
            } else {
                HttpSession session = req.getSession();
                if (session == null || session.getAttribute("user") == null) {
                    res.sendRedirect(LOGIN_PAGE);
                } else {
                    AccountInfo loginUser = (AccountInfo) session.getAttribute("user");
                    String role = loginUser.getRole();
                    log("check role: " + role);
                    if (RoleConstant.SHOP.equals(role) && shop.contains(action)) {
                        log("shop check");

                        chain.doFilter(request, response);
                    } else if (RoleConstant.CUSTOMER.equals(role) && customer.contains(action)) {
                        log("cusotemr check");
                        chain.doFilter(request, response);
                    } else if (guest.contains(resource)) {
                        log("guest check");

                        chain.doFilter(request, response);
                    } else {
                        res.sendRedirect(LOGIN_PAGE);
                    }
                }
            }

        } catch (IOException | ServletException e) {
            log("Exception at AuthenFilter: " + e.getMessage());
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("Authen:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("Authen()");
        }
        StringBuffer sb = new StringBuffer("Authen(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
