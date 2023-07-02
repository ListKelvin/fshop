<%-- 
    Document   : product_card
    Created on : Jun 8, 2023, 12:05:33 PM
    Author     : Minh
--%>

<%@tag description="this is a proudct card" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="idProduct" required="true"%>
<%@attribute name="id" required="true"%>

<%@attribute name="category" required="true"%>
<%@attribute name="productName" required="true"%>
<%@attribute name="img" required="true"%>
<%@attribute name="price" required="true"%>
<%@attribute name="className" %>
<%-- any content can be specified here e.g.: --%>

<div class=" product card ${className}" id="${id}">
    <img src="${img}" class="card-img-top img-fluid" alt="${productName}">
    <div class="card-body">
        <p class="badge rounded-pill badgeStyle ">${category}</p>
        <p class="text-eclipse ">${productName}</p>
        <p class="card-text price">${price}</p>
    </div>
    <!--    <button>Add to cart or ICOn</button>-->
    <form action="AddToCart" method="POST">
        <input type=hidden name="id" value="${idProduct}">
        <input value="Add to cart" type="Submit">
    </form>
</div>