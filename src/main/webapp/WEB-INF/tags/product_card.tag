<%-- 
    Document   : product_card
    Created on : Jun 8, 2023, 12:05:33 PM
    Author     : Minh
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="category" required="true"%>
<%@attribute name="productName" required="true"%>
<%@attribute name="img" required="true"%>
<%@attribute name="price" required="true"%>
<%-- any content can be specified here e.g.: --%>

<div class=" product card " >
    <img src="${img}" class="card-img-top" alt="${productName}">
    <div class="card-body">
        <p class="badge rounded-pill text-bg-light">${category}</p>
        <p >${productName}</p>
        <p class="card-text">${price}</p>
    </div>
</div>