<%@page import="DTO.AccountInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

    AccountInfo user = (AccountInfo) request.getSession().getAttribute("user");
    if (user != null) {
        request.setAttribute("user", user);
    }

%> 
<c:import url="include/SideBar.jsp"><c:param name="title" value="Admin Page"/></c:import>

    <div class="adminWrapper page  d-flex align-items-center justify-content-center flex-column gap-5" style="margin-left: 200px;"> 
        <h1 class="position-relative me-auto headingStyled" style="margin: 20px 20px 40px; color: #BC6EEE;">Dashboard</h1>
        <div class="wrapperDashBoard container " style="display: grid; width: 100%; gap: 20px;">


            <div class=" analysBox" style="color: #BC6EEE;">
                <h2 class="mt-0 mb-1">Shop Statistics</h2>
                <p class="mt-0 mb-2">Everything About Shop</p>
                <div class="d-flex text-center gap-3 flex-wrap">
                    <div class="boxStatic ">
                        <!--<i class="bi bi-receipt svgStyle"></i>-->
                        <!--<i class="fa-regular fa-rectangle-list fa-2x mb-10 c-orange"></i>-->
                        <i class="bi bi-house svgStyle"></i>
                        <h3 class="content ">F-SHOP</h3>
                        <!--<span class="content">${requestScope.totalOrder}</span>-->
                </div>
                <div class="boxStatic">
                    <i class="bi bi-people svgStyle"></i>

                    <h3 class="content">Customer</h3>
                    <span class="content fs-5 fw-bolder" style="color: #FF9B33;">${requestScope.totalUser}</span>
                </div>
                <div class="boxStatic ">
                    <i class="bi bi-database svgStyle"></i>

                    <h3 class="content">Products</h3>
                    <span class="content fs-5 fw-bolder" style="color: #FF9B33;">${requestScope.totalProduct}</span>
                </div>
                <div class="boxStatic">
                    <i class="bi bi-receipt svgStyle"></i>
                    <!--<i class="fa-regular fa-rectangle-list fa-2x mb-10 c-orange"></i>-->
                    <h3 class="content ">Orders</h3>
                    <span class="content fs-5 fw-bolder" style="color: #FF9B33;">${requestScope.totalOrder}</span>
                </div>
            </div>
        </div>



        <div class="analysBox latest-news" style="color: #BC6EEE;">
            <h2 class="mt-0 mb-4">Best Seller</h2>


            <c:forEach items="${requestScope.bestSeller}" var="bestSeller2" >
                <div class="news-row d-flex align-center">
                    <img src="images/${bestSeller2.image}"  onError="this.onerror=null;this.src='./assest/linn.jpg';" alt="${bestSeller2.title}"/>
                    <div class="info">
                        <h3>${bestSeller2.title}</h3>
                        <p class="m-0">Sold: ${bestSeller2.sold}</p>
                    </div>
                    <div class="btn-shape  label">${bestSeller2.price}</div>
                </div>

            </c:forEach>

        </div>


    </div>


    <div class="boxAdmin">
        <div class="d-flex align-items-center justify-content-center mb-2 px-2">
            <h1 style="color: #BC6EEE;">Order Waiting</h1>
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


                        </tr>


                    </c:forEach>

                </tbody>
            </table> 
        </div>


    </div>
</div>


</body>

<script src="js/bootstrap.bundle.js" crossorigin="anonymous"></script>
</html>
