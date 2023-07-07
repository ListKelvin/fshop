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
    public static final String GUEST_FIRST_PAGE = "MainController";

    public static final String SHOP_PAGE = "MainController?action=SearchOrder&searchTxt=";
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
        shop.add("MainController");
        shop.add("LoginController");
        shop.add("LogoutController");
        shop.add("ViewUserInfoController");
        shop.add("ViewOrderHistoryController");
        shop.add("ViewOrderController");
        shop.add("ProductByCategoryController");
        shop.add("GetOrderByStatusController");
        shop.add("UpdateProductController");
        shop.add("UpdateCategoryController");
        shop.add("UpdateOrderController");
        shop.add("AddProductController");
        shop.add("AddCategoryController");
        shop.add("SearchProductController");
        shop.add("DeleteProductController");

        //??///
        shop.add("UpdateUserInfoController");
        //??///
        customer.add("MainController");

        customer.add("LoginController");
        customer.add("GoogleLoginController");
        customer.add("FaceBookController");
        customer.add("RegisterController");
        customer.add("LogoutController");
        customer.add("ViewCartController");
        customer.add("ViewUserInfoController");
        customer.add("ViewOrderHistoryController");
        customer.add("ViewOrderController");
        customer.add("ProductByCategoryController");
        customer.add("GetOrderByStatusController");
        customer.add("UpdateCartController");
        customer.add("UpdateUserInfoController");

        customer.add("UpdateOrderController");
        customer.add("CreateOrderController");
        customer.add("SearchProductController");
        customer.add("AddToCartController");

        customer.add("RemoveCartController");
        customer.add("AddToCartController");

        //guest
        guest.add("MainController");

//        guest.add("LoginController");
//        guest.add("GoogleLoginController");
//        guest.add("FaceBookController");
//        guest.add("RegisterController");
//        guest.add("LogoutController");
//        guest.add("ViewCartController");
//        guest.add("ViewUserInfoController");
//        guest.add("ViewOrderHistoryController");
//        guest.add("ViewOrderController");
//        guest.add("ProductByCategoryController");
//        guest.add("GetOrderByStatusController");
//        guest.add("UpdateCartController");
//        guest.add("UpdateUserInfoController");
//
//        guest.add("UpdateOrderController");
//        guest.add("CreateOrderController");
//        guest.add("SearchProductController");
//        guest.add("AddToCartController");
//
//        guest.add("RemoveCartController");
//        guest.add("AddToCartController");
        guest.add("");

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
            if (uri.endsWith(".jpg") || uri.endsWith(".png") || uri.endsWith(".jpeg") || uri.endsWith(".js") || uri.endsWith(".css")) {
                chain.doFilter(request, response);
            } else {
                HttpSession session = req.getSession();
                AccountInfo user = (AccountInfo) session.getAttribute("user");
                int index = uri.lastIndexOf("/");

                String resource = uri.substring(index + 1);
                log(resource);
                if (user == null) {
                    if (guest.contains(resource)) {
                        chain.doFilter(request, response);
                    } else {
                        res.sendRedirect(GUEST_FIRST_PAGE);
                    }
                } else {
                    String role = user.getRole();
                    switch (role) {
                        case RoleConstant.SHOP:
                            if (shop.contains(resource)) {
                                chain.doFilter(request, response);
                            } else {
                                res.sendRedirect(LOGIN_PAGE);
                            }
                            break;
                        case RoleConstant.CUSTOMER:
                            if (customer.contains(resource)) {
                                chain.doFilter(request, response);
                            } else {
                                res.sendRedirect(CUSTOMER_PAGE);
                            }
                            break;
                        default:
                            res.sendRedirect(GUEST_FIRST_PAGE);
                            break;
                    }
                }
            }
        } catch (Exception e) {
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
