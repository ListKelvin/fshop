<%-- 
    Document   : cart_item
    Created on : Jun 27, 2023, 3:57:27 AM
    Author     : Minh
--%>

<%@tag description="cart item" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="srcImg"%>
<%@attribute name="productName"%>
<%@attribute name="category"%>

<%-- any content can be specified here e.g.: --%>

<div class="cartItem d-flex align-items-center ">
    <img src="${srcImg}" alt="${productName}" class="productImg"/>
    <div class="d-flex align-items-center justify-content-between w-100">
        <div >
            <div class="">${productName}</div>        
            <div class="badge rounded-pill badgeStyle d-inline-block text-truncate" style="max-width: 70px;">${category}</div>


        </div>
            <div class="d-flex align-items-center flex-column ">

            <ul class="pagination justify-content-end set_quantity w-100">
                <li class="page-item">
                    <button class="page-link " onclick="decreaseNumber('textbox1', 'itemval1')"> <i class="bi bi-dash"></i> </button>
                </li>
                <li class="page-item"><input type="number" name="" class="page-link" value="0" id="textbox1" >
                </li>
                <li class="page-item">
                    <button class="page-link" onclick="increaseNumber('textbox1', 'itemval1')"> <i class="bi bi-plus"></i></button>

                </li>
            </ul>

            <button class="btn btn-danger" type="button"><i class="bi bi-trash"></i> REMOVE</button>
        </div>
        <div>
            price
        </div>
    </div>

</div>    