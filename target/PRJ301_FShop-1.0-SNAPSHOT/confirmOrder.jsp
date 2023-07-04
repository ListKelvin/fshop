<%@page import="DTO.CartInfo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Utils.ProductUtils"%>
<%@page import="DTO.ProductInfo"%>
<%@page import="DTO.AccountInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags/"%>



<c:import url="page/Header.jsp"><c:param name="title" value="Confirm Order"/></c:import>

    <section class="container p-5   minHeithStyled">
        <div class="row g-4">
            <div class=" col-12 col-lg-7 p-4">

                <div class="box " style="min-height: 75vh;">
                    <h1 class="text-center" style="color: #BC6EEE;">Order Item</h1>
                    <div class="productList">
                    <tag:order_item price="test" quantity="10"  productName="minh pham" srcImg="./assest/E-commerce_1.png"/>

                </div>

            </div>
        </div>

        <div class="col-12 col-lg-5 p-4">

            <div class="box checkOutBox">
                <h1 class="text-center" style="color: #BC6EEE;">Order Summary</h1>
                <h2>Information</h2>
                <hr class="mt-0"/>
                <div class="p-2 ">
                    <div class="fw-semibold fs-5">Name:</div>
                    <div class="fw-light">Nguyễn Gia Lin</div>
                    <div class="fw-semibold fs-5">Phone:</div>
                    <div class="fw-light">0348485167</div>
                    <div class="fw-semibold fs-5">From:</div>
                    <div class="fw-light">K3/81c BienHoa Dông nai  dK3/81c BienHoa Dông nai K3/81c BienHoa Dông nai </div>

                    <div class="fw-semibold fs-5">To:</div>
                    <div class="fw-light">C2/27, KP10, P.Tân Phong, BH-ĐN</div>


                </div>
                <hr/>
                <div class="p-3">
                    
                    <div class=" d-flex align-items-center justify-content-between fw-light">Amount Product <span>1000</span></div>

                    <div class=" d-flex align-items-center justify-content-between fw-semibold  fs-5">Total: <span>1000</span></div>

                </div>
     
                <div class="d-flex align-items-center justify-content-around gap-3">
                    <button type="button" class=" btnCancelConfirmOrder">Cancel</button>
                    <button type="button" class=" btnPlaceOrder">Checkout</button>

                </div>

            </div>


        </div>

    </div>



</section>
<c:import url="page/Footer.jsp"></c:import>