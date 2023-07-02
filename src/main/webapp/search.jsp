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
<%@page import="DTO.CartInfo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Utils.ProductUtils"%>
<%@page import="DTO.ProductInfo"%>
<%@page import="DTO.AccountInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags/"%>



<c:import url="page/Header.jsp"><c:param name="title" value="Home Page"/></c:import>

    <section class="container g-4   minHeithStyled">
        <div class="row">

            <div class="col-md-3 mx-auto mt-3 mb-5 ">
                <form  role="search">
                    <div class="input-group input-group-lg ">
                        <input class="form-control border-end-0 border rounded-pill shadow" type="search" value="search" id="example-search-input">
                            <span class="input-group-append">
                                <button class="btn btn-outline-secondary bg-white border-bottom-0 border rounded-pill ms-n5 p-3" type="button">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                    </svg>
                                </button>
                            </span>
                    </div>
                </form>
            </div>
        </div>

        <h1 class="search-result-heading text-center mb-3">Chỗ hiện kế quả tìm kiếm</h1>
        <div class="search-result-description text-center"> Thanh hiện số kết quả tiềm được</div>


        <!--Thanh Filter ở đây ( chỉ render category text)-->

        <div class="mb-4 p-4">
            <nav class="nav nav-pills flex-column flex-sm-row">
                <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="#">Active</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="#">Longer nav link</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="#">Link</a>
                <a class="flex-sm-fill text-sm-center nav-link ">Disabled</a>
                <a class="flex-sm-fill text-sm-center nav-link ">Disabled</a>
                <a class="flex-sm-fill text-sm-center nav-link ">Disabled</a>
                <a class="flex-sm-fill text-sm-center nav-link ">Disabled</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="#">Longer nav link</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="#">Longer nav link</a>
            </nav>
        </div>
        
        <div> 

            chỗ render sản phẩm tìm được

        </div>

    </section>
<c:import url="page/Footer.jsp"></c:import>
