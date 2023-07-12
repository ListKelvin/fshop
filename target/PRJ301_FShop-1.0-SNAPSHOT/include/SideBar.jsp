
<%@page import="DTO.AccountInfo"%>
<%

    AccountInfo user = (AccountInfo) request.getSession().getAttribute("user");
    if (user != null) {
        request.setAttribute("user", user);
    }%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="style/index.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

        <!--        <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
                // Add the new slick-theme.css if you want the default styling
                <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>-->
        <title>${param.title}</title>
    </head>
    <!--navbar-expand-lg-->
    <body >
        <div class="sideBar">
            <div class="d-flex flex-column gap-4">
                <h1 style="color: #fff;">F-SHOP</h1>
                <div class="nav flex-column nav-pills gap-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <a class="nav-link ${param.active == "0" ? 'active':''}" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="${pageContext.request.contextPath}/MainController?action=ViewShopAnalysis"  role="tab" aria-controls="v-pills-DashBoard" href="${pageContext.request.contextPath}/MainController?action=ViewShopAnalysis&active=0">DashBoard</a>
                    <a class="nav-link ${param.active == "1" ? 'active':''}" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="${pageContext.request.contextPath}/MainController?action=ViewAllProducts"  role="tab" aria-controls="v-pills-Product" href="${pageContext.request.contextPath}/MainController?action=ViewAllProducts&active=1" >Product</a>
                    <a class="nav-link ${param.active == "2" ? 'active':''}" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="${pageContext.request.contextPath}/MainController?action=ViewShopAnalysis&active=2"  role="tab" aria-controls="v-pills-Order" href="${pageContext.request.contextPath}/MainController?action=ViewAllOrders&active=2&status=all">Order</a>

                </div>  

            </div>
                    <button type="button" class="btn btn-danger mb-3" onclick="location.href='${pageContext.request.contextPath}/MainController?action=Logout'">Logout</button>
        </div>