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
            <h4>${requestScope.messageUserName}</h4> 
            Email <input type="text" name="txtEmail" value="" /> <br/>
            <h4>${requestScope.messageEmail}</h4> 
            Password <input type="password" name="txtPass" value=""> <br/>
            <h4>${requestScope.messagePassword}</h4> 
            <input type="submit" name="btAction" value="Register"/> 
            <h4>${requestScope.message}</h4>   
        </form>
    </body>
</html>
