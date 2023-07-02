<%@page import="DTO.CartInfo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Utils.ProductUtils"%>
<%@page import="DTO.ProductInfo"%>
<%@page import="DTO.AccountInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags/"%>



<c:import url="page/Header.jsp"><c:param name="title" value="Home Page"/></c:import>

    <section class="container g-4   minHeithStyled">
        <div class="row">

            <div class="col-md-3 mx-auto mt-3 mb-5 ">
                <form  role="search">
                    <div class="input-group input-group-lg ">
                        <input class="form-control border-end-0 border rounded-pill shadow" type="search" value="search" id="example-search-input">
                            <span class="input-group-append">
                                <button class="btn btn-outline-secondary bg-white border-bottom-0 border rounded-pill ms-n5 p-3" type="button">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                    </svg>
                                </button>
                            </span>
                    </div>
                </form>
            </div>
        </div>

        <h1 class="search-result-heading text-center mb-3">Chỗ hiện kế quả tìm kiếm</h1>
        <div class="search-result-description text-center"> Thanh hiện số kết quả tiềm được</div>


        <!--Thanh Filter ở đây ( chỉ render category text)-->

        <div class="mb-4 p-4">
            <nav class="nav nav-pills flex-column flex-sm-row">
                <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="#">Active</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="#">Longer nav link</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="#">Link</a>
                <a class="flex-sm-fill text-sm-center nav-link ">Disabled</a>
                <a class="flex-sm-fill text-sm-center nav-link ">Disabled</a>
                <a class="flex-sm-fill text-sm-center nav-link ">Disabled</a>
                <a class="flex-sm-fill text-sm-center nav-link ">Disabled</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="#">Longer nav link</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="#">Longer nav link</a>
            </nav>
        </div>
        
        <div> 

            chỗ render sản phẩm tìm được

        </div>

    </section>
<c:import url="page/Footer.jsp"></c:import>