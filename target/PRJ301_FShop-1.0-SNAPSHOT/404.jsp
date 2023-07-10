<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:import url="include/Header.jsp"><c:param name="title" value="404"/></c:import>
    <div class="container minHeithStyled ">
        <div class="row">
            <div class="card text-center" style="background: transparent;">
                <div class="card-img-top">

                    <img src="assest/404.png" width="800"  alt="403"/>
                </div>
                <div class="card-body " >
                    <h5 class="card-title text-danger">Sorry :<</h5>
                    <p class="text-danger">${requestScope.message}</p>

                <button type="button" onclick="goHome()" class="btn btn-primary btn-large">Go Home</button>
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
<c:import url="include/Footer.jsp"> </c:import>