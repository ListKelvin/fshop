
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags/"%>

<c:import url="page/Header.jsp"><c:param name="title" value="View Order"/></c:import>
<c:set var="orderDetails" value="${requestScope.orderDetails}"/>
<c:set var="orderProducts" value="${requestScope.orderProducts}"/>

<section class="container p-5 minHeithStyled">

    <div class="breadcrumbWrapper">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb m-0">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/MainController?action=ViewOrderHistory&userId=${sessionScope.user.id}">Order-list</a></li>
                <li class="breadcrumb-item active" aria-current="page">Order - ${orderDetails.orderNumber}</li>
            </ol>
        </nav>

    </div>
<!--    <div class="px-3 my-3 fs-4">Đơn hàng của bạn đã hoàn tất. Cảm ơn bạn đã mua sắm tại F-Shop</div>-->
    <div class="row g-4">
        <div class="col-12 col-lg-7 p-5">
            <div class="box " >
                <h3 class="" style="color: #BC6EEE;">Order Information</h3>
                <p>${requestScope.message}</p>
                <div class="productList">
     
                    <c:forEach items="${orderProducts}" var="product">
                        <tag:order_item    price="${product.total}" productName="${product.title}" quantity="${product.quantity}" srcImg="${product.image}"/>
                    </c:forEach>


                </div>
                <div>
                    <div class="fw-semibold fs-5">Note:</div>
                    <div class="fw-lighter">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>
                </div>
                <hr/>
                <div class="fs-5">Phương thức thanh toán: ${orderDetails.payment}</div>
                <hr/>
                <div class=" d-flex align-items-center justify-content-between fw-semibold  fs-5">Total: <span style="color: #BC6EEE;">${orderDetails.totalBill}</span></div>
            </div>
            <div class="d-flex align-items-center justify-content-around mt-5">
                <button type="button" class=" btnCancelConfirmOrder" style="max-width: 120px;">Cancel</button>
            </div>

        </div>


        <div class="col-12 col-lg-5 p-5">

            <div class="box checkOutBox">

                <div class="p-2 ">
                    <div>
                        <div class="fw-semibold fs-5">Order ID:</div>
                        <div class="fw-light">${orderDetails.orderNumber}</div>

                    </div>
                    <hr/>
                    <div>
                        <div class="fw-semibold fs-5">Address:</div>
                        <div class="fw-light">${orderDetails.address}</div>

                    </div>
                    <hr/>
                    <div>
                        <div class="fw-semibold fs-5">Delivery:</div>
                        <div class="fw-light">${orderDetails.delivery}</div>

                    </div>
                    <hr/>
                    <div>
                        <div class="fw-semibold fs-5">Order create at:</div>
                        <div class="fw-light">${orderDetails.createAt}</div>

                    </div>
                    <hr/>
                    <div>
                        <div class="fw-semibold fs-5">Time receive:</div>
                        <div class="fw-light">31/02/2024</div>

                    </div>
                    <hr/>
                    <div>
                        <div class="fw-semibold fs-5">Order Status</div>
                        <div class="fw-light" style="color: #BC6EEE;">${orderDetails.status}</div>

                    </div>

                </div>

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

                <form method="post" action="MainController">
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
                                Total price: ${total}

                            </h1>

                        </div>


                    </div>
                    <div class="modal-footer mt-5">
                        <div class="d-flex align-items-center gap-2">
                            <button type="button" class="btnCancelConfirmOrder" data-bs-dismiss="modal">No</button>
                            <button type="submit" name="action" value="CreateOrder" class="btnPlaceOrder">Yes</button>
                        </div>
                    </div>
                </form>
            </c:if>





        </div>
    </div>
</div>

<c:import url="page/Footer.jsp"></c:import>