<%-- 
    Document   : test
    Created on : Jun 30, 2023, 6:02:55 PM
    Author     : Minh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="DTO.AccountInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags/"%>
<%

    AccountInfo user = (AccountInfo) request.getSession().getAttribute("user");
    if (user != null) {
        request.setAttribute("user", user);
    }
%> 
<c:import url="include/Header.jsp"><c:param name="title" value="Setting Profile"/></c:import>
    <section class="container p-5 minHeithStyled d-flex align-items-start justify-content-center">


        <div class="row ">
        <c:set value="${requestScope.userinfo}" var="user"/>
        <main class="col-6  box  " role="main" style="padding: 5rem;">
            <h1 class="mb-5" style="color: #BC6EEE;">User Information</h1>

<!--            <p>${user.account_id}</p>-->
            <!--                    <c:if test="${not empty user.avatar}">
           <img src="images/${user.avatar}" width="300" height="300" class="rounded mx-auto d-block rounded-circle" alt="logo">
            </c:if>
            <c:if test="${empty user.avatar}">
                <img src="images/anonymous_avatar.jpg" width="300" height="300" class="rounded mx-auto d-block rounded-circle" alt="logo">
            </c:if>-->
            <form id="update-form" method="post" class="row g-4 align-items-center justify-content-center" action="${pageContext.request.contextPath}/MainController?action=UpdateUserInfo" enctype="multipart/form-data">

                <div class=" col-12 col-lg-6 d-flex align-items-center justify-content-center flex-column ">

                    <div class="position-relative">


                        <img src="images/${user.avatar}" onError="this.onerror=null;this.src='./assest/linn.jpg';" id="image"  width="200" height="200" class="rounded mx-auto d-block rounded-circle" alt="logo">
                            <div class="form-group">

                                <input  name="avtUrl" accept="image/*" type="file" value="${user.avatar}" class="form-control-file" id="file" style="display: none">

                            </div>
                            <button onclick="document.getElementById('file').click()" class="btnEditAvatar ${param.updateStatus == 0 ?"d-none" :""}"  title="btnEditAvatar" type="button"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                    <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                                </svg></button>
                    </div>    
                    <p class="m-0"> ${user.name}</p>
                    <p>ngày tham gia: 31/02/2003</p>
                    <input type="hidden" name="avtStr" value="${user.avatar}" />

                </div>

                <div class=" col-12 col-lg-6">
                    <div class="row  ">
                        <div class="col-12 col-md-6 p-3">
                            <div class="form-group">
                                <label for="nameTxt"> Name</label>
                                <input type="text" class="form-control  form-control-lg" id="nameTxt" name="nameTxt" value="${user.name}" aria-describedby="nameTxt"  ${param.updateStatus == 0 ? "readonly" : "" }>
                                    <p id="fullnameErr" style="color: white"></p>
                            </div>
                            <div class="form-group">
                                <label for="dobTxt">Date of birth</label>
                                <input  type="date" class="form-control  form-control-lg" name="dobTxt" placeholder="dd/mm/yyyy" id="dobTxt"  value="${user.dob}" aria-describedby="dobTxt"  ${param.updateStatus == 0 ?"readonly" : "" }>
                            </div>


                        </div>
                        <div class="col-12 col-md-6 p-3">
                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <input type="number" class="form-control  form-control-lg" id="phone" name="phoneTxt" value="${user.phone}" aria-describedby="phone"  ${param.updateStatus == 0 ? "readonly" : "" }>
                                    <p id="phoneErr" style="color: white"></p>
                            </div>

                            <div class="split-pane-divider"></div>
                            <div class="form-group">
                                <label for="genderTxt">Gender</label>
<!--                                <input type="text" class="form-control  form-control-lg" id="genderTxt" name="genderTxt"  value="${user.gender}" aria-describedby="genderTxt">-->
                                <select  class="form-select form-control-lg" id="genderTxt"   name="genderTxt" aria-label="Default select example"  ${param.updateStatus == 0 ? "disabled ": "" }>
                                    <option value="${user.gender}">${user.gender}</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>

                                </select>
                            </div>
                        </div>
                    </div>


                    <div class="form-group ">
                        <label for="addressTxt">Address</label>
                        <input type="text" class="form-control  form-control-lg" id="addressTxt" name="addressTxt" value="${user.address}" aria-describedby="addressTxt" ${param.updateStatus == 0 ? "readonly": "" }>
                    </div> 

                </div>



                <input type="hidden" name="accountId" value="${user.account_id}" />
                <!--<input value="UpdateUserInfo" name="action" type="hidden">-->

                <div class="  mt-5 w-50 d-flex gap-4">
<!--                    <form action="MainController ${param.updateStatus != 0 ?"d-none" :""}">
                        <input name="action" value="ViewUserInfo" type="hidden"/>
                        <input name="updateStatus" value="1" type="hidden"/>
                        <input class="btnPlaceOrder" type="submit" value=" Edit Profile"/>
                    </form>-->
                    <a class="btnPlaceOrder ${param.updateStatus != 0 ?"d-none" :""}" href="${pageContext.request.contextPath}/MainController?action=ViewUserInfo&updateStatus=1">Edit Profile</a>
                    
                    <a  class="btnPlaceOrder ${param.updateStatus == 0 ?"d-none" :""}" onclick="window.location.href='${pageContext.request.contextPath}/MainController?action=ViewUserInfo&updateStatus=0'">Cancel</a>

                    <button type="submit" class="btnPlaceOrder ${param.updateStatus == 0 ?  "d-none" :""}">Yes</button>
                </div>




            </form>
        </main>
    </div>

</section>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>            
<script>
                                document.getElementById('file').onchange = function () {
                                    var src = URL.createObjectURL(this.files[0])
                                    document.getElementById('image').src = src
                                }

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
                                            $('#fullnameErr').addClass("text-danger");
                                            count++;
                                        } else {
                                            $('#fullnameErr').removeClass("text-danger");
                                        }
                                        ;
                                        if (!isVietnamesePhoneNumber(phone.val())) {
                                            count++;
                                            $('#phoneErr').text("Phone is not correct");
                                            $('#phoneErr').addClass("text-danger");
                                        } else {
                                            $('#phoneErr').removeClass("text-danger");
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
                                        ;
                                    });
                                });
</script>
<c:import url="include/Footer.jsp"></c:import>