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
    
    <img src="images/${srcImg}" onError="this.onerror=null;this.src='./assest/linn.jpg';" alt="${productName}"  class="productImg" width="100"/>
    <div class="">
        <div >
            <div  class="d-inline-block text-truncate" style="max-width: 200px;">${productName}</div><br/>
            <div class="d-inline-block text-truncate" style="max-width: 200px;">${description}</div>
        </div>
        <div class="badge rounded-pill badgeStyle d-inline-block text-truncate" style="max-width: 70px;">${category}</div>
    </div>
</div>