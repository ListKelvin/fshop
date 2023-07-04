<%-- 
    Document   : create-product
    Created on : Jun 19, 2023, 3:37:07 PM
    Author     : 03lin
--%>

<%@page import="DTO.AccountInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AccountInfo user = (AccountInfo) request.getSession().getAttribute("user");
    if (user == null) {
        request.setAttribute("message", "Unauthentication!!");
        response.sendRedirect("index.jsp");
    } else {
        if (user.getEmail().equals("admin123@gmail.com")) {
            request.setAttribute("user", user);
        } else {
            request.setAttribute("message", "Unauthorization!!");
            response.sendRedirect("home.jsp");
        }
    }


%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Product Page</title>
    </head>
    <body>
        <p>${requestScope.message}</p>
        <form action="CreateProduct" method="POST">
            <table>
                <tr><td>title</td><td><input name="title"  type="text"></td></tr>
                <tr><td>description</td><td><input name="description"  type="text"></td></tr>
                <tr><td>category</td><td><input name="category" type="text"></td></tr>
                <tr><td>price</td><td><input name="priceStr" type="text"></td></tr>
                <tr><td>quantity</td><td><input name="quantityStr" type="text"></td></tr>
                <tr><td>image</td><td><input name="image" type="text"></td></tr>
            </table>
            <input value=Save type="Submit">
        </form>
    </body>
</html>
