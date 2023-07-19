<%@page import="DTO.CartInfo"%>
<%@page import="java.util.List"%>
<%@page import="DTO.AccountInfo"%>
<%@page import="DTO.ProductInfo"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags/"%>

<c:import url="include/Header.jsp"><c:param name="title" value="Cart Page"/></c:import>
<c:set var="user" value="${requestScope.userinfo}"/>
<section class="container p-5 minHeithStyled">
    <div class="row g-4">
        <div class=" col-12 col-lg-8">
            <div class="box " style="min-height: 75vh;">
                <h1 class="text-center" style="color: #BC6EEE;">Cart Item</h1>
                <p>${requestScope.message}</p>
                <div class="productList">
                    <c:set var="cartItems" value="${requestScope.cartItems}"/>
                    <c:forEach items="${cartItems}" var="cartItems">
                        <tag:cart_item id="${cartItems.cartId}" category="${cartItems.categoryName}" price="${cartItems.price}" productName="${cartItems.title}" quantity="${cartItems.cartQuantity}" srcImg="${cartItems.image}"/>
                    </c:forEach>

                    <c:if test="${cartItems.size() ==0 }">
                        <div class="d-flex align-items-center justify-content-center">
                            <img src="assest/emptyCart.png" width="400" alt="empty cart"/>
                        </div>


                    </c:if>
                </div>
            </div>
        </div>

        <div class="col-12 col-lg-4">
            <div class="box checkOutBox">
                <div class="p-3 ">
                    <h1 class="text-center" style="color: #BC6EEE;">F-SHOP</h1>


                    <div class="d-flex align-items-center justify-content-between"> Phone: <span>0348485167</span></div>
                    <div class="d-flex align-items-center justify-content-between"> Address: <span>Q1, tp HCM</span></div>
              
                </div>
                <hr/>
                <div class="p-3 ">


                    <div class=" d-flex align-items-center justify-content-between">Amount in cart: <span><%                        List<CartInfo> cartItems = (List<CartInfo>) request.getAttribute("cartItems");
                        int totalIncart = 0;
                        for (CartInfo product : cartItems) {
                            totalIncart = totalIncart + product.getCartQuantity();
                        }

                        out.print(totalIncart);

                            %></span></div>

                    <div class="d-flex align-items-center justify-content-between"> Payment: <span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#BC6EEE" class="bi bi-wallet" viewBox="0 0 16 16">
                                <path d="M0 3a2 2 0 0 1 2-2h13.5a.5.5 0 0 1 0 1H15v2a1 1 0 0 1 1 1v8.5a1.5 1.5 0 0 1-1.5 1.5h-12A2.5 2.5 0 0 1 0 12.5V3zm1 1.732V12.5A1.5 1.5 0 0 0 2.5 14h12a.5.5 0 0 0 .5-.5V5H2a1.99 1.99 0 0 1-1-.268zM1 3a1 1 0 0 0 1 1h12V2H2a1 1 0 0 0-1 1z"/>
                            </svg></span></div>
                    <div class="d-flex align-items-center justify-content-between"> Delivery: <span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#BC6EEE" class="bi bi-truck" viewBox="0 0 16 16">
                                <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5v-7zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456zM12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                            </svg></span></div>
                </div>
                <hr/>
                <div class="p-3 d-flex align-items-center justify-content-between">Total: <span>${total}</span></div>
                <!--                <form action="CreateOrder" method="POST">
                                    <input type=hidden name="cartid" value="${id}">
                                    <input class="btnPlaceOrder" value="Place Order" type="Submit">
                                </form>-->
                <button  class="btnPlaceOrder ${cartItems.size() == 0 ? 'disabled':''} " data-bs-toggle="modal" data-bs-target="#exampleModal">Place Order</button>
            </div>
        </div>
    </div>
</section>

<div class="modal modal-lg fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <!--// want to center modal-dialog-centered modal-dialog-scrollable-->

    <div class="modal-dialog modal-dialog-scrollable">
        <form method="post" action="MainController" id="edit-profile" >
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5 text-center" id="exampleModalLabel" style="color: #BC6EEE;">Order Summary</h1>

                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>


                <c:if test="${ user.name == null||  user.address == null|| user.phone == null}">

                    <div class="modal-body">
                        <p class="text-danger">Please Update your information before order <br> Press this Link: <a href="${pageContext.request.contextPath}/MainController?action=ViewUserInfo&updateStatus=0">Update Information</a></p>

                    </div>

                </c:if>
                <c:if test="${ not empty user.name && not empty user.address && not empty user.phone }">


                    <div class="modal-body">

                        <div class="p-3">
                            <h2>Information</h2>
                            <hr class="mt-0"/>
                            <div class=" row ">
                                <div class="col">
                                    <div class="">
                                        <div class="fw-semibold fs-5">Name:</div>
                                        <div class="fw-light">${user.name}</div> 
                                    </div>
                                    <div class="">
                                        <div class="fw-semibold fs-5">From:</div>
                                        <div class="fw-light text-break">F-SHOP</div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="">
                                        <div class="fw-semibold fs-5">Phone:</div>
                                        <div class="fw-light">${user.phone}</div>
                                    </div>
                                    <div class="">
                                        <div class="fw-semibold fs-5">To:</div>
                                        <div class="fw-light">${user.address}</div>
                                    </div>
                                </div>
                            </div>
                            <div class=" row ">
                                <div class="col">

                                    <div class="">
                                        <label class="fw-semibold fs-5" for="delivery">Delivery</label>


                                        <select class="form-select " id="delivery" required  aria-label="Delivery" name="delivery">
                                            <option value="">Open this select delivery</option>
                                            <option value="COD">COD</option>
                                            <option value="TIKI">TIKI</option>
                                            <option value="LAZADA">Lazada</option>
                                        </select>
                                        <div class="invalid-feedback">Not Empty</div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="">
                                        <label class="fw-semibold fs-5" for="payment">Payment</label>

                                        <select class="form-select" id="payment" required aria-label="Payment" name="payment">
                                            <option value="">Open this select Payment</option>
                                            <option value="cash">Cash</option>
                                            <option value="momo">Momo</option>
                                            <option value="banking">Banking</option>

                                        </select>
                                        <div class="invalid-feedback">More example invalid feedback text</div>
                                    </div>
                                </div>

                                <div class="overflow-y-auto" style="max-height: 250px;">
                                    <table class="table mt-3 ">
                                        <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Product Name</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${cartItems}" var="cartItems" varStatus="counter">
                                                <tr>
                                                    <th scope="row">${counter.count}</th>
                                                    <td>${cartItems.title}</td>
                                                    <td>${cartItems.cartQuantity}</td>
                                                    <td>${cartItems.price * cartItems.cartQuantity}</td>
                                                </tr>

                                            </c:forEach>

                                        </tbody>
                                    </table> 
                                </div>

                            </div>
                            <h1>
                                Total price: ${total}

                            </h1>

                        </div>


                    </div>
                    <input type="hidden" name="action" value="CreateOrder" />
                    <div class="modal-footer mt-5">
                        <div class="d-flex align-items-center gap-2">
                            <button type="button" class="btnCancelConfirmOrder" data-bs-dismiss="modal">No</button>
                            <button type="Submit"  class="btnPlaceOrder">Yes</button>
                        </div>
                    </div>

                </c:if>





            </div>
        </form>

    </div>

</div>

<c:import url="include/Footer.jsp"></c:import>
<script>

    $(document).ready(function () {
        $('#edit-profile').submit(function (e) {
            let delivery = $('#delivery');
            let payment = $('#payment');

            let count = 0;
            if (delivery.val().length === 0) {

                $('#delivery').addClass("is-invalid")
                count++;
            } else {
                $('#delivery').removeClass("is-invalid")
            }
            if (payment.val().length === 0)) {
                count++;

                $('#payment').addClass("is-invalid");
            } else {
                $('#payment').removeClass("is-invalid")
            }


            if (count > 0) {
                e.preventDefault();
            }
        })
    });
</script>