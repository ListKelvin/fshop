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
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="scss/_root.scss"/>
        <title>Register</title>
    </head>
    <body>
        <h3 class="text-primary">Register</h3>
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


        <p>
            <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample" aria-expanded="false" aria-controls="collapseWidthExample">
                Toggle width collapse
            </button>
        </p>
        <div style="min-height: 120px;">
            <div class="collapse collapse-horizontal" id="collapseWidthExample">
                <div class="card card-body" style="width: 300px;">
                    This is some placeholder content for a horizontal collapse. It's hidden by default and shown when triggered.
                </div>
            </div>
        </div>
        
        <script src="./js/bootstrap.bundle.js" crossorigin="anonymous"></script>
    </body>
</html>
