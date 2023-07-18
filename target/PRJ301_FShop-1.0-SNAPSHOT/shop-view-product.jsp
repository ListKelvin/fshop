<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags/"%>

<c:import url="include/SideBar.jsp"><c:param name="title" value="View order"/></c:import>

    <div class="adminWrapper d-flex align-items-center justify-content-center" style="margin-left: 200px;"> 
        <div class="container ">


            <div class="row g-4">
                <div class="col-12 col-lg-7 p-5">
                    <div class="box " >
                        <h3 class="" style="color: #BC6EEE;">Order Information</h3>
                        <p>${requestScope.message}</p>
                    <div class="productList">

                        <c:forEach items="${requestScope.orderProducts}" var="product">
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
                    <a  class=" btnCancelConfirmOrder" href="${pageContext.request.contextPath}/MainController?action=ViewOrderHistory&userId=${orderDetails.userId}" style="max-width: 120px; cursor: pointer;">Cancel</a>
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

    </div>








</div>


<script src="js/bootstrap.bundle.js" crossorigin="anonymous"></script>
</body>
</html>
