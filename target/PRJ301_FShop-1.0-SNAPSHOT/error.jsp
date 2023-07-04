<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:import url="page/Header.jsp"><c:param name="title" value="Error Page"/></c:import>
    <div class="container minHeithStyled ">
        <div class="row">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title text-danger">Something went wrong!</h5>
                    <p class="text-danger">${requestScope.message}</p>
                <button type="button" onclick="goBack()" class="btn btn-primary btn-sm">Go Back</button>
                <button type="button" onclick="goHome()" class="btn btn-primary btn-sm">Go Home</button>
            </div>
        </div>
    </div>
</div>

<script>
    function goBack() {
        window.history.back();
    }
    function goHome() {
        window.location.href = "index.jsp";
    }
</script>
<c:import url="page/Footer.jsp"> </c:import>