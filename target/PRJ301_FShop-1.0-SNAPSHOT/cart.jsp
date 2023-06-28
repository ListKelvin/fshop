<%@page import="Utils.UserUtils"%>
<%@page import="DTO.UserInfo"%>
<%@page import="Utils.CartUtils"%>
<%@page import="DTO.CartInfo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Utils.ProductUtils"%>
<%@page import="DTO.ProductInfo"%>
<%@page import="DTO.AccountInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags/"%>

<%
    AccountInfo user = (AccountInfo) request.getSession().getAttribute("user");
    UserInfo userinfo = UserUtils.getUser(user.getId());
    if (user == null) {
        request.setAttribute("message", "Unauthentication!!");
        response.sendRedirect("index.jsp");
    } else {
        request.setAttribute("userinfo", userinfo);
    }

   CartUtils cartUtils = new CartUtils();
   List<CartInfo> cartItems = cartUtils.getCartProduct(userinfo.getId());
   request.setAttribute("cartItems", cartItems);
%> 


<c:import url="page/Header.jsp"><c:param name="title" value="Home Page"/></c:import>

    <section class="container p-5  mt-5 ">
        <div class="row g-4">
            <div class=" col-12 col-lg-8">

                <div class="box " style="min-height: 75vh;">
                    <h1 class="text-center" style="color: #BC6EEE;">Cart Item</h1>
                    <div class="productList">
                    <c:forEach items="${cartItems}" var="cartItems">
                        <tag:cart_item id ="${cartItems.cartId}" category="${cartItems.categoryName}" price="${cartItems.price}" productName="${cartItems.title}" quantity="${cartItems.cartQuantity}" srcImg="./assest/linn.jpg"/>
                    </c:forEach>
                    

                </div>

            </div>
        </div>

        <div class="col-12 col-lg-4">

            <div class="box checkOutBox">
                <div class="p-3 ">
                    <div class="mb-3 d-flex align-items-center justify-content-between">Amount: <span>30</span></div>
                    <div class="d-flex align-items-center justify-content-between"> Subtotal: <span>13000VND</span></div>


                </div>
                <hr/>
                <div class="p-3 d-flex align-items-center justify-content-between">Total: <span>${total}</span></div>
                <button type="button" class=" btnPlaceOrder">Place Order</button>
            </div>


        </div>

    </div>



</section>
<c:import url="page/Footer.jsp"></c:import>