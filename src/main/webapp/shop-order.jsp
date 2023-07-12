
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <a class="nav-link ${param.status == 'all' ? 'active': ''}" href="${pageContext.request.contextPath}/MainController?action=ViewAllOrders&status=all">ALL</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${param.status == 'checking' ? 'active': ''}" href="${pageContext.request.contextPath}/MainController?action=ViewAllOrders&status=checking">Checking</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${param.status == 'preparing' ? 'active': ''}" href="${pageContext.request.contextPath}/MainController?action=ViewAllOrders&status=preparing">Preparing</a>
            </li> 
            <li class="nav-item">
                <a class="nav-link ${param.status == 'delivering' ? 'active': ''}" href="${pageContext.request.contextPath}/MainController?action=ViewAllOrders&status=delivering">Delivering</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${param.status == 'done' ? 'active': ''}" href="${pageContext.request.contextPath}/MainController?action=ViewAllOrders&status=done">Done</a>
            </li>
        </ul>
        <c:set  var="listOrder" value="${requestScope.orders}"/>
        <div class="overflow-y-auto" style="max-height: 610px;">

            <table class="table mt-3 table-hover ">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Order Number</th>
                        <th scope="col">Delivery</th>
                        <th scope="col">Payment</th>
                        <th scope="col">Create At</th>
                        <th scope="col">Status</th>
                        <th scope="col">Total</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach items="${requestScope.orders}" var="order" varStatus="counter">
                    <form action="MainController">
                        <input name="action" value="UpdateOrder" type="hidden" />
                        <tr>
                            <th scope="row">${counter.count}</th>
                            <td>${order.orderNumber}</td>
                            <td>${order.delivery}</td>
                            <td>${order.payment}</td>
                            <td>${order.createAt}</td>
                            <td id="order-${counter.count}">${order.status}</td>
                            <td class="d-none" id="input-${counter.count}">

                                <select class="form-select form-select-sm" name="status">
                                    <option value="">Open this select status</option>
                                    <option value="checking">Checking</option>
                                    <option value="preparing">Preparing</option>
                                    <option value="delivering">Delivering</option>
                                    <option value="done">Done</option>

                                </select>

                            </td>
                            <td>${order.totalBill}</td>
                            <td>
                                <div id="btnConfirm-${counter.count}" class="d-none">

                                    <input name="orderId" value="${order.orderId}" type="hidden" />

                                    <input  value="Confirm" type="submit" />
                                </div>
                                <button id="btnEdit-${counter.count}" type="button" onClick="handleChangeStatus(${counter.count})">change status</button>
                                <a href="${pageContext.request.contextPath}/MainController?action=ViewOrder&orderId=${order.orderId}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                    <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                    <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                    </svg>
                                </a>
                            </td>
                        </tr>
                    </form>

                </c:forEach>

                </tbody>
            </table> 

        </div>


    </div>








</div>
<script>



    function handleChangeStatus(id) {
        // get the cell want to appear input select
        const btnEdit = document.getElementById("btnEdit-" + id);
        const btnConfirm = document.getElementById("btnConfirm-" + id);
        const cell = document.getElementById("order-" + id);
        const input = document.getElementById("input-" + id);
        console.log("#order-" + id);
        for (let i = 1; i <= ${listOrder.size()}; i++) {
            if (id === i) {
                cell.classList.add("d-none");
                input.classList.remove("d-none");

                btnEdit.classList.add("d-none");
                btnConfirm.classList.remove("d-none");

            }
            ;

        }

    }



</script>

</body>
</html>
