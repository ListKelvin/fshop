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
    </body>
</html>
