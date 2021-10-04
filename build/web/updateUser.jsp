<%-- 
    Document   : updateUser
    Created on : Oct 3, 2021, 8:29:50 PM
    Author     : HuuToan
--%>

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

        <title>Title page</title>  

        <link href="app.css" rel="stylesheet">
        <link href="Profile/New folder/main.a3f694c0.css" rel="stylesheet">

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
                        <a class="navbar-brand" href="./index.html" title="">
                            <img src="./assets/images/mashuptemplate.svg" class="navbar-logo-img" alt="">
                        </a>
                    </div>

                    <div class="collapse navbar-collapse" id="navbar-collapse-uarr">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="user.jsp" title="" class="active">Home</a></li>
                            <li><a href="/Subject/MyCourse.html" title="" > Subject</a></li>
                            <!-- <li><a href="updateUser.jsp" title="" > Profile </a></li> -->
                            <li><a href="createUser.jsp" title="" >Đăng Ký</a></li>
                            <li><a href="MainController?action=LoginPage" title="">Đăng Nhập</a></li>
                            <li>
                                <div class="dropdown" style="float:right;">
                                    <button class="dropbtn" style="background-color: #fff;">
                                        <a href="./download.html">
                                            <i class="fas fa-user-circle user" 
                                               style="font-size: 30px;
                                               padding-top: 24px;
                                               padding-left: 8px;">
                                            </i>
                                        </a>
                                    </button>
                                    <div class="dropdown-content" style="left:-12px;">
                                        <a href="updateUser.jsp" class="choose">Profile</a>
                                        <a href="MainController?action=Logout" class="choose">Log out</a>
                                    </div>
                                </div>
                            </li>

                        </ul>
                    </div>
                </div>
            </nav>
        </header>



        <form action="MainController">    
            <div class="container">
                <div class="row gutters">
                    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="account-settings">
                                    <div class="user-profile">
                                        <div class="user-avatar">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin">
                                        </div>
                                        <h3 class="user-name" style="">${sessionScope.LOGIN_USER.name}</h3>
                                        <h6 class="user-email" style="font-size: 13px;">${sessionScope.LOGIN_USER.email}</h6>
                                    </div>
                                    <div class="update">
                                        <h5>Update avatar</h5>
                                        <p><input  type="file"  name="Images" value="${sessionScope.LOGIN_USER.images}"></p>
                                        <!-- <p style="font-size: 13px;">I'm Yuki. Full Stack Designer I enjoy creating user-centric, delightful and human experiences.</p> -->
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
                                </div>
                                <div class="row gutters">
                                    <!-- <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <h6 class="mt-3 mb-2 text-primary">Address</h6>
                                    </div> -->
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="Street">Address</label>
                                            <input name="Address" value="${sessionScope.LOGIN_USER.address}" type="name" class="form-control" id="Street" placeholder="Enter Address">
                                        </div>
                                    </div>
                                    <!-- <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="ciTy">City</label>
                                            <input type="name" class="form-control" id="ciTy" placeholder="Enter City">
                                        </div>
                                    </div> -->                                 
                                </div>


                                <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">
                                            <button type="submit" id="submit" name="action" class="btn btn-secondary">Cancel</button>
                                            <button type="submit" id="submit" name="action" value="UpdateUserPage"   class="btnUpdate btn btn-primary">Update</button>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
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

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID 
        
        <script>
          (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
              (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
              m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
          })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
          ga('create', 'UA-XXXXX-X', 'auto');
          ga('send', 'pageview');
        </script>
        
        --> 
        <script type="text/javascript" src="/New folder/main.41beeca9.js"></script></body>

</html>