<%-- 
    Document   : index
    Created on : Jun 3, 2023, 3:23:48 AM
    Author     : 03lin
--%>
<%@page import="Utils.APIWrapper"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="style/index.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <title>F-Shop</title>
    </head>
    <body>


        <section class="vh-100 bg">
            <div
                class="container py-5 h-100 d-flex align-items-center justify-content-center "
                >
                <div
                    class="row d-flex align-items-center justify-content-center  p-3 rounded w-100"
                    >
                    <div class="col col-sm-7 col-md-6 col-lg-5  col-xxl-5 d-none d-sm-block">
                        <img
                            src="./assest/E-commerce_1.png"
                            class="object-fit-cover  img-fluid"
                            alt="image"
                            />
                    </div>
                    <div class="col col-sm-12 col-md-9 col-lg-6 col-xxl-6 offset-xl-1 d-flex align-items-center justify-content-center flex-column ">
                        <div class="d-flex align-items-center justify-content-center my-4">
                            <span class="text-success fs-1 fontText text-uppercase"
                                  >Login</span
                            >
                        </div>
                        <form id="login-form" action="AccountServlet" method="POST" onsubmit="return validateEmail() && validatePassword()" >
                            <!-- Email input -->
                            <div class="form-floating mb-3">
                                <input
                                    type="email"
                                    class="form-control"
                                    placeholder="username"
                                    id="email"
                                    name="txtEmail"
                                    value=""
                                    placeholder="name@example.com"
                                    onChange="validateEmail()"
                                    />
                                <label for="email">Email</label>

                            </div>
                            <span id="emailError"></span>
                            <!-- Password input -->
                            <div class="form-floating mb-3">
                                <input
                                    type="password"
                                    id="txtPass"
                                    class="form-control"
                                    name="txtPass" 
                                    value=""
                                    placeholder="Password"
                                    onChange="validatePassword()"
                                    />
                                <label for="floatingPassword">Password</label>
                            </div>
                            <span id="passError"></span>
                            <div class="my-2">  <h4 class="text-danger">${requestScope.message}</h4>   </div>
                            <div
                                class="d-flex justify-content-between align-items-center mb-4"
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
                                        Remember me
                                    </label>
                                </div>
                                <a href="#!">Forgot password?</a>
                            </div>

                            <!-- Submit button -->
                            <button type="submit" class="btn btn-styled" name="btAction" value="Login">Sign in</button>
                            <!-- this section for gg sign in or  -->
                            <hr />
                            <div
                                class="divider d-flex align-items-center justify-content-center my-4"
                                >
                                <p class="text-center fw-bold mx-3 mb-0 text-muted">OR</p>
                            </div>

                            <div
                                class=" d-flex align-items-center justify-content-center my w-100"
                                >   
                                <div
                                    class=" d-flex align-items-center justify-content-center gap-1 w-50"
                                    >     
                                    <a
                                        class="btn btn-primary rounded-circle "
                                        style="background-color: #3b5998"
                                        href="<%=APIWrapper.getDiaLogLink()%>"
                                        role="button"
                                        >
                                        <i class="bi bi-facebook"></i>
                                    </a>
                                    <div
                                        id="g_id_onload"
                                        data-client_id="15935712647-nge50dcde86pqvnulkvpiumetofdu05r.apps.googleusercontent.com"
                                        data-context="signin"
                                        data-ux_mode="popup"
                                        data-login_uri="http://localhost:8080/PRJ301_FShop/GoogleServlet"
                                        data-itp_support="true"

                                        ></div>

                                    <div
                                        class="g_id_signin"
                                        data-type="icon"
                                        data-shape="pill"
                                        data-theme="filled_blue"
                                        data-text="signin_with"
                                        data-size="large"
                                        data-logo_alignment="left"
                                        ></div>
                                </div>

                            </div>
                            <div
                                class="divider d-flex align-items-center justify-content-center my-4 fw-bolder"
                                >
                                <span>Doesn't have an account? </span>
                                <a href="register.jsp" class="text-success px-1"> Sign Up for free</a>
                            </div>


                        </form>
                    </div>
                </div>
            </div>
        </section>
        <script>


            function validateEmail() {
                var email = document.getElementById("txtEmail").value;
                if (email.indexOf("@") == -1) {
                    document.getElementById("emailError").innerHTML = "Email must contain the @ symbol.";
                    return false;
                }
                return true;
            }

            function validatePassword() {
                var pass = document.getElementById("txtPass").value;
                if (pass.length < 2 || pass.length > 120) {
                    document.getElementById("passError").innerHTML = "Age must be a number between 18 and 120.";
                    return false;
                } else {
                    console.log("check run");
                    document.getElementById("passError").innerHTML = "";
                }
                return true;
            }
        </script>

        <script src="https://accounts.google.com/gsi/client" async defer></script>
        <script src="./js/bootstrap.bundle.js" crossorigin="anonymous"></script>
    </body>
</html>
