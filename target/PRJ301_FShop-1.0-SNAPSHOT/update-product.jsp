
<%@page import="Utils.CategoryUtils"%>
<%@page import="java.util.List"%>
<%@page import="DTO.CategoryInfo"%>
<%@page import="DTO.AccountInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AccountInfo user = (AccountInfo) request.getSession().getAttribute("user");
    if (user == null) {
        request.setAttribute("message", "Unauthentication!!");
        response.sendRedirect("index.jsp");
    } else {
        if (user.getEmail().equals("admin123@gmail.com")) {
            request.setAttribute("user", user);
        } else {
            request.setAttribute("message", "Unauthorization!!");
            response.sendRedirect("home.jsp");
        }
    }
    List<CategoryInfo> categories = CategoryUtils.getAllCategory();
    request.setAttribute("categories", categories);
%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="include/SideBar.jsp"><c:param name="title" value="Update Product"/></c:import>
    <div class="adminWrapper d-flex align-items-center justify-content-center" style="margin-left: 200px;">  
        <div class="boxAdmin">
            <h2 style="color: #BC6EEE;">Update Product</h2>
            <hr style="color: #BC6EEE;" class="mt-0"/>
            <p>${requestScope.message}</p>
        <form method="post" action="${pageContext.request.contextPath}/MainController?action=UpdateProduct&id=${requestScope.product.id}&update=1" id="edit-profile" enctype="multipart/form-data">
            <div class="p-3">
                <div class=" row ">
                    <div class="col">
                        <div class="">
                            <label  for="title" class="form-label fw-semibold fs-5">Title:</label>
                            <input class="form-control" type="text" name="title" id="title"  value="${requestScope.product.title}" aria-label="title product input" >
                        </div>
                        <div class="">
                            <label  for="priceStr" class="form-label fw-semibold fs-5">Price:</label>
                            <input class="form-control" type="number" name="priceStr" id="priceStr" value="${requestScope.product.price}" aria-label="price product input" >
                        </div>
                    </div>
                    <div class="col">
                        <div class="">
                            <label class=" form-label  fw-semibold fs-5" for="category">Category:</label>
                            <select class="form-select " id="category" required  aria-label="category" name="category">
                                <option value="${requestScope.product.categoryName}">${requestScope.product.categoryName}</option>
                                <c:forEach items="${requestScope.categories}" var="category">
                                    <option value="${category.categoryName}">${category.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="">
                            <label  for="quantityStr" class="form-label fw-semibold fs-5">Quantity:</label>
                            <input class="form-control" type="number" name="quantityStr" id="quantityStr"  value="${requestScope.product.quantity}" aria-label="quantity product input" >
                        </div>
                    </div>
                </div>
                <div class=" row ">
                    <div class="col">
                        <div class="">
                            <label for="description" class="form-label  fw-semibold fs-5">Description:</label>
                            <textarea class="form-control" id="description"  name="description" rows="3">${requestScope.product.description}</textarea>
                        </div>
                    </div>
                    <div class="col">
                        <div class="">
                            <label for="image" class="form-label  fw-semibold fs-5">Product image:</label>
                            <input class="form-control" id="image" value="images/${requestScope.product.image}" name="image" type="file" >
                            <div id="image" class="form-text">We required just one image!!</div>
                        </div>
                    </div>
                </div>
           
            </div>
            <div class="d-flex align-items-center gap-2">
                <button type="button" onClick="window.location.href='${pageContext.request.contextPath}/MainController?action=ViewAllProducts&active=1'" class="btnPlaceOrder">Cancel</button>
                <button type="Submit"  class="btnPlaceOrder">Yes</button>
            </div>
        </form>


    </div>


</div>

<script src="js/bootstrap.bundle.js" crossorigin="anonymous"></script>
</body>
</html>
