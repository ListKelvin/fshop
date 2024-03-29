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
<%@attribute name="disabled" %>

<%-- any content can be specified here e.g.: --%>

<div class=" product card ${className}" id="${id}">
    <a href="${pageContext.request.contextPath}/MainController?action=ViewProduct&id=${idProduct}" style="cursor: pointer" >
        
        <img src="${img}" onError="this.onerror=null;this.src='./assest/linn.jpg';" class="card-img-top " alt="${productName}" style="height: 150px; object-fit: cover; min-height: 150px"> 
        <div class="p-2">
            <div class="card-body">
                <p class="badge rounded-pill badgeStyle ">${category}</p>
                <p class="text-eclipse ">${productName}</p>
                <p class="card-text price">${price}</p>
            </div>

        </div>
    </a>


    <div class="px-2 pb-3 ${disabled}">
        <!--    <button>Add to cart or ICOn</button>-->
        <form action="MainController" method="POST">
            <input type=hidden name="id" value="${idProduct}">
            <input class="btnAddToCart " value="Add To Cart" name="action" type="Submit">
        </form>
    </div>
</div>