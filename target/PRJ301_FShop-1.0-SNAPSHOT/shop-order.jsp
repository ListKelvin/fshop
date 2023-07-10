<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="include/SideBar.jsp"><c:param name="title" value="Admin Page"/></c:import>

    <div class="adminWrapper d-flex align-items-center justify-content-center" style="margin-left: 200px;"> 
        <div class="boxAdmin">

            <div class="d-flex align-items-center justify-content-between mb-2 px-2">
                <h2 style="color: #BC6EEE;">Order List</h2>




            </div>
            <hr style="color: #BC6EEE;" class="mt-0"/>

            <ul class="nav nav-tabs">
               <li class="nav-item">
                    <a class="nav-link ${param.action == 'ViewOrderHistory' ? 'active': ''}" href="${pageContext.request.contextPath}/MainController?action=ViewOrderHistory&status=all&userId=${requestScope.user.id}">ALL</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${param.status == 'checking' ? 'active': ''}" href="${pageContext.request.contextPath}/MainController?action=GetOrderByStatus&status=checking&userId=${requestScope.user.id}">Checking</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${param.status == 'preparing' ? 'active': ''}" href="${pageContext.request.contextPath}/MainController?action=GetOrderByStatus&status=preparing&userId=${requestScope.user.id}">Preparing</a>
            </li> 
            <li class="nav-item">
                <a class="nav-link ${param.status == 'delivering' ? 'active': ''}" href="${pageContext.request.contextPath}/MainController?action=GetOrderByStatus&status=delivering&userId=${requestScope.user.id}">Delivering</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${param.status == 'done' ? 'active': ''}" href="${pageContext.request.contextPath}/MainController?action=GetOrderByStatus&status=done&userId=${requestScope.user.id}">Done</a>
            </li>
        </ul>
        <div class="overflow-y-auto" style="max-height: 250px;">
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
                    <c:forEach items="${cartItems}" var="cartItems" varStatus="counter">
                        <tr>
                            <th scope="row">${counter.count}</th>
                            <td>${cartItems.title}</td>
                            <td>${cartItems.cartQuantity}</td>
                            <td>${cartItems.price * cartItems.cartQuantity}</td>
                        </tr>

                    </c:forEach>
                    <tr>
                        <th scope="row">2</th>
                        <td scope="row" >23</td>
                        <td scope="row">4</td>
                        <td scope="row">5</td>
                        <td scope="row">5</td>
                        <td scope="row">5</td>
                        <td scope="row">5</td>
                        <td scope="row">action</td>

                    </tr>

                    <tr>
                        <th scope="row">2</th>
                        <td scope="row" >23</td>
                        <td scope="row">4</td>
                        <td scope="row">5</td>
                        <td scope="row">5</td>
                        <td scope="row">5</td>
                        <td scope="row">5</td>
                        <td scope="row">action</td>

                    </tr> <tr>
                        <th scope="row">2</th>
                        <td scope="row" >23</td>
                        <td scope="row">4</td>
                        <td scope="row">5</td>
                        <td scope="row">5</td>
                        <td scope="row">5</td>
                        <td scope="row">5</td>
                        <td scope="row">action</td>

                    </tr> <tr>
                        <th scope="row">2</th>
                        <td scope="row" >23</td>
                        <td scope="row">4</td>
                        <td scope="row">5</td>
                        <td scope="row">5</td>
                        <td scope="row">5</td>
                        <td scope="row">5</td>
                        <td scope="row">action</td>

                    </tr>
                </tbody>
            </table> 
        </div>


    </div>








</div>


</body>
</html>
