<%-- 
    Document   : user
    Created on : Sep 30, 2021, 10:37:09 AM
    Author     : toannh
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
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
        <!-- SLICK CAROUSEL  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" />

        <title>Find Mentor</title>  

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
            /************************* card subject *************************/
            .card {
                position: relative;
            }

            .tooltip {
                position: absolute;
            }

            .tooltip-text {
                position: absolute;
                top: 0;
                left: 23%;
                transform: translate(65%, -195%);
                background-color: #3d6ef7;
                padding: 20px 40px;
                display: block;
                color: white;
                border-radius: 20px;
            }

            .cardd {
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
                max-width: 300px;
                margin: auto;
                text-align: center;
                margin-bottom: 35px;
            }

            .title {
                color: grey;
                font-size: 18px;
            }

            a {
                text-decoration: none;
                font-size: 22px;
                color: black;
            }

            button:hover,
            a:hover {
                opacity: 0.7;
            }
            /************************* End card *************************/
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
    <body style="background-color: #e9dcdc">

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
                        <a style="margin-left: -160px" class="navbar-brand" href="MainController?action=Load" title="">
                            <img src="assets/images/icon.jpg" class="navbar-logo-img" alt="">
                        </a>
                    </div>
                    <div class="collapse navbar-collapse" id="navbar-collapse-uarr">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="MainController?action=Load" style="font-size: 25px; font-weight: 700" title="" class="active">Home</a></li>
                            <li>
                                <div class="dropdown" style="float:right;margin-top: 22px; font-size: 20px; font-weight: 700">
                                    <a href="MainController?action=ShowAll"  style="color: #888;"> Subject</a>
                                    <!-- <div class="dropdown-content" style="left:-20px;">
                                      <a href="./MyCourse.html" class="choose" style="padding: 10px 0 7px 10px;">My Course</a>
                                      <a href="#" class="choose" style="padding: 10px 0 7px 10px;">All Couse</a>
                                      <a href="#" class="choose" style="padding: 10px 0 7px 10px;">Add Couse</a>
                                    </div> -->
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
                                                    <img style="border-radius: 50%; width: 45px; height: 45px; font-size: 30px; margin-top: 15px; margin-left: 15px;" src="${sessionScope.LOGIN_USER.images}" alt="photo2">
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
        <div class="white-text-container background-image-container" style="background-image: url('./assets/images/img-home.jpg')">
            <div class="opacity"></div>
            <div class="container">
                <form action="MainController" method="POST">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="text" name="txtSearch" class="input" placeholder="Search" style="width: 50%;">
                            <button type="submit" name="action" value="Search"><i class="fa fa-search"></i></button>
                            <!--<input type="submit" value="Search" name="action">-->
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="section-container border-section-container">
            <div class="container">
                <div class="col-lg-4 mb-4 col-sm-6">
                    <div class="card_item card_item_custom">
                        <img src="${requestScope.rank1.images}"style="border-radius: 50%" class="card-img-top" alt="...">
                        <div class="cardx-body">
                            <div class="cardx-name" style="font-size: 25px;">Top 1</div>
                            <p class="card-text" style="height: 40px">${requestScope.rank1.name}</p>
                            <div class="dropdownb">
                                <div class="detailButton" style="background-color: #d7d9d7;font-size: 25px">Chi tiết</div>
                                <div class="dropdown-contentb">
                                    <div class="inforbox" style="background-color: #f9f9f9">
                                        <h12>contact: ${requestScope.rank1.phoneNumber}</h12><br>
                                        <h113>Email: ${requestScope.rank1.email}</h113><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4 col-sm-6">
                    <div class="card_item card_item_custom">
                        <img src="${requestScope.rank2.images}" style="border-radius: 50%" class="card-img-top" alt="...">
                        <div class="cardx-body">
                            <div class="cardx-name" style="font-size: 25px;">Top 2</div>
                            <p class="card-text" style="height: 40px">${requestScope.rank2.name}</p>
                            <div class="dropdownb">
                                <div class="detailButton" style="background-color: #d7d9d7;font-size: 25px">Chi tiết</div>
                                <div class="dropdown-contentb">
                                    <div class="inforbox" style="background-color: #f9f9f9">
                                        <h12>contact: ${requestScope.rank2.phoneNumber}</h12><br>
                                        <h113>Email: ${requestScope.rank2.email}</h113><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                
                <div class="col-lg-4 mb-4 col-sm-6">
                    <div class="card_item card_item_custom">
                        <img src="${requestScope.rank3.images}" style="border-radius: 50%" class="card-img-top" alt="...">
                        <div class="cardx-body">
                            <div class="cardx-name" style="font-size: 25px;">Top 3</div>
                            <p class="card-text" style="height: 40px">${requestScope.rank2.name}</p>
                            <div class="dropdownb">
                                <div class="detailButton" style="background-color: #d7d9d7;font-size: 25px">Chi tiết</div>
                                <div class="dropdown-contentb" >
                                    <div class="inforbox" style="background-color: #f9f9f9">
                                        <h12>contact: ${requestScope.rank3.phoneNumber}</h12><br>
                                        <h113>Email: ${requestScope.rank3.email}</h113><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${sessionScope.LOGIN_USER == null}">
                <div class="section-container white-text-container" style='margin-top: 45px;'>
                    <div class="container">  
                        <c:forEach items="${requestScope.search}" var="all">
                            <div class="col-lg-3 mb-3 col-sm-6">
                                <div class="cardd" style=" padding-top: 10px; background-color: #f9f9f9">
                                    <img src="${all.images}" alt="John" style="max-height:  100px" />
                                    <h1>${all.subjectName}</h1>
                                    <p class="title">${all.description}</p>
                                    <p>Harvard University</p>
                                    <button  class="btn btn-success">
                                        <a style="color: white" href="login.html">Join Class</a>
                                    </button>
                                    <button  class="btn btn-success">
                                        <a style="color: white" href="login.html"> Detail </a>
                                    </button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <c:if test="${sessionScope.LOGIN_USER != null}">
                <div class="section-container white-text-container" style='margin-top: 45px;'>
                    <div class="container">  
                        <c:forEach items="${requestScope.search}" var="all">
                            <div class="col-lg-3 mb-3 col-sm-6">
                                <div class="cardd" style=" padding-top: 10px; background-color: #f9f9f9">
                                    <img src="${all.images}" alt="John" style="max-height:  100px" />
                                    <h1>${all.subjectName}</h1>
                                    <p class="title">${all.description}</p>
                                    <p>Harvard University</p>
                                    <button  class="btn btn-success">
                                        <a style="color: white" href="MainController?action=Enroll&subjectId=${all.subjectId}">Join Class</a>
                                    </button>
                                    <button  class="btn btn-success">
                                        <a style="color: white" href="MainController?action=LoadSubjectPage&subjectId=${all.subjectId}">  Detail </a>
                                    </button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <div class="section-container">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">

                            <section class="service">
                                <div class="service__content">
                                    <div class="service__title">
                                        <h1>Subjects</h1>           
                                    </div>

                                    <div class="service__slider">
                                        <div class="slick-slider">
                                            <div class="item">
                                                <i class="fa fa-dice-d6"></i>
                                                <p>
                                                    APP MOBILE<br>DEVELOPMENT
                                                </p>
                                            </div>

                                            <div class="item">
                                                <i class="fab fa-autoprefixer"></i>
                                                <p>
                                                    DIGITAL<br> MARKETING
                                                </p>
                                            </div>
                                            <div class="item">
                                                <i class="fab fa-500px"></i>
                                                <p>
                                                    SEO &amp; CONTENT <br>WRITING
                                                </p>
                                            </div>
                                            <div class="item">
                                                <i class="fa fa-blog"></i>
                                                <p>
                                                    WEBSITE<br>DEVELOPMENT
                                                </p>
                                            </div>
                                            <div class="item">
                                                <i class="fab fa-battle-net"></i>
                                                <p>
                                                    SEO &amp; CONTENT <br>WRITING
                                                </p>
                                            </div>
                                            <div class="item">
                                                <i class="fa fa-memory"></i>
                                                <p>
                                                    APP MOBILE<br>DEVELOPMENT
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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

                        <p>International</p>
                        <p>Courses</p>
                    </div>

                    <div class="footer__quickLinks item">
                        <h3 style="color: white; font-weight: bold; font-size: 25px">
                            Quick Links
                        </h3>
                        <p><a href="MainController?action=Load" style="color: white">Home</a></p>
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
        </script>





        <script type="text/javascript" src="./main.41beeca9.js"></script>

        <!-- JQUERY  -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
        <!-- SLICK CAROUSEL  -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js" ></script>

        <!-- HANDLE SLICK CAROUSEL -->
        <script type="text/javascript">
            $(document).ready(function () {
                $('.slick-slider').slick({
                    //settings
                    infinite: true,
                    slidesToShow: 5,
                    slidesToScroll: 1,
                    autoplay: true,
                    dots: true,
                    arrows: false,
                });
            });
        </script>

    </body>
</html>
