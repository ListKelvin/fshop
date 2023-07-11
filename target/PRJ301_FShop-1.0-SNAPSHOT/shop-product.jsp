<%@page import="DTO.AccountInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    AccountInfo user = (AccountInfo) request.getSession().getAttribute("user");
    if (user != null) {
        request.setAttribute("user", user);
    }%> 
<c:import url="include/SideBar.jsp"><c:param name="title" value="Admin Page"/></c:import>

    <div class="adminWrapper d-flex align-items-center justify-content-center" style="margin-left: 200px;"> 
        <div class="boxAdmin">

            <div class="d-flex align-items-center justify-content-between mb-2 px-2">
                <h2 style="color: #BC6EEE;">Product List</h2>
                <div class="d-flex align-items-center justify-content-between gap-2">
                    <a class="btnCreateProduct" href="${pageContext.request.contextPath}/create-product.jsp">+</a>
                <form action="MainController" class="d-flex">
                    <input name="action" value="UpdateProduct" type="hidden"/>
                    <input name="status" value="0" type="hidden"/>
                    <input class="btnCreateProduct" value="New Category" type="submit"/>

                </form>
            </div>



        </div>

        <p>${requestScope.message}</p>
        <hr style="color: #BC6EEE;" class="mt-0"/>

        <div class="overflow-y-auto" style="max-height: 610px;">
            <table class="table mt-3 table-hover ">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Sold</th>
                        <th scope="col">Sold Out</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.LIST_PRODUCT}" var="product" varStatus="counter">
                        <tr>
                            <th scope="row">${counter.count}</th>
                            <td class=" text-truncate"  style="max-width: 200px;">${product.title}</td>
                            <td>${product.categoryName}</td>
                            <td>${product.price}</td>                         
                            <td>${product.quantity}</td>                         
                            <td>${product.sold}</td>                         
                            <td>${product.soldOut}</td>                         
                            <td>  <form action="MainController" class="d-flex">
                                    <input name="action" value="UpdateProduct" type="hidden"/>
                                    <input name="id" value="${product.id}" type="hidden"/>
                                    <input name="update" value="0" type="hidden"/>
                                    <button class="btnCreateProduct" type="submit" >
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                        </svg>

                                    </button>





                                </form></td>                         

                        </tr>

                    </c:forEach>

                </tbody>
            </table> 
        </div>


    </div>








</div>


</body>
</html>
