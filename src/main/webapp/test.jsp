<%-- 
    Document   : test
    Created on : Jun 30, 2023, 6:02:55 PM
    Author     : Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Header</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="canonical" href="https://getbootstrap.com/docs/4.0/components/navbar/">
        <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/docsearch.js@2/dist/cdn/docsearch.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/4.0/assets/css/docs.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>

        <%--<jsp:include page="header/authenticatedheader.jsp"></jsp:include>--%>
        <div class="container-fluid">
            <div class="row flex-xl-nowrap">
                <%--<jsp:include page="utils/navigation.jsp"></jsp:include>--%>
                <c:set value="${sessionScope.user}" var="user"/>
                <main class="col-md-9 col-xl-9 py-md-3 pl-md-5 bd-content" role="main">
<!--                    <c:if test="${not empty user.avatar}">
                        <img src="images/${user.avatar}" width="300" height="300" class="rounded mx-auto d-block rounded-circle" alt="logo">
                    </c:if>
                    <c:if test="${empty user.avatar}">
                        <img src="images/anonymous_avatar.jpg" width="300" height="300" class="rounded mx-auto d-block rounded-circle" alt="logo">
                    </c:if>-->
                    <form id="update-form" method="post" action="${pageContext.request.contextPath}/MainController?action=UpdateUserInfo" enctype="multipart/form-data">
                        <input type="hidden" name="accountId" value="some thing" />
                        <div class="form-group">
                            <label for="file">Avatar</label>
                            <input name="avtUrl" accept="image/*" type="file" value="${user.avatar}" class="form-control-file" id="file">
                        </div>
                        <input type="hidden" name="avtStr" value="${user.avatar}" />

                        <div class="form-group">
                            <label for="nameTxt"> Name</label>
                            <input type="text" class="form-control" id="nameTxt" name="nameTxt" value="${user.name}" aria-describedby="nameTxt">
                            <p id="fullnameErr" style="color: white"></p>
                        </div>
                        <div class="form-group">
                            <label for="dobTxt">DoB</label>
                            <input  type="date" class="form-control" name="dobTxt" placeholder="dd/mm/yyyy" id="dobTxt" aria-describedby="dobTxt">
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="text" class="form-control" id="phone" name="phoneTxt" value="${user.phone}" aria-describedby="phone">
                            <p id="phoneErr" style="color: white"></p>
                        </div>

                        <div class="split-pane-divider"></div>
                        <div class="form-group">
                            <label for="genderTxt">Gender</label>
                            <input type="text" class="form-control" id="genderTxt" name="genderTxt" aria-describedby="genderTxt">

                        </div>
                        <div class="form-group">
                            <label for="addressTxt">Address</label>
                            <input type="text" class="form-control" id="addressTxt" name="addressTxt" aria-describedby="addressTxt">
                        </div>
                        <button type="submit" class="btn btn-primary">Update Profile</button>
                    </form>
                </main>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>            
        <script>
            function isVietnamesePhoneNumber(number) {
                return /(03|07|08|09|01[2|6|8|9])+([0-9]{8})\b/.test(number);
            }
            $(document).ready(function () {
                $('#update-form').submit(function (e) {
                    let fullname = $('#fullname');
                    let phone = $('#phone');
                    let password = $('#password');
                    let confirm = $('#confirm');
                    let count = 0;
                    if (fullname.val().length === 0) {
                        $('#fullnameErr').text("Fullname is not null");
                        $('#fullnameErr').addClass("text-danger")
                        count++;
                    } else {
                        $('#fullnameErr').removeClass("text-danger")
                    }
                    if (!isVietnamesePhoneNumber(phone.val())) {
                        count++;
                        $('#phoneErr').text("Phone is not correct");
                        $('#phoneErr').addClass("text-danger");
                    } else {
                        $('#phoneErr').removeClass("text-danger")
                    }
                    if (phone.val().length === 0) {
                        count++;
                        $('#phoneErr').text("Phone is not null");
                        $('#phoneErr').addClass("text-danger");
                    } else {
                        $('#phoneErr').removeClass("text-danger")
                    }
                    if (confirm.val() !== password.val()) {
                        count++;
                        $('#confirmErr').text("Confirm Password must be like Password");
                        $('#confirmErr').addClass("text-danger");
                    } else {
                        $('#confirmErr').removeClass("text-danger");
                    }
                    if (password.val().length > 0) {
                        if (password.val().length < 6 || password.val().length > 20) {
                            count++;
                            $('#passErr').text("Password be from 6 to 20 character!");
                            $('#passErr').addClass("text-danger");
                        } else {
                            $('#passErr').removeClass("text-danger");
                        }
                    }
                    if (count > 0) {
                        e.preventDefault();
                    }
                })
            });
        </script>
    </body>
</html>
