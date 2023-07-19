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

            <div class="productName mb-3"  >${product.title}</div>
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
                </div>
            
            
            </div>
            <div class="col-md-5 m-auto p-5"> 
                <div class="box">
                    <span class="productName ">${product.title}</span>
                    <span class="productName price">${product.price}</span>
                    <div class="p-4">
                        <div class="fs-4 fw-semibold">Quantity: <span class="fw-light" style="color:#BC6EEE"> ${product.quantity}</span></div>
                        <div class="fs-4 fw-semibold">Sold: <span class="fw-light" style="color:#BC6EEE">${product.sold}</span></div>
                        <div class=" fs-4 fw-semibold">Category:  <span class="fw-light" style="color:#BC6EEE">${product.categoryName}</span></div>
                    </div>
                    <!--seperator-->
                    <div class="fakeData p-4">
                        <div class="fs-4 fw-semibold"> Payment: <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#BC6EEE" class="bi bi-wallet" viewBox="0 0 16 16">
                            <path d="M0 3a2 2 0 0 1 2-2h13.5a.5.5 0 0 1 0 1H15v2a1 1 0 0 1 1 1v8.5a1.5 1.5 0 0 1-1.5 1.5h-12A2.5 2.5 0 0 1 0 12.5V3zm1 1.732V12.5A1.5 1.5 0 0 0 2.5 14h12a.5.5 0 0 0 .5-.5V5H2a1.99 1.99 0 0 1-1-.268zM1 3a1 1 0 0 0 1 1h12V2H2a1 1 0 0 0-1 1z"/>
                            </svg></div>
                        <div class="fs-4 fw-semibold"> Delivery:  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#BC6EEE" class="bi bi-truck" viewBox="0 0 16 16">
                            <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5v-7zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456zM12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                            </svg></div>
                    </div>


                    <!--seperator-->
                    <c:if test="${userInfo == null}">

                        <span class="p-4 d-flex align-items-center justify-content-center gap-3 text-danger">

                            Please Login/register to shopping
                        </span>
                    </c:if>

                    <c:if test="${userInfo != null}">

                        <div class=" p-4 d-flex align-items-center justify-content-center gap-3">
                            <div class="px-2 ${disabled}">
                                <!--    <button>Add to cart or ICOn</button>-->
                                <form action="MainController" method="POST">
                                    <input type=hidden name="id" value="${product.id}">
                                    <input class="btnCancelConfirmOrder " value="Add To Cart" name="action" type="Submit" style="font-size: 17px">
                                </form>
                            </div>
<!--                            <button type="button" onClick="window.location.href = '${pageContext.request.contextPath}/MainController?action=ViewAllProducts&active=1'" class=" btnCancelConfirmOrder  " style="font-size: 17px" >Add to Cart</button>-->
                            <button type="button" class="btnPlaceOrder  " data-bs-toggle="modal" data-bs-target="#exampleModal" style="font-size: 17px" >Buy Now</button>
                        </div>
                    </c:if>




                </div>

            </div>


        </div>

        <div class="row">
            <div class="col-12 p-4">
                <span class="productName">Description</span>
                <div class="lh-base">
                    ${product.description}

                </div>
            </div>
            <div class="col-12 mt-5"> 
                <span class="productName">Other products</span>
                <div class=" row row-cols-1 row-cols-sm-2 row-cols-md-3 gap-4 p-5 justify-content-center">


                    <c:forEach items="${requestScope.best_seller}" var="product" varStatus="counter">

                        <tag:product_card className="col-md-4" disabled="${requestScope.user == null ?'disabled': ''}" id="product-${counter.count}" idProduct="${product.id}" category="${product.categoryName}" productName="${product.title}" img="images/${product.image}" price="${product.price}"/>

                    </c:forEach>

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
