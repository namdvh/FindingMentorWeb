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

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Update Page</title>  

        <link href="Profile/app.css" rel="stylesheet">
        <!--<link href="New folder/main.a3f694c0.css" rel="stylesheet">-->

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

            .form-group .form-control {
                font-size: 15px;
            }
            /*a*/

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
                                    <div class="update" >
                                        <p><input class="btn btn-success" style="font-size: 10px; margin-top: 35px; background-color: white; "  type="file" name="ProfileImage"></p>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body" style="font-size: 18px">
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
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModalLong">
                                                Change Password
                                            </button>

                                            <!-- Modal -->                                       
                                            <button
                                                type="submit"
                                                id="submit"
                                                name="action"
                                                value="UpdateUserPage"
                                                class="btnUpdate btn btn-primary"
                                                >
                                                Update
                                            </button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <form action="MainController" method="POST" >                                
            <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">                                                 
                <div class="modal-dialog" role="document">                                                     
                    <div class="modal-content">                                                         
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Change Password</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="input-wrapper">
                                <input
                                    type="password"
                                    class="inputt" 
                                    placeholder="Enter old password"
                                    name="OldPassword"                                 
                                    />
                                <input
                                    type="password"
                                    class="input"
                                    placeholder="Enter new password"
                                    name="Password"                                             
                                    style="margin-top: 10px"
                                    />
                                <div class="input-icons">
                                    <i class="fa fa-check"></i>
                                    <i class="fa fa-times"></i>
                                </div>
                                <div class="check-list" style="text-align: left">
                                    <div
                                        class="check-item check-length"
                                        data-validation="length"
                                        >
                                        <i class="fa fa-circle"></i> At least 8 characters
                                    </div>
                                    <div class="check-item check-upper">
                                        <i class="fa fa-circle"></i> Contains at least 1
                                        uppercase
                                    </div>
                                    <div class="check-item check-number">
                                        <i class="fa fa-circle"></i> Contains at least 1
                                        number
                                    </div>
                                    <div class="check-item check-special">
                                        <i class="fa fa-circle"></i> Contains at least 1
                                        special character
                                    </div>
                                </div>
                                <input
                                    type="password"
                                    class="input"
                                    placeholder="Confirm new password"
                                    name="ConfirmPassword"                                
                                    />
                                ${requestScope.USER_ERROR.getConfirmPasswordError()}
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" name="action" value="UpdatePassword" class="btn btn-primary">Save changes</button>
                        </div>

                    </div>
                </div>
            </div>
        </form>  
        <c:if test="${not empty submitDone}">
            <script>alert("Change password successful!");
            </script></c:if>
         
            <c:if test="${not empty requestScope.USER_ERROR}">
            <script>alert("${requestScope.USER_ERROR.getConfirmPasswordError()}");
            </script></c:if>
            
             <c:if test="${not empty submitFail}">
            <script>alert("You can't change the same password before!");
            </script></c:if>
            
            <c:if test="${not empty submitFail2}">
            <script>alert("Your old password is wrong");
            </script></c:if>
             <c:if test="${not empty submitFail3}">
            <script>alert("Wrong validate, update Password fail");
            </script></c:if>
            <!--start of footer-->
        <jsp:include page="footerTemplate.jsp"></jsp:include>
        <!--end off footer-->       

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <script>
      $('#myModal').on('shown.bs.modal', function () {
          $('#myInput').trigger('focus')
      })
        </script>

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
        <script>

                    const passwordInput = document.querySelector(".input");
                    passwordInput.addEventListener("input", function (e) {
                        const value = e.target.value;
                        const checkLengthClass = e.target.parentNode.querySelector(".check-length");
                        const checkUpperClass = e.target.parentNode.querySelector(".check-upper");
                        const checkNumberClass = e.target.parentNode.querySelector(".check-number");
                        const checkSpecialClass =
                                e.target.parentNode.querySelector(".check-special");
                        const checkItems = e.target.parentNode.querySelectorAll(".check-item");
                        if (!value) {
                            [...checkItems].forEach((item) => {
                                item.classList.remove("active");
                                item.classList.remove("unactive");
                            });
                            return;
                        }
                        if (value.length < 8) {
                            checkLengthClass.classList.add("unactive");
                            checkLengthClass.classList.remove("active");
                        } else {
                            checkLengthClass.classList.add("active");
                            checkLengthClass.classList.remove("unactive");
                        }
                        passwordInputValidation(checkUpperClass, value, /[A-Z]/);
                        passwordInputValidation(checkNumberClass, value, /[0-9]/);
                        passwordInputValidation(checkSpecialClass, value, /[$@%^&*()}{[\]}!]/);
                    });

                    function passwordInputValidation(selector, value, regex) {
                        if (!regex.test(value)) {
                            selector.classList.add("unactive");
                            selector.classList.remove("active");
                        } else {
                            selector.classList.add("active");
                            selector.classList.remove("unactive");
                        }
                    }
                    ;


        </script>

        <script src="Profile/app.js"></script>
        <!--<script type="text/javascript" src="/New folder/main.41beeca9.js"></script>-->

    </body>

</html>