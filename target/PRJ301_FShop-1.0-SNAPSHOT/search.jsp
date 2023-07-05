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

<%
    AccountInfo user = (AccountInfo) request.getSession().getAttribute("user");
    if (user != null) {
        request.setAttribute("user", user);
    }
%> 
<c:import url="page/Header.jsp"><c:param name="title" value="Search"/></c:import>

    <section class="container g-4   minHeithStyled">
        <div class="row">

            <div class="col-md-3 mx-auto mt-3 mb-5 ">
                <form  role="search" action="MainController">
                    <div class="input-group input-group-lg ">
                        <input type="hidden" name="action" value="SearchProduct"/>
                        <input class="form-control border-end-0 border rounded-pill shadow" type="search" name="searchTxt" value="${param.searchTxt}" id="example-search-input">
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

    <h1 class="search-result-heading text-center mb-3">${param.searchTxt}</h1>
    <div class="search-result-description text-center">${requestScope.numberOfProducts} sản phẩm tìm được</div>

    <div class="mb-4 p-4">
        <nav class="nav nav-pills flex-column flex-sm-row">
            <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page"  href="#2">ALL</a> 

            <c:forEach items="${requestScope.categories}" var="category">
                <a class="flex-sm-fill text-sm-center nav-link"  href="${pageContext.request.contextPath}/MainController?action=ProductByCategory&category=${category.categoryName}&searchTxt=${param.searchTxt}">${category.categoryName}</a> 
            </c:forEach>


        </nav>
    </div>

    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 gap-3 p-5 justify-content-center"> 

        <c:forEach items="${requestScope.LIST_PRODUCT}" var="products" varStatus="counter">
            <tag:product_card className="col-md-4" idProduct="${products.id}" id="${counter.count}" category="${products.categoryName}" productName="${products.title}" img="./assest/linn.jpg" price="${products.price}"/>
        </c:forEach>

    </div>

</section>
<c:import url="page/Footer.jsp"></c:import>
<script>
    document.querySelectorAll('.nav-link').forEach(function (link) {
        link.addEventListener('click', function () {
            // Remove active class from all links
            document.querySelectorAll('.nav-link').forEach(function (link) {
                link.classList.remove('active');
            });

            // Add active class to clicked link
            this.classList.add('active');
        });
    });
</script>