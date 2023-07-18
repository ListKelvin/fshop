<%@page import="DTO.AccountInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags/"%>
<%

    AccountInfo user = (AccountInfo) request.getSession().getAttribute("user");
    if (user != null) {
        request.setAttribute("user", user);
    }
%> 
<c:import url="include/Header.jsp"><c:param name="title" value="Order history"/></c:import>
    <section class="container p-5 minHeithStyled">
        <div class="breadcrumbWrapper">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/MainController?action=ViewOrderHistory">Order-list</a></li>
            </ol>
        </nav>
    </div>
    <div class="row g-4">
        <div class="col-12  p-5">
            <div class="box " >
                <h3 class="" style="color: #BC6EEE;">Order History</h3>
<!--                <p>${requestScope.message}</p>-->
                <c:if test=" not empty ${requestScope.message}">
                    <p>${requestScope.message}</p>
                </c:if>
                <c:if test="${requestScope.orders != null}">
                    <c:set var="orders" value="${requestScope.orders}"/>
                    <p>${requestScope.message}</p>
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link ${param.action == 'ViewOrderHistory' ? 'active': ''}" href="${pageContext.request.contextPath}/MainController?action=ViewOrderHistory&status=all&userId=${requestScope.user.id}">ALL</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${param.status == 'checking' ? 'active': ''}" href="${pageContext.request.contextPath}/MainController?action=GetOrderByStatus&status=checking&userId=${requestScope.user.id}">Checking</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${param.status == 'preparing' ? 'active': ''}" href="${pageContext.request.contextPath}/MainController?action=GetOrderByStatus&status=preparing&userId=${requestScope.user.id}">Preparing</a>
                        </li> 
                        <li class="nav-item">
                            <a class="nav-link ${param.status == 'delivering' ? 'active': ''}" href="${pageContext.request.contextPath}/MainController?action=GetOrderByStatus&status=delivering&userId=${requestScope.user.id}">Delivering</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${param.status == 'done' ? 'active': ''}" href="${pageContext.request.contextPath}/MainController?action=GetOrderByStatus&status=done&userId=${requestScope.user.id}">Done</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${param.status == 'cancel' ? 'active': ''}" href="${pageContext.request.contextPath}/MainController?action=GetOrderByStatus&status=cancel&userId=${requestScope.user.id}">Cancel</a>
                        </li>
                    </ul>
                    <div>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Order Number</th>
                                    <th scope="col">Delivery</th>
                                    <th scope="col">Payment</th>
                                    <th scope="col">Create At</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Total</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${orders}" varStatus="counter">
                                    <tr>
                                        <th scope="row">${counter.count}</th>
                                        <td>${order.orderNumber}</td>
                                        <td>${order.delivery}</td>
                                        <td>${order.payment}</td>
                                        <td>${order.createAt}</td>
                                        <td>${order.status}</td>
                                        <td>${order.totalBill}</td>
                                        <td><a href="${pageContext.request.contextPath}/MainController?action=ViewOrder&orderId=${order.orderId}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                                <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                                <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </c:if>
                <c:if test="${requestScope.orders.size() == 0 }">
                    <div class="d-flex align-items-center justify-content-center flex-column">
                        <img src="assest/emptyStore.png" width="400" alt="empty cart"/>
                        <p>Empty</p>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</section>
<c:import url="include/Footer.jsp"></c:import>