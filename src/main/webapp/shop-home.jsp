<%@page import="DTO.AccountInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

    AccountInfo user = (AccountInfo) request.getSession().getAttribute("user");
    if (user != null) {
        request.setAttribute("user", user);
    }

%> 
<c:import url="include/SideBar.jsp"><c:param name="title" value="Admin Page"/></c:import>

    <div class="adminWrapper  d-flex align-items-center justify-content-center flex-column gap-5" style="margin-left: 200px;"> 
        <div class="d-flex align-items-center justify-content-between gap-3" >
            <div class="d-flex align-items-center justify-content-center flex-wrap gap-3">
                <div class="analysBox d-flex align-items-center justify-content-between gap-3" >
                    <i class="bi bi-people svgStyle"></i>
                    <div class="">
                        <h3 class="content">Customer</h3>
                        <span class="content">${requestScope.totalUser}</span>
                </div>


            </div>
            <div class="analysBox d-flex align-items-center justify-content-between gap-3" >
                <i class="bi bi-receipt svgStyle"></i>
                <div class="">
                    <h3 class="content">Orders</h3>
                    <span class="content">${requestScope.totalOrder}</span>
                </div>
            </div>       
            <div class="analysBox d-flex align-items-center justify-content-between gap-3">
                <i class="bi bi-database svgStyle"></i>
                <div class="">
                    <h3 class="content">Products</h3>
                    <span class="content">${requestScope.totalProduct}</span>
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
        <div class="overflow-y-auto table-responsive" style="max-height: 610px;">
            <table class="table mt-3 table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Order ID</th>
                        <th scope="col">User Id</th>
                        <th scope="col">Payment</th>
                        <th scope="col">Delivery</th>
                        <th scope="col">Status</th>
                        <th scope="col">Create At</th>
                        <th scope="col">Total Bill</th>
                        <th scope="col"></th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.orders}" var="orderItem" varStatus="counter">
                        <tr>
                            <th scope="row">${counter.count}</th>
                            <td scope="row" >${orderItem.orderNumber}</td>
                            <td scope="row">${orderItem.userId}</td>
                            <td scope="row">${orderItem.payment}</td>
                            <td scope="row">${orderItem.delivery}</td>
                            <td scope="row">${orderItem.status}</td>
                            <td scope="row">${orderItem.createAt}</td>
                            <td scope="row">${orderItem.totalBill}</td>
                            <td scope="row">action</td>

                        </tr>


                    </c:forEach>

                </tbody>
            </table> 
        </div>


    </div>
</div>


</body>
</html>
