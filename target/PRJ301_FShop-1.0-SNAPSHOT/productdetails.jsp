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
<c:set value="${requestScope.userInfo}" var="userInfo"/>

<c:import url="include/Header.jsp"><c:param name="title" value="product Page"/></c:import>
    <section class="container  mt-5 minHeithStyled">
        <div class="wrapperProductInfo">

            <div class="productName d-inline-block text-truncate"  style="max-width: 250px;">${product.title}</div>
        <div class="row mb-4">
            <div class="col-md-7 d-flex justify-content-center align-items-center"> 
                <div id="carouselExample" class="carousel slide carouselStyled">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="images/${product.image}"  onError="this.onerror=null;this.src='./assest/linn.jpg';"  class="d-block w-100" style="transform: scale(1.5) translate(80px, 70px);" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="images/${product.image}"  onError="this.onerror=null;this.src='./assest/linn.jpg';" style="transform: scale(1.5) translate(-80px, 70px);"  class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="images/${product.image}" onError="this.onerror=null;this.src='./assest/linn.jpg';" style="transform: scale(1.5) translate(-80px, -70px);"  class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="images/${product.image}"  onError="this.onerror=null;this.src='./assest/linn.jpg';" style="transform: scale(1.5) translate(80px, -70px);" class="d-block w-100" alt="...">
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
            <div class="col-md-5 m-auto p-5"> 
                <div class="box">
                    <span class="productName d-inline-block text-truncate">${product.title}</span>
                    <span class="productName ">${product.price}</span>
                    <div class="p-4">
                        <div class="fs-4 fw-semibold">Quantity: <span class="fw-light"> ${product.quantity}</span></div>
                        <div class="fs-4 fw-semibold">Sold: <span class="fw-light">${product.sold}</span></div>
                        <div class=" fs-4 fw-semibold">Category:  <span class="fw-light">${product.categoryName}</span></div>
                    </div>
                    <!--seperator-->
                    <div class="fakeData p-4">
                        <div class="fs-4 fw-semibold"> Payment: ....</div>
                        <div class="fs-4 fw-semibold"> Delivery:....</div>
                    </div>


                    <!--seperator-->

                    <div class=" p-4 d-flex align-items-center justify-content-center gap-3">
                        <button type="button" class=" btnCancelConfirmOrder" style="font-size: 17px">Add to Cart</button>
                        <button type="button" class="btnPlaceOrder" data-bs-toggle="modal" data-bs-target="#exampleModal" style="font-size: 17px">Buy Now</button>
                    </div>


                </div>

            </div>


        </div>

        <div class="row">
            <div class="col-7">
                <span class="productName">Description</span>
                <div class="lh-base">
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

<div class="modal modal-lg fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <!--// want to center modal-dialog-centered modal-dialog-scrollable-->
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5 text-center" id="exampleModalLabel" style="color: #BC6EEE;">Order Summary</h1>

                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>


            <c:if test="${ userInfo.name == null||  userInfo.address == null|| userInfo.phone == null}">

                <div class="modal-body">
                    <p class="text-danger">Please Update your information before order <br> Press this Link: <a href="${pageContext.request.contextPath}/MainController?action=ViewUserInfo&updateStatus=0">Update Information</a></p>

                </div>

            </c:if>
            <c:if test="${ not empty userInfo.name && not empty userInfo.address && not empty userInfo.phone }">

                <form method="post" action="MainController" id="edit-profile">
                    <div class="modal-body">
                        <div class="p-3">
                            <h2>Information</h2>
                            <hr class="mt-0"/>
                            <div class=" row ">
                                <div class="col">
                                    <div class="">
                                        <div class="fw-semibold fs-5">Name:</div>
                                        <div class="fw-light">${userInfo.name}</div> 
                                    </div>
                                    <div class="">
                                        <div class="fw-semibold fs-5">From:</div>
                                        <div class="fw-light text-break">F-SHOP</div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="">
                                        <div class="fw-semibold fs-5">Phone:</div>
                                        <div class="fw-light">${userInfo.phone}</div>
                                    </div>
                                    <div class="">
                                        <div class="fw-semibold fs-5">To:</div>
                                        <div class="fw-light">${userInfo.address}</div>
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

                                            <tr>
                                                <th scope="row" >1</th>
                                                <td class=" text-truncate"  style="max-width: 200px;">${product.title}</td>
                                                <td>1</td>
                                                <td>${product.price}</td>
                                            </tr>


                                        </tbody>
                                    </table> 
                                </div>

                            </div>
                            <h1>
                                Total price: ${product.price}

                            </h1>

                        </div>

                        <input name="id" value="${product.id}" type="hidden"/>
                    </div>
                    <div class="modal-footer mt-5">
                        <div class="d-flex align-items-center gap-2">
                            <button type="button" class="btnCancelConfirmOrder" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" name="action" value="Buy Now" class="btnPlaceOrder">Buy</button>
                        </div>
                    </div>
                </form>
            </c:if>





        </div>
    </div>
</div>
<c:import url="include/Footer.jsp"></c:import>
