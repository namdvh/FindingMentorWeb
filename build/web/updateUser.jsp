<%-- 
    Document   : updateUser
    Created on : Oct 3, 2021, 8:29:50 PM
    Author     : HuuToan
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta content="IE=edge" http-equiv="X-UA-Compatible">
        <meta content="width=device-width,initial-scale=1" name="viewport">
        <meta content="description" name="description">
        <meta name="google" content="notranslate" />
        <meta content="Mashup templates have been developped by Orson.io team" name="author">

        <!-- Disable tap highlight on IE -->
        <meta name="msapplication-tap-highlight" content="no">

        <link href="assets/apple-touch-icon.png" rel="apple-touch-icon">
        <link href="assets/favicon.ico" rel="icon">

        <!-- link Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
              integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
              crossorigin="anonymous" />

        <title>Update Page</title>  

        <link href="Profile/app.css" rel="stylesheet">
        <link href="New folder/main.a3f694c0.css" rel="stylesheet">

        <!-- Style dropdown -->
        <style>
            .dropbtn {
                font-size: 16px;
                border: none;
                cursor: pointer;
            }

            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown:hover .dropbtn .user{
                color: #5876FC;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                right: 0;
                background-color: #f9f9f9;
                min-width: 90px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content .choose {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content .choose:hover{
                background-color: #5876FC; 
                transition: all .5s;
                color: #ffff;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }
    
        </style>
    </head>
    <body>
        <!-- Add your content of header -->
        <jsp:include page="headerTemplate.jsp"></jsp:include>
       <!--end of header-->
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <form action="UpdateUserController" method="POST" enctype="multipart/form-data"  >
            <div class="container">
                <div class="row gutters">
                    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="account-settings">
                                    <div class="user-profile">
                                        <div class="user-avatar">
                                            <img src="${sessionScope.LOGIN_USER.images}" alt="photo2">
                                        </div>
                                        <h3 class="user-name" style="">${sessionScope.LOGIN_USER.name}</h3>
                                        <h6 class="user-email" style="font-size: 13px;">${sessionScope.LOGIN_USER.email}</h6>
                                    </div>
                                    <div class="update">
                                        <p><input class="btn btn-success" style="font-size: 12px; margin-top: 35px"  type="file" name="ProfileImage"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">                                        
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="fullName">Full Name</label>
                                            <input name="Name" value="${sessionScope.LOGIN_USER.name}" type="text" class="form-control" id="fullName" placeholder="Enter full name" >
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="eMail">Email</label>
                                            <input name="Email" value="${sessionScope.LOGIN_USER.email}" type="email" class="form-control" id="email" placeholder="Enter email ID">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="phone">Phone</label>
                                            <input type="tel" value="${sessionScope.LOGIN_USER.phoneNumber}" id="phone" pattern="[0-9]{10,10}" class="form-control" name="phone" placeholder="0123456789"  required>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="website">Birthday</label>
                                            <input name="BirthDay" value="${sessionScope.LOGIN_USER.birthday}" type="date" class="form-control" id="website" placeholder="Birthday">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="website">Role</label>
                                            <input name="roleName" value="${sessionScope.LOGIN_USER.roleID}" type="text" readonly="" class="form-control" id="website" placeholder="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row gutters">
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="Street">Address</label>
                                            <input name="Address" value="${sessionScope.LOGIN_USER.address}" type="name" class="form-control" id="Street" placeholder="Enter Address">
                                        </div>
                                    </div>                               
                                </div>
                                <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">                                       
                                            <button type="submit"  name="action" value="UpdateUserPage"  class="btnUpdate btn btn-primary">Update</button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
<!--start of footer-->
<jsp:include page="footerTemplate.jsp"></jsp:include>
  <!--end off footer-->                                         
        <script>
            document.addEventListener("DOMContentLoaded", function (event) {
                navActivePage();
            });
            function validateEmail(email) {
                const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return re.test(email);
            }

            function validate() {
                const $result = $("#result");
                const email = $("#email").val();
                $result.text("");

                if (validateEmail(email)) {
                    $result.text(email + " is valid :)");
                    $result.css("color", "green");
                } else {
                    $result.text(email + " is not valid :
                            (");
                            $result.css("color", "red");
                        }
                        return false;
                    }

                    $("#email").on("input", validate);
        </script>
        <script type="text/javascript" src="/New folder/main.41beeca9.js"></script></body>

</html>