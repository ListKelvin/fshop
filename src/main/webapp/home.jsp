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
    if (user != null) {
        request.setAttribute("user", user);
    }

    ProductUtils pu = new ProductUtils();
    List<ProductInfo> products = pu.getAllProduct();
    request.setAttribute("products", products);

    ArrayList<CartInfo> carts = (ArrayList<CartInfo>) session.getAttribute("cart-list");
    if (carts != null) {
        request.setAttribute("carts", carts);
    }

%> 

<c:import url="page/Header.jsp"><c:param name="title" value="Home Page"/></c:import>
    <link rel="stylesheet" href="style/index.css"/>

    <h1>Hello ${user.name}</h1>       
    <section class="container d-flex align-items-center justify-content-center">
        <div class="w-100 bgProduct p-5 h-100">
            <div class="wrapper">
                <div class=" row align-items-center justify-content-center gap-3">
                <c:forEach items="${products}" var="products">
                <tag:product_card className="col-md-4" category="${products.categoryName}" productName="${products.title}" img="./assest/linn.jpg" price="${products.price}"/>
                </c:forEach>
            </div>
        </div>
    </div>

</section>

<c:import url="page/Footer.jsp"></c:import>