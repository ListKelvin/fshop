<%-- 
    Document   : OtherProductCard
    Created on : Jun 26, 2023, 11:04:33 PM
    Author     : Minh
--%>

<%@tag description="this is a other product card" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="srcImg"%>
<%@attribute name="productName"%>
<%@attribute name="description"%>
<%@attribute name="category"%>

<%-- any content can be specified here e.g.: --%>

<div class="otherProduct d-flex align-items-center ">
    <img src="${srcImg}" alt="${productName}" class="productImg"/>
    <div class="">
        <div >
            <div class="">${productName}</div>
            <div class="d-inline-block text-truncate" style="max-width: 150px;">${description}</div>
        </div>
        <div class="badge rounded-pill badgeStyle d-inline-block text-truncate" style="max-width: 70px;">${category}</div>
    </div>
</div>