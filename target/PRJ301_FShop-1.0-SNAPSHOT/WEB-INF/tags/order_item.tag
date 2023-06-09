<%-- 
    Document   : order_item
    Created on : Jul 1, 2023, 11:49:56 PM
    Author     : Minh
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="srcImg"%>
<%@attribute name="productName"%>
<%@attribute name="price"%>
<%@attribute name="quantity"%>

<%-- any content can be specified here e.g.: --%>
<div class="cartItem d-flex align-items-center ">
    <img src="images/${srcImg}" onError="this.onerror=null;this.src='./assest/linn.jpg';" alt="${productName}"  class="productImg"/>
    <div class="d-flex align-items-center justify-content-between w-100  p-3">
        <div >
            <div class=" text-truncate"  style="max-width: 200px;">${productName}</div>        
            <div class="" >Quantity: <strong> ${quantity} </strong></div>
        </div>

        <div>
            Total Price: ${price}
        </div>
    </div>

</div>    