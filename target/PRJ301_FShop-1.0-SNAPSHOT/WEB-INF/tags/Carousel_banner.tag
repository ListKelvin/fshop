<%-- 
    Document   : Carousel_banner
    Created on : Jun 14, 2023, 7:46:24 PM
    Author     : Minh
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="message"%>

<%-- any content can be specified here e.g.: --%>
<div class="container text-center my-3">
    <h2 class="font-weight-light">Bootstrap Multi Slide Carousel</h2>
    <div class="row mx-auto my-auto justify-content-center">
        <div id="recipeCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner p-5" role="listbox">
                <div class="carousel-item active">
                    <div class="col">
                        <div class="categories_card">
                            <img src="assest/EARPHONE.png" className="noi" alt="" />
                            <h5>Đồ Công Nghệ</h5>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="col">
                        <div class="categories_card">
                            <img src="assest/BEAUTY.png" className="noi" alt="" />
                            <h5>Đồ Làm Đẹp</h5>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="col">
                        <div class="categories_card">
                            <img src="assest/JACKET.png" className="noi" alt="" />
                            <h5>Thời Trang</h5>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="col">
                        <div class="categories_card">
                            <img src="assest/NOI.png" className="noi" alt="" />
                            <h5>Gia Dụng</h5>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="col">
                        <div class="categories_card">
                            <img src="assest/NOTEBOOK.png" className="noi" alt="" />
                            <h5>Văn Phòng phẩm</h5>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="col">
                        <div class="categories_card">
                            <img src="assest/SPORT.png" className="noi" alt="" />
                            <h5>Thể Thao</h5>
                        </div>
                    </div>
                </div>
            </div>
            <!--                    <a class="carousel-control-prev bg-transparent w-aut bg-body-secondary" href="#recipeCarousel" role="button" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                </a>
                                <a class="carousel-control-next bg-transparent w-aut bg-body-secondary" href="#recipeCarousel" role="button" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                </a>-->
        </div>
    </div>
    <h5 class="mt-2 fw-light">advances one slide at a time</h5>
</div>