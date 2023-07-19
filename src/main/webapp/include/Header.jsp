<%@page import="DTO.UserInfo"%>
<%@page import="Utils.UserUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="DTO.AccountInfo"%>
<%

    AccountInfo user = (AccountInfo) request.getSession().getAttribute("user");
    UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo");

    if (user != null && userInfo != null) {
         request.setAttribute("role", user.getRole());
//           request.setAttribute("ava", userInfo.getAvatar());

        request.setAttribute("user", userInfo);
    }


%> 
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
        <c:if test="${role eq 'customer'|| role == null}">
            <nav class="navbar navbar-expand-md  fixed-top  bgNavbar shadow">
                <div class="container-fluid align-items-center">
                    <div class="w-25">
                        <a class="navbar-brand text-white mx-3" href="${pageContext.request.contextPath}/MainController?action=SearchProduct&searchTxt=&cate=">F-SHOP</a>
                    </div>
                    <!--Responsive navBar--> 
                    <button class="navbar-toggler border-light  p-1" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#fff" class="bi bi-list" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                        </svg>
                    </button>
                    <div class="offcanvas offcanvas-end " tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Offcanvas</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body justify-content-around">
                            <form class="d-flex w-50" action="MainController" role="search">

                                <div class="input-group rounded-circle">
                                    <i class="bi bi-search input-group-text"></i>
                                    <input class="form-control me-2 border-rounded" type="search" name="searchTxt" value="" placeholder="Search" aria-label="Search">
                                    <input  type="hidden" name="action" value="SearchProduct">
                                </div>
                            </form>
                            <c:if test="${ empty user}">

                                <div class="d-flex gap-3">
                                    <a class="btnCancelConfirmOrder" href="index.jsp">
                                        login
                                    </a>
                                    <a class="btnPlaceOrder" href="register.jsp">


                                        register
                                    </a>
                                </div>

                            </c:if>
                            <c:if test="${not empty user }">


                                <ul class="navbar-nav  pe-3 ">
                                    <li class="nav-item">
                                        <a class="nav-link  textResponsive " aria-current="page" href="${pageContext.request.contextPath}/MainController?action=ViewCart"><i class="bi bi-cart3"></i> Cart 

                                        </a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle textResponsive" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <c:if test="${ empty sessionScope.userInfo.avatar}">
                                                <img src="" onError="this.onerror=null;this.src='./assest/linn.jpg';" class="rounded-circle"
                                                     width="22" height="22" alt="Avatar" loading="lazy" />
                                            </c:if>
                                            <c:if test="${ not empty sessionScope.userInfo.avatar}">
                                                <img src="images/${sessionScope.userInfo.avatar}" onError="this.onerror=null;this.src='./assest/linn.jpg';" class="rounded-circle"
                                                     width="22" height="22" alt="Avatar" loading="lazy" />
                                            </c:if>

                                        </a>
                                        <ul class="dropdown-menu  dropdown-menu-end">
                                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/MainController?action=ViewUserInfo&updateStatus=0">Setting Profile</a></li>
                                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/MainController?action=ViewOrderHistory">Order History</a></li>


                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/MainController?action=Logout">Logout</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </c:if>

                        </div>
                    </div>
                </div>
            </nav>
        </c:if>
