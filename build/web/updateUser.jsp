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
              /************************* FOOTER *************************/
      .footer {
        color: #ffff;
        background-color: #78036eba;;
      }

      .footer__media {
        display: flex;
        width: 74%;
        margin: 0 auto;
        padding-top: 4rem;
      }
      .footer__contact {
        line-height: 2.4rem;
      }

      .footer__contact a {
        text-decoration: none;
        color: #ffff;
        padding: 3rem 0;
      }

      .footer__media h3 {
        padding-bottom: 2.5rem;
      }

      .location {
        display: flex;
        /* justify-content: center; */
        line-height: 2.4rem;
      }

      .phone {
        margin: 1rem 0;
      }
      .item {
        margin-right: 7rem;
      }

      .item i {
        margin-right: 1rem;
        color: #fdc800;
      }

      .footer__featuredLinks {
        margin-right: 24rem;
      }

      .footer__featuredLinks p {
        line-height: 3rem;
      }

      .footer__quickLinks p {
        line-height: 3rem;
      }

      .hr {
        width: 75%;
        margin: 0 auto;
       
      }

      .footer__privacy {
        display: flex;
        width: 80%;
        margin: 0 auto;
        padding-left: 4rem;
      }

      .footer__privacy p:first-child {
        margin-right: 60rem;
      }

      footer__privacy p:last-child {
        padding-left: 6rem;
      }

      #pivacy {
        padding: 0 3.5rem;
      }
      /************** END FOOTER **************/

        </style>
    </head>

    <body>
        <!-- Add your content of header -->
        <header>
            <nav class="navbar  navbar-fixed-top navbar-default">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle uarr collapsed" data-toggle="collapse" data-target="#navbar-collapse-uarr">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a style="margin-left: -160px" class="navbar-brand" href="user.jsp" title="">
                            <img src="assets/images/icon.jpg" class="navbar-logo-img" alt="">
                        </a>
                    </div>
                    <div class="collapse navbar-collapse" id="navbar-collapse-uarr">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="user.jsp" title="" class="active">Home</a></li>
                            <li>
                                <div class="dropdown" style="float:right;margin-top: 26px;">
                                    <a href="MainController?action=ShowAll"  style="color: #888;"> Subject</a>
                                </div>
                            </li>
                            <!-- LOGIN LOGOUT -->
                            <!-- <li><a href="./pricing.html" title="" > Profile </a></li> -->
                            <c:if test="${sessionScope.LOGIN_USER == null}">
                                <li><a href="createUser.jsp" title="" >Đăng Ký</a></li>
                                <li><a href="MainController?action=LoginPage" title="">Đăng Nhập</a></li>
                                <li>                              
                                    <!-- comment dropdown luc nay chua hien avata neu chua damng nhap -->
                                    <div class="dropdown" style="float:right;">
                                        <button class="dropbtn" style="background-color: #fff;">
                                            <a href="login.html">
                                                <i class="fas fa-user-circle user" 
                                                   style="font-size: 30px;
                                                   padding-top: 24px;
                                                   padding-left: 8px;
                                                   ">
                                                </i>
                                            </a>
                                        </button>
                                        <!-- comment fix here link to updateUser,jsp-->
                                        <div class="dropdown-content" style="left:-12px;">
                                            <a href="login.html" class="choose">Profile</a>
                                            <a href="MainController?action=Logout" class="choose">Log out</a>
                                        </div>
                                    </div>
                                </li>
                            </c:if>
                            <!--khuc nay de hien avatar cho taskbar neu da dang nhap -->
                            <c:if test="${sessionScope.LOGIN_USER != null}">
                                <li>
                                    <div class="dropdown" style="float:right;">
                                        <button class="dropbtn" style="background-color: #fff;">
                                            <a href="updateUser.jsp">
                                                <i>
                                                    <img style="border-radius: 30px; width: 60px; height: 60px; font-size: 30px; margin-top: 15px" src="${sessionScope.LOGIN_USER.images}" alt="photo2">
                                                </i>       
                                            </a>
                                        </button>
                                        <div class="dropdown-content" style="left:-12px;">
                                            <a class="choose">${sessionScope.LOGIN_USER.name}</a>
                                            <a href="updateUser.jsp" class="choose">Profile</a>
                                            <a href="MainController?action=Logout" class="choose">Log out</a>
                                        </div>
                                    </div>
                                </li>
                            </c:if>           
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <form action="UpdateUserController" method="POST" enctype="multipart/form-data">
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
                                        <p><input class="btn btn-success" style="font-size: 15px; margin-top: 35px"  type="file" name="ProfileImage"></p>
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
                                        <h6 class="mb-2 text-primary">Personal Details</h6>
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
 <footer>
        <div class="footer">
            <div class="footer__media">
                <div class="footer__contact item">
                    <h3 style="color: white; font-weight: bold; font-size: 25px">
                        Contact Us
                    </h3>
                    <div class="location" >
                        <i class="fas fa-map-marker-alt" ></i>
                        <p>
                            <a href="https://www.google.com/maps/place/Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+FPT+TP.+HCM/@10.8414899,106.8078577,17z/data=!3m1!4b1!4m5!3m4!1s0x31752731176b07b1:0xb752b24b379bae5e!8m2!3d10.8414846!4d106.8100464">
                                Lô E2a-7, Đường D1, Khu Công Nghệ Cao, Long Thạnh Mỹ, <br/> 
                                Thành Phố Thủ Đức, Thành phố Hồ Chí Minh 700000, <br/>Việt Nam
                            </a>


                        </p>
                    </div>
                    <div class="phone">
                        <i class="fas fa-phone-alt"></i>
                        <a style="font-weight: bold; font-size: 15px"
                           >+84 2873 0055 88</a
                        >
                    </div>
                    <div class="email">
                        <i class="far fa-envelope-open"></i>
                        <a style="font-weight: bold; font-size: 15px"
                           >toannhse140397@fpt.edu.vn</a
                        >
                    </div>
                </div>

                <div class="footer__featuredLinks item">
                    <h3 style="color: white; font-weight: bold; font-size: 25px">
                        Featured Links
                    </h3>
                    <p>Graduation</p>
                    <p>Admissions</p>
                    <p>Book Store</p>
                    <p>International</p>
                    <p>Courses</p>
                </div>

                <div class="footer__quickLinks item">
                    <h3 style="color: white; font-weight: bold; font-size: 25px">
                        Quick Links
                    </h3>
                    <p>Home</p>
                    <p>About</p>
                    <p>Services</p>
                    <p>Blog</p>
                    <p>Contact</p>
                </div>
            </div>

            <div class="hr">
                <hr style="color: #454545" />
            </div>

            <div class="footer__privacy">
                <p>© 2021 C4. All rights reserved</p>
                <p id="pivacy">Privacy policy</p>
                <p>Terms of service</p>
            </div>
        </div>
    </footer>
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