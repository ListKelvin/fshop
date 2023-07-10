<%@page import="DTO.AccountInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <input class="btnCreateProduct" value="edit" type="submit"/>

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
