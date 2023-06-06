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
        <title>F-Shop</title>
    </head>
    <body>
        <!--        <h3>Login</h3>
                <form action="AccountServlet" method="POST">
                    Email <input type="text" name="txtEmail" value="" /> <br/>
                    Password <input type="password" name="txtPass" value=""> <br/>
                    <input type="submit" name="btAction" value="Login"/>
        
                    Not have account? Register <a href="register.jsp">here<a/>
        
                        <h4>${requestScope.message}</h4>   
                </form>
                <a href="<%=APIWrapper.getDiaLogLink()%>">Login via Facebook</a> -->

        <section class="vh-100 bg">
            <div
                class="container py-5 h-100 d-flex align-items-center justify-content-center "
                >
                <div
                    class="row d-flex align-items-center justify-content-center  p-3 rounded w-100"
                    >
                    <div class="col">
                        <img
                            src="./assest/Rectangle.png"
                            class="object-fit-cover border rounded img-fluid"
                            alt="image"
                            />
                    </div>
                    <div class="col  offset-xl-1 ">
                        <div class="d-flex align-items-center justify-content-center my-4">
                            <span class="text-success fs-1 fontText text-uppercase"
                                  >Login</span
                            >
                        </div>
                        <form id="login-form" action="AccountServlet" method="POST">
                            <!-- Email input -->
                            <div class="form-floating mb-3">
                                <input
                                    type="email"
                                    class="form-control"
                                    name="txtEmail"
                                    value=""
                                    placeholder="name@example.com"
                                    />
                                <label for="floatingInput">Email address</label>
                            </div>

                            <!-- Password input -->
                            <div class="form-floating mb-3">
                                <input
                                    type="password"

                                    class="form-control"
                                    name="txtPass" 
                                    value=""
                                    placeholder="Password"
                                    />
                                <label for="floatingPassword">Password</label>
                            </div>
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
                                        Remember me(Up-coming)
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
                                class="divider d-flex align-items-center justify-content-center my-4"
                                >
                                <div
                                    id="g_id_onload"
                                    data-client_id="15935712647-nge50dcde86pqvnulkvpiumetofdu05r.apps.googleusercontent.com"
                                    data-context="signin"
                                    data-ux_mode="popup"
                                    data-login_uri="http://localhost:8080/"
                                    data-itp_support="true"
                                    data-callback="handleCredentialResponse"
                                    ></div>

                                <div
                                    class="g_id_signin"
                                    data-type="standard"
                                    data-shape="pill"
                                    data-theme="filled_blue"
                                    data-text="signin_with"
                                    data-size="large"
                                    data-logo_alignment="left"
                                    ></div>
                            </div>
                            <a href="<%=APIWrapper.getDiaLogLink()%>">Login via Facebook</a> 
                            <div
                                class="divider d-flex align-items-center justify-content-center my-4 fw-bolder"
                                >
                                <span>Doesn't have an account? </span>
                                <a href="register.jsp" class="text-success px-1"> Sign Up for free</a>
                            </div>
                            <!-- 
                            <a
                              class="btn btn-primary btn-lg btn-block"
                              style="background-color: #3b5998"
                              href="#!"
                              role="button"
                            >
                              <i class="fab fa-facebook-f me-2"></i>Continue with Facebook
                            </a>
                            <a
                              class="btn btn-primary btn-lg btn-block"
                              style="background-color: #55acee"
                              href="#!"
                              role="button"
                            >
                              <i class="fab fa-twitter me-2"></i>Continue with Twitter</a
                            >
                            -->
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://accounts.google.com/gsi/client" async defer></script>
        <script src="./js/bootstrap.bundle.js" crossorigin="anonymous"></script>
    </body>
</html>
