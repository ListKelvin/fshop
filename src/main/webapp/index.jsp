<%-- 
    Document   : index
    Created on : Jun 3, 2023, 3:23:48 AM
    Author     : 03lin
--%>
<%@page import="Utils.APIWrapper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
        <title>F-Shop</title>
    </head>
    <body>
        <h3>Login</h3>
        <form action="AccountServlet" method="POST">
            Email <input type="text" name="txtEmail" value="" /> <br/>
            Password <input type="password" name="txtPass" value=""> <br/>
            <input type="submit" name="btAction" value="Login"/>

            Not have account? Register <a href="register.jsp">here<a/>

                <h4>${requestScope.message}</h4>   
        </form>
        <a href="<%=APIWrapper.getDiaLogLink()%>">Login via Facebook</a> 


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
            data-type="standard"
            data-shape="pill"
            data-theme="filled_blue"
            data-text="signin_with"
            data-size="large"
            data-logo_alignment="left"
            ></div>
        <script src="https://accounts.google.com/gsi/client" async defer></script>

    </body>
</html>
