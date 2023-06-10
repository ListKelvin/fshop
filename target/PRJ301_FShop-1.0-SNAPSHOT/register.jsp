<%-- 
    Document   : register
    Created on : Jun 3, 2023, 3:33:33 AM
    Author     : 03lin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="style/index.css"/>
        <title>Register</title>
    </head>
    <body>
        <section class="registerBg">
            <div class="container py-5 d-flex align-items-center justify-content-start">
                <div class="card size">
                    <div class="card-body w-75 ">

                        <h3 class="card-title textStyled">Register</h3>
                        <form action="AccountServlet" method="POST" class="w-100 d-flex align-items-center justify-content-center flex-column">
                            <div class="form-floating w-100  mb-3">
                                <input

                                    type="text"
                                    class="form-control w-100"
                                    placeholder="username"
                                    id="txtUser"
                                    name="txtUser"
                                    value=""/>
                                <label for="txtUser">User Name</label>

                            </div>
                            <h4>${requestScope.messageUserName}</h4> 
                            <div class="form-floating w-100 mb-3">
                                <input
                                    type="email"
                                    class="form-control w-100"
                                    placeholder="username"
                                    id="email"
                                    name="txtEmail"
                                    value=""
                                    placeholder="name@example.com"
                                    onChange="validateEmail()"
                                    />
                                <label for="email">Email</label>

                            </div>
                            <h4>${requestScope.messageEmail}</h4> 
                            <div class="form-floating w-100 mb-3">
                                <input
                                    type="password"
                                    id="txtPass"
                                    class="form-control w-100"
                                    name="txtPass" 
                                    value=""
                                    placeholder="Password"
                                    onChange="validatePassword()"
                                    />
                                <label for="txtPass">Password</label>
                            </div>
                            <div class="form-floating w-100 mb-3">
                                <input
                                    type="password"
                                    id="confirmPassword"
                                    class="form-control w-100"
                                    name="confirmPassword" 
                                    value=""
                                    placeholder="Password"
                                    onChange="validatePassword()"
                                    />
                                <label for="confirmPassword">Confirm Password</label>
                            </div>
                            <h4>${requestScope.messagePassword}</h4> 
                            <div
                                class="d-flex justify-content-start align-items-start mb-4 w-100"
                                >
                                <!-- Checkbox -->
                                <div class="form-check">
                                    <input
                                        class="form-check-input check"
                                        type="checkbox"
                                        value=""
                                        id="rememberMe"
                                        checked
                                        />
                                    <label class="form-check-label" For="rememberMe">
                                       Confirm information
                                    </label>
                                </div>
                     
                            </div>
                            <button class="btn btn-styled" type="submit" name="btAction" value="Register">Register </button> 
                            <h4>${requestScope.message}</h4>   
                        </form>

                        <div
                            class="d-flex align-items-center justify-content-center my-4 fw-bolder gap-4"
                            >

                            <span>Have an account? </span>
                            <a  href="/PRJ301_FShop/" class="btn smallBtn"> Sign in here</a>
                        </div>
                    </div>


                </div>

            </div>



        </section>



        <script src="./js/bootstrap.bundle.js" crossorigin="anonymous"></script>
    </body>
</html>
