<%-- 
    Document   : home
    Created on : Jun 8, 2023, 12:20:50 PM
    Author     : Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="style/index.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <title>Home</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <section class="container d-flex align-items-center justify-content-center">
         
             <tag:product_card category="do dien tu" productName="test" img="./assest/E-commerce_1.png" price="100$"/>
        </section>
       
    </body>
</html>
