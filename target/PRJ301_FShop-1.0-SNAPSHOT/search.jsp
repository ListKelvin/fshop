<%-- 
    Document   : search
    Created on : Jun 15, 2023, 2:20:43 PM
    Author     : 03lin
--%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags/"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.CartInfo"%>
<%@page import="java.util.List"%>
<%@page import="DTO.ProductInfo"%>
<%@page import="Utils.ProductUtils"%>
<%@page import="DTO.AccountInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    AccountInfo user = (AccountInfo) request.getSession().getAttribute("user");
    if (user != null) {
        request.setAttribute("user", user);
    }

    List<ProductInfo> products = (List<ProductInfo>) request.getAttribute("search-products");
    request.setAttribute("products", products);
//    String search = (String) request.getAttribute("search");
//    ProductUtils pu = new ProductUtils();
//    List<ProductInfo> products = pu.searchProduct(search);
//    request.setAttribute("products", products);

    ArrayList<CartInfo> carts = (ArrayList<CartInfo>) session.getAttribute("cart-list");
    if (carts != null) {
        request.setAttribute("carts", carts);
    }

%> 

<c:import url="page/Header.jsp"><c:param name="title" value="Search Page"/></c:import>

    <section class="container d-flex align-items-center justify-content-center flex-column mt-5 ">


        <!--Product suggestion section-->
        <div class="w-100 bgProduct h-100 mb-3">

            <div class="wrapper px-2">

                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 gap-3 p-5 justify-content-center">
                <c:forEach items="${products}" var="products">
                    <tag:product_card className="col-md-4" id= "${products.id}" category="${products.categoryName}" productName="${products.title}" img="./assest/linn.jpg" price="${products.price}"/>
                </c:forEach>

            </div>


            <nav aria-label="Page navigation" class="p-2">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>

                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

</section>

<c:import url="page/Footer.jsp"></c:import>
