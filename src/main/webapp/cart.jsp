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

    <section class="container p-5  mt-5 ">
        <div class="row g-4">
            <div class=" col-12 col-lg-8">

                <div class="box " style="min-height: 75vh;">
                    <h1 class="text-center" style="color: #BC6EEE;">Cart Item</h1>
                    <div class="productList">
                    <tag:cart_item category="test"  productName="minh pham" srcImg="./assest/E-commerce_1.png"/>

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
                <div class="p-3 d-flex align-items-center justify-content-between">Total: <span>1000</span></div>
                <button type="button" class=" btnPlaceOrder">Place Order</button>
            </div>


        </div>

    </div>



</section>
<c:import url="page/Footer.jsp"></c:import>