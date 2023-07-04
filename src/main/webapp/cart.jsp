
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags/"%>

<c:import url="page/Header.jsp"><c:param name="title" value="Cart Page"/></c:import>
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
                <!--                <form action="CreateOrder" method="POST">
                                    <input type=hidden name="cartid" value="${id}">
                                    <input class="btnPlaceOrder" value="Place Order" type="Submit">
                                </form>-->
                <a href="#minh" class="btnPlaceOrder" data-bs-toggle="modal" data-bs-target="#exampleModal" >Place Order</a>
            </div>
        </div>
    </div>
</section>

<div class="modal modal-lg fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <!--// want to center modal-dialog-centered modal-dialog-scrollable-->
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5 text-center" id="exampleModalLabel" style="color: #BC6EEE;">Order Summary</h1>

                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>


            <c:if test="${ empty user.name || empty user.address || empty user.phone }">
        
                <div class="modal-body">
                    <p class="text-danger">Please Update your information before order <br> Press this Link: <a href="${pageContext.request.contextPath}/MainController?action=ViewUserInfo&updateStatus=0">Update Information</a></p>
                    
                </div>
        
                </c:if>
                <c:if test="${ not empty user.name && not empty user.address && not empty user.phone }">

                <form >
                    <div class="modal-body">
                        <div class="p-3">
                            <h2>Information</h2>
                            <hr class="mt-0"/>
                            <div class=" row ">
                                <div class="col">
                                    <div class="">
                                        <div class="fw-semibold fs-5">Name:</div>
                                        <div class="fw-light">Nguyễn Gia Lin</div> 
                                    </div>
                                    <div class="">
                                        <div class="fw-semibold fs-5">From:</div>
                                        <div class="fw-light text-break">K3/81c BienHoa Dông nai  dK3/81c BienHoa Dông nai K3/81c BienHoa Dông nai </div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="">
                                        <div class="fw-semibold fs-5">Phone:</div>
                                        <div class="fw-light">0348485167</div>
                                    </div>
                                    <div class="">
                                        <div class="fw-semibold fs-5">To:</div>
                                        <div class="fw-light">C2/27, KP10, P.Tân Phong, BH-ĐN</div>
                                    </div>
                                </div>
                            </div>
                            <div class=" row ">
                                <div class="col">
                                    <div class="">
                                        <label class="fw-semibold fs-5" for="delivery">Delivery</label>


                                        <select class="form-select" id="delivery" aria-label="Delivery" name="delivery">
                                            <option selected>Open this select delivery</option>
                                            <option value="1">GHN</option>
                                            <option value="2">TIKI</option>
                                            <option value="3">Lazada</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="">
                                        <label class="fw-semibold fs-5" for="payment">Payment</label>

                                        <select class="form-select" id="payment" aria-label="Payment" name="payment">
                                            <option selected>Open this select Payment</option>
                                            <option value="1">Banking</option>
                                            <option value="2">COD</option>
                                            <option value="3">tien măt</option>
                                        </select>
                                    </div>
                                </div>


                                <table class="table mt-3">
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
                            <h1>
                                Total price: 

                            </h1>

                        </div>


                    </div>
                    <div class="modal-footer mt-5">
                        <div class="d-flex align-items-center gap-2">
                            <button type="button" class="btnCancelConfirmOrder" data-bs-dismiss="modal">No</button>
                            <button type="submit" class="btnPlaceOrder">Yes</button>
                        </div>
                    </div>
                </form>
            </c:if>





        </div>
    </div>
</div>

<c:import url="page/Footer.jsp"></c:import>