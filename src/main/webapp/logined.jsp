<%-- 
    Document   : logined
    Created on : Jun 3, 2023, 3:35:18 AM
    Author     : 03lin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    < <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logined</title>
    </head>
    <body>
    <c:set var="user" value="${sessionScope.user}"></c:set>
    
    <h1>Hello, ${user.name}</h1>
    
    <p>Your username: ${user.name}</p>
    <c:if test="${user.facebookID == null}">
        <p>you login using normal account</p>
    </c:if>
        
    <c:if test="${user.facebookID != null}">
        <p>you login using fb account</p>
        <p>FB ID: ${user.facebookID}</p>
        <p>FB Link: ${user.link}</p>
    </c:if>
        
    <c:url value="AccountServlet" var="logOutUrl">
        <c:param name="btAction" value="Logout"/>
    </c:url>
        <a href="${logOutUrl}">Logout</a>
    </body>
</html>
