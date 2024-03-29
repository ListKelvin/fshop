<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:import url="include/Header.jsp"><c:param name="title" value="Error Page"/></c:import>
    <div class="container minHeithStyled ">
        <div class="row">
            <div class="card text-center" style="background: transparent;">
                <div class="card-img-top">

                    <img src="assest/wrong.png" width="500"  alt="403"/>
                </div>
                <div class="card-body">
                
                    <p class="text-danger">${requestScope.message}</p>
                <button type="button" onClick="goBack()" class="btn btn-primary btn-sm">Go Back</button>
                <button type="button" onClick="goHome()" class="btn btn-primary btn-sm">Go Home</button>
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