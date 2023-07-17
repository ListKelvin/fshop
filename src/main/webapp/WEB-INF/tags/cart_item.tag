<%-- 
    Document   : cart_item
    Created on : Jun 27, 2023, 3:57:27 AM
    Author     : Minh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="cart item" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="srcImg"%>
<%@attribute name="id"%>
<%@attribute name="price"%>
<%@attribute name="productName"%>
<%@attribute name="category"%>
<%@attribute name="quantity"%>

<%-- any content can be specified here e.g.: --%>

<div class="cartItem d-flex align-items-center ">
    <img src="images/${srcImg}" onError="this.onerror=null;this.src='./assest/linn.jpg';" alt="${productName}"  class="productImg" style="height: 150px; width: 150px; object-fit: cover;"/>
    <div class="d-flex align-items-center justify-content-between w-100">
        <div class="w-50">
            <div class=""  >${productName}</div>        
            <div class="badge rounded-pill badgeStyle d-inline-block text-truncate" style="max-width: 70px;">${category}</div>


        </div>
        <div class="d-flex align-items-center flex-column ">

            <ul class="pagination justify-content-end set_quantity w-100">
                <li class="page-item">
                    <a class="page-link " href="${pageContext.request.contextPath}/MainController?action=UpdateCart&cartid=${id}&btnAction=dec&quantity=${quantity}"> <i class="bi bi-dash"></i> </a>
                </li>
                <li class="page-item"><input type="number" name="" class="page-link" value="${quantity}" id="textbox1" ></li>
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/MainController?action=UpdateCart&cartid=${id}&btnAction=inc&quantity=${quantity}"> <i class="bi bi-plus"></i></a>
                </li>
            </ul>


            <form action="MainController" method="POST">
                <input type=hidden name="cartid" value="${id}">
                <input class="btn btn-danger" value="RemoveCart" name="action" type="Submit">
            </form>
        </div>
        <div class="w-25 text-center">
            ${price}
        </div>
    </div>

</div>    