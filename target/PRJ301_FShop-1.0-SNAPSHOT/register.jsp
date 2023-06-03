<%-- 
    Document   : register
    Created on : Jun 3, 2023, 3:33:33 AM
    Author     : 03lin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h3>Register</h3>
        <form action="AccountServlet" method="POST">
            UserName <input type="text" name="txtUser" value="" /> <br/>
            Password <input type="password" name="txtPass" value=""> <br/>
            <input type="submit" name="btAction" value="Register"/> 
        </form>
    </body>
</html>
