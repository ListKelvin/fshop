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
  /*
    ProductUtils pu = new ProductUtils();
    List<ProductInfo> products = pu.getAllProduct();
    request.setAttribute("products", products);

    ArrayList<CartInfo> carts = (ArrayList<CartInfo>) session.getAttribute("cart-list");
    if (carts != null) {
        request.setAttribute("carts", carts);
    }
     */
%> 

<c:import url="page/Header.jsp"><c:param name="title" value="Home Page"/></c:import>


    <section class="container d-flex align-items-center justify-content-center flex-column mt-5 minHeithStyled" onload="init()">
        <!--Carousel section-->
        <div id="carouselExample" class="carousel slide mt-auto">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="assest/banner/Banner-1.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="assest/banner/ad50db56090205.5bec77ea750ce.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="assest/banner/banner-3.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="assest/banner/banner-4.png" class="d-block w-100" alt="...">
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
        <!--Category section-->
        <div class="category">
            <h1>khám phá danh mục</h1>
            <div class="categories">
                <div class="categories_card">
                    <img src="assest/EARPHONE.png" className="noi" alt="" />
                    <h5>Đồ Công Nghệ</h5>
                </div>

                <div class="categories_card">
                    <img src="assest/BEAUTY.png" className="noi" alt="" />
                    <h5>Đồ Làm Đẹp</h5>
                </div>
                <div class="categories_card">
                    <img src="assest/JACKET.png" className="noi" alt="" />
                    <h5>Thời Trang</h5>
                </div>
                <div class="categories_card">
                    <img src="assest/NOI.png" className="noi" alt="" />
                    <h5>Gia Dụng</h5>
                </div>
                <div class="categories_card">
                    <img src="assest/NOTEBOOK.png" className="noi" alt="" />
                    <h5>Văn Phòng phẩm</h5>
                </div>
                <div class="categories_card">
                    <img src="assest/SPORT.png" className="noi" alt="" />
                    <h5>Thể Thao</h5>
                </div>
            </div>

        </div>

        <!--Product suggestion section-->
        <div class="w-100 bgProduct h-100 mb-3">

            <div class="wrapper px-2">
                <div class="d-flex justify-content-between align-items-center headWrapper">
                    <h1 class="textHeading">Gợi ý cho bạn</h1>
                    <a class="linkStyled">Xem thêm</a>
                </div>
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 gap-3 p-5 justify-content-center">
                <c:set var="listProduct" value="${requestScope.LIST_PRODUCT}"/>
                <c:forEach items="${listProduct}" var="product" varStatus="counter">
                    <tag:product_card className="col-md-4"  id="product-${counter.count}" idProduct="${product.id}" category="${product.categoryName}" productName="${product.title}" img="${product.image}" price="${product.price}"/>
                </c:forEach>

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


<c:import url="page/Footer.jsp"></c:import>

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