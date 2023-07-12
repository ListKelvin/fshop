<%@page import="DTO.CartInfo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Utils.ProductUtils"%>
<%@page import="DTO.ProductInfo"%>
<%@page import="DTO.AccountInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags/"%>


<c:set value="${requestScope.product}" var="product"/>
<c:import url="include/Header.jsp"><c:param name="title" value="product Page"/></c:import>
    <section class="container  mt-5 minHeithStyled">
        <div class="wrapperProductInfo">
            <div class="categoryTitle">Category: ${product.categoryName}</div>
        <div class="productName">${product.title}</div>
        <div class="row mb-4">
            <div class="col-md-7 d-flex justify-content-center align-items-center">  <div id="carouselExample" class="carousel slide">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="assest/banner/Banner-1.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="assest/banner/ad50db56090205.5bec77ea750ce.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="assest/banner/banner-3.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="assest/banner/banner-4.png" class="d-block w-100" alt="...">
                        </div>
                    </div>

                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div></div>
            <div class="col-md-5 m-auto"> 
                <div class="box">
                    <span class="productName">${product.title}</span>
                    <span class="productName ">${product.price}</span>
                    <div class="p-4">
                        <div class="fs-4 fw-semibold">Quantity: <span class="fw-light"> ${product.quantity}</span></div>
                        <div class="fs-4 fw-semibold">Sold: <span class="fw-light">${product.sold}</span></div>
                    </div>
                    <!--seperator-->
                    <div class="fakeData p-4">
                        <div class="fs-4 fw-semibold"> Payment: ....</div>
                        <div class="fs-4 fw-semibold"> Delivery:....</div>
                    </div>


                    <!--seperator-->

                    <div class=" p-4 d-flex align-items-center justify-content-center gap-3">
                        <button type="button" class=" btnCancelConfirmOrder">Add to Cart</button>
                        <button type="button" class="btnPlaceOrder">Buy Now</button>
                    </div>


                </div>

            </div>


        </div>

        <div class="row">
            <div class="col-7">
                <span class="productName">Description</span>
                <div>
                    ${product.description}

                </div>
            </div>
            <div class="col-5"> 
                <span class="productName">Other products</span>
                <div class=" d-flex align-items-center flex-column justify-content-center gap-4">


                    <tag:OtherProductCard category="test" description="fdsalkjjjjjjjjjjjjjjjjjj" productName="minh pham" srcImg="./assest/E-commerce_1.png"/>
                    <tag:OtherProductCard category="test" description="fdsalkjjjjjjjjjjjjjjjjjj" productName="minh pham" srcImg="./assest/E-commerce_1.png"/>
                    <tag:OtherProductCard category="test" description="fdsalkjjjjjjjjjjjjjjjjjj" productName="minh pham" srcImg="./assest/E-commerce_1.png"/>
                    <tag:OtherProductCard category="test" description="fdsalkjjjjjjjjjjjjjjjjjj" productName="minh pham" srcImg="./assest/E-commerce_1.png"/>

                </div>

            </div>


        </div>
    </div>
</section>


<c:import url="include/Footer.jsp"></c:import>
