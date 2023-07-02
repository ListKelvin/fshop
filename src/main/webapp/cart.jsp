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
    UserInfo userinfo = null;
    if (user == null) {
        request.setAttribute("message", "Unauthentication!!");
        response.sendRedirect("index.jsp");
    } else {
        userinfo = UserUtils.getUser(user.getId());
        if (userinfo != null) {
            CartUtils cartUtils = new CartUtils();
            List<CartInfo> cartItems = cartUtils.getCartProduct(userinfo.getId());
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("userinfo", userinfo);
            float total = ProductUtils.getTotalCartPrice(cartItems);
            request.setAttribute("total", total);
        } else {
            request.setAttribute("message", "sth wrong at user info!!");
            response.sendRedirect("home.jsp");
        }

    }


%> 


<c:import url="page/Header.jsp"><c:param name="title" value="Home Page"/></c:import>

    <section class="container p-5   minHeithStyled">
        <div class="row g-4">
            <div class=" col-12 col-lg-8">

                <div class="box " style="min-height: 75vh;">
                    <h1 class="text-center" style="color: #BC6EEE;">Cart Item</h1>
                    <p>${requestScope.message}</p>
                    <div class="productList">
                    <c:forEach items="${cartItems}" var="cartItems">
                        <tag:cart_item id="${cartItems.cartId}" category="${cartItems.categoryName}" price="${cartItems.price}" productName="${cartItems.title}" quantity="${cartItems.cartQuantity}" srcImg="./assest/linn.jpg"/>
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
                <!--                <button type="button" class=" btnPlaceOrder">Place Order</button>-->
                <form action="CreateOrder" method="POST">
<!--                    <input type=hidden name="cartid" value="${id}">-->
                    <input class=" btnPlaceOrder" value="Place Order" type="Submit">
                </form>
            </div>


        </div>

    </div>



</section>

<!--<script type="text/javascript">

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


</script>-->
<c:import url="page/Footer.jsp"></c:import>