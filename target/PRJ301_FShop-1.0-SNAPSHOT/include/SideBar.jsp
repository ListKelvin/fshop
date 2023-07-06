
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
                    <a class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-DashBoard"  role="tab" aria-controls="v-pills-DashBoard" aria-selected="true">DashBoard</a>
                    <a class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-Product"  role="tab" aria-controls="v-pills-Product" aria-selected="false">Product</a>
                    <a class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-Order"  role="tab" aria-controls="v-pills-Order" aria-selected="false">Order</a>
                    <a class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-someThing"  role="tab" aria-controls="v-pills-someThing" aria-selected="false">Some thing</a>
                </div>  

            </div>
            <button class="btn btn-danger mb-3">Logout</button>
        </div>