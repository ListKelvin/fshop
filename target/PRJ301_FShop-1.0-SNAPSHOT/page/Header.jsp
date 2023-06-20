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
        <title>${param.title}</title>
    </head>
    <!--navbar-expand-lg-->
    <body>
        <nav class="navbar navbar-expand-md  fixed-top  bgNavbar">
            <div class="container-fluid ">
                <div class="w-25">
                    <a class="navbar-brand text-white mx-3" href="#">F-SHOP</a>
                </div>

                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="offcanvas offcanvas-end " tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Offcanvas</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body justify-content-around">
                        <form class="d-flex w-50" role="search" action="SearchProduct" method="POST">
                            <input class="form-control me-2" type="search" name="search" placeholder="Search" aria-label="Search" >
                            <button class="btn btn-outline-light" type="submit">Search</button>
                        </form>
                        <ul class="navbar-nav  pe-3 ">
                            <li class="nav-item">
                                <a class="nav-link active text-white" aria-current="page" href="#"><i class="bi bi-cart3"></i> Cart</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img (31).webp" class="rounded-circle"
                                         width="22" height="22" alt="Avatar" loading="lazy" />

                                    Account
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>
        </nav>