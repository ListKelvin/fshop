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

    <section class="container p-5   minHeithStyled">
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

<script type="text/javascript">

    var product_total_amt = document.getElementById('product_total_amt');
    var shipping_charge = document.getElementById('shipping_charge');
    var total_cart_amt = document.getElementById('total_cart_amt');
    var discountCode = document.getElementById('discount_code1');
    const decreaseNumber = (incdec, itemprice) => {
        var itemval = document.getElementById(incdec);
        var itemprice = document.getElementById(itemprice);
        console.log(itemprice.innerHTML);
// console.log(itemval.value);
        if (itemval.value <= 0) {
            itemval.value = 0;
            alert('Negative quantity not allowed');
        } else {
            itemval.value = parseInt(itemval.value) - 1;
            itemval.style.background = '#fff';
            itemval.style.color = '#000';
            itemprice.innerHTML = parseInt(itemprice.innerHTML) - 15;
            product_total_amt.innerHTML = parseInt(product_total_amt.innerHTML) - 15;
            total_cart_amt.innerHTML = parseInt(product_total_amt.innerHTML) + parseInt(shipping_charge.innerHTML);
        }
    };
    const increaseNumber = (incdec, itemprice) => {
        var itemval = document.getElementById(incdec);
        var itemprice = document.getElementById(itemprice);
// console.log(itemval.value);
        if (itemval.value >= 5) {
            itemval.value = 5;
            alert('max 5 allowed');
            itemval.style.background = 'red';
            itemval.style.color = '#fff';
        } else {
            itemval.value = parseInt(itemval.value) + 1;
            itemprice.innerHTML = parseInt(itemprice.innerHTML) + 15;
            product_total_amt.innerHTML = parseInt(product_total_amt.innerHTML) + 15;
            total_cart_amt.innerHTML = parseInt(product_total_amt.innerHTML) + parseInt(shipping_charge.innerHTML);
        }
    };


</script>
<c:import url="page/Footer.jsp"></c:import>