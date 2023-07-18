<%@page import="DTO.CartInfo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Utils.ProductUtils"%>
<%@page import="DTO.ProductInfo"%>
<%@page import="DTO.AccountInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags/"%>

<%

    AccountInfo user = (AccountInfo) request.getSession().getAttribute("user");
    if (user != null) {
        request.setAttribute("user", user);
    }

%> 

<c:import url="include/Header.jsp"><c:param name="title" value="Home Page"/></c:import>

    <div id="carouselExample" class="carousel slide " style=" margin-top: 70px;">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="assest/banner/Banner-1.png" width="1920" height="600"  onError="this.onerror=null;this.src='./assest/linn.jpg';"  class="d-block w-100 object-fit-cover"  alt="...">
            </div>
            <div class="carousel-item">
                <img src="assest/banner/ad50db56090205.5bec77ea750ce.png" width="1920" height="600"   onError="this.onerror=null;this.src='./assest/linn.jpg';"  class="d-block w-100 object-fit-cover" alt="...">
            </div>
            <div class="carousel-item">
                <img src="assest/banner/banner-3.png" width="1920" height="600"  onError="this.onerror=null;this.src='./assest/linn.jpg';"   class="d-block w-100 object-fit-cover" alt="...">
            </div>
            <div class="carousel-item">
                <img src="assest/banner/banner-4.png" width="1920" height="600"  onError="this.onerror=null;this.src='./assest/linn.jpg';"  class="d-block w-100 object-fit-cover" alt="...">
            </div>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- End Carousel -->
    <div style="background: #ECFFC1">
        <div class=" container py-5" > 
            <div class="d-flex justify-content-center flex-column align-items-center headWrapper">
                <h1 class="textHeading">Best Seller</h1> <div>        <h3 class="textHeading3">Top 10</h3></div>


            </div>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 gap-4 p-5 justify-content-center"> 
            <c:forEach items="${requestScope.best_seller}" var="bestSeller" varStatus="counter" >


                <tag:product_card   className="col-md-4" disabled="${requestScope.user == null ?'disabled': ''}" id="product-${counter.count}" idProduct="${bestSeller.id}" category="${bestSeller.categoryName}" productName="${bestSeller.title}" img="images/${bestSeller.image}" price="${bestSeller.price}"/>

            </c:forEach>

        </div>
        <div class=" d-flex align-items-center  flex-wrap gap-4 justify-content-center">





        </div>
    </div>
    </div>
    
<section class="container-xl d-flex align-items-center justify-content-center flex-column  minHeithStyled py-5 " onLoad="init()">


    <!--Product suggestion section-->
    <div class="w-100 bgProduct h-100 mb-3 row gap-4  justify-content-center">


        <div class="wrapper col-12 px-2">
            <div class="d-flex justify-content-between align-items-center headWrapper">
                <h1 class="textHeading">Shop Product</h1>
                <!-- Example single danger button -->
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        ${param.cate != ""  ? param.cate : "Select category"} 
                    </button>
                    <!--                        <form action="MainController">
                                                <select class="form-select form-select-lg mb-3" >
                    <c:forEach items="${requestScope.categories}" var="category">
                        <option value="">Open this select menu</option>
                    </c:forEach>
                </select>-->

                    </form>

                    <ul class="dropdown-menu">

                        <c:forEach items="${requestScope.categories}" var="category">
                            <li><a class="dropdown-item"  href="${pageContext.request.contextPath}/MainController?action=SearchProduct&cate=${category.categoryName}&searchTxt=">${category.categoryName}</a> </li>
                            </c:forEach>

                    </ul>
                </div>
            </div>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 gap-4 p-5 justify-content-center">
                <c:set var="listProduct" value="${requestScope.LIST_PRODUCT}"/>
                <c:forEach items="${listProduct}" var="product" varStatus="counter">
                    <tag:product_card className="col-md-4" disabled="${requestScope.user == null ?'disabled': ''}" id="product-${counter.count}" idProduct="${product.id}" category="${product.categoryName}" productName="${product.title}" img="images/${product.image}" price="${product.price}"/>
                </c:forEach>

                <c:if test="${listProduct.size() ==0 }">
                    <div class="d-flex align-items-center justify-content-center flex-column">
                        <img src="assest/emptyStore.png" width="400" alt="empty cart"/>
                        <p>Empty</p>
                    </div>
                </c:if>
            </div>

            <nav aria-label="Page navigation" class="p-2">
                <ul class="pagination justify-content-center">
                    <li id="prev-btn" class="page-item" >
                        <a class="page-link" href="#" onclick="goPrev()" tabindex="-1" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>

                    <li class="page-item" id="next-btn">
                        <a class="page-link" href="#" onclick="goNext()" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>


    </div>
</section>


<c:import url="include/Footer.jsp"></c:import>

    <script>

        // Pagination
        let size = 5;
        let pageIndex = 1;
        let total = parseInt(${listProduct.size()});
        let totalPage = Math.ceil(total / size);
        if (totalPage === 1) {
            $('#next-btn').addClass("disabled");
        }
        function goToPage(page) {
            for (let i = 0; i < ${listProduct.size()}; i++) {
                let index = i + 1;
                $("#product-" + index).addClass("d-none");
            }
            ;
            for (let i = 0; i < size; i++) {
                let index = (page - 1) * size + (i + 1);
                $("#product-" + index).removeClass("d-none");
            }
            ;
        }
        ;
        function  goPrev() {
            $("#next-btn").removeClass("disabled");
            console.log("cc");
            console.log(totalPage);
            console.log('vcl');
            goToPage(pageIndex - 1);
            pageIndex = pageIndex - 1;
            if (pageIndex === 1) {
                $("#prev-btn").addClass("disabled");
            }
            ;
        }
        function goNext() {
            $("#prev-btn").removeClass("disabled");
            console.log(totalPage);
            goToPage(pageIndex + 1);
            pageIndex = pageIndex + 1;
            if (pageIndex === totalPage) {
                $("#next-btn").addClass("disabled");
            }
            ;
        }

        function init() {
            goToPage(1);
            $("#prev-btn").addClass("disabled");
        }
        ;
</script>