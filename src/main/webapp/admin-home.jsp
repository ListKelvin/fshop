<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="include/SideBar.jsp"><c:param name="title" value="Admin Page"/></c:import>
    <div class="adminWrapper  d-flex align-items-center justify-content-center flex-column gap-5" style="margin-left: 200px;"> 
        <div class="d-flex align-items-center justify-content-between gap-3" >
            <div class="d-flex align-items-center justify-content-center flex-wrap gap-3">
                <div class="analysBox d-flex align-items-center justify-content-between gap-3" >
                    <i class="bi bi-people svgStyle"></i>
                    <div class="">
                        <h3 class="content">Customer</h3>
                        <span class="content">100</span>
                    </div>


                </div>
                <div class="analysBox d-flex align-items-center justify-content-between gap-3" >
                    <i class="bi bi-receipt svgStyle"></i>
                    <div class="">
                        <h3 class="content">Customer</h3>
                        <span class="content">100</span>
                    </div>
                </div>       
                <div class="analysBox d-flex align-items-center justify-content-between gap-3">
                    <i class="bi bi-database svgStyle"></i>
                    <div class="">
                        <h3 class="content">Customer</h3>
                        <span class="content">100</span>
                    </div>
                </div>
                <div class="analysBox" >
                    <h1 class="content p-1">Xin chào F-SHOP</h1>
                </div>
            </div>

        </div>  
        <div class="boxAdmin">
            <div class="d-flex align-items-center justify-content-center mb-2 px-2">
                <h1 style="color: #BC6EEE;">Order Waiting</h1  >




            </div>
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
