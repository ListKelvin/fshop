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
    <section class="container  mt-5 mh-100">
        <div class="wrapperProductInfo">
            <div class="categoryTitle">Category: .......</div>
            <div class="productName">Áo nữ Libé Workshop</div>
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
                        <span class="productName">Áo nữ Libé Workshop</span>
                        <span class="productName ">200.000vnd</span>
                        <div class="p-3">
                            <div class="fs-6 fw-semibold">Quantity: <span class="fw-light"> 100</span></div>
                            <div class="fs-6 fw-semibold">Sold: <span class="fw-light">120</span></div>
                        </div>


                        <!--seperator-->
                        <div class="fakeData p-3">

                            <div> fake information</div>
                            <div> fake information</div>
                        </div>


                        <!--seperator-->

                        <div class=" p-3 d-flex align-items-center justify-content-center gap-3">
                            <button type="button" class="btn btn-primary w-100">Add to Cart</button>
                            <button type="button" class="btn btn-outline-primary w-100">Buy Now</button>
                        </div>


                    </div>

                </div>


            </div>
            <div class="row">
                <div class="col-7">
                    <span class="productName">Description</span>
                    <div>

                        This Gig assures you for the logo designs with minimalism and smoothness This Gig is of one of many design kinds we offer. Flat design concepts are one of our fortes. For the logo to be timeless it doesn’t need to be with complex structures or patterns. It just needs to be simple, memorable and which gives a distinctive essence to your business

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

<c:import url="page/Footer.jsp"></c:import>
