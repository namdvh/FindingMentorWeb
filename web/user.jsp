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
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
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
            /************************** SERVICES  **************************/

            .services__title {
                padding-top: 9rem;
                margin-bottom: 3rem;
            }

            .services .services__title h6 {
                color: #f55f8d;
                font-size: 22px;
                font-weight: 600;
            }

            h2 {
                color: #262626;
                font-size: 58px;
                font-weight: 800;
            }

            .services .w-100 {
                width: 63% !important;
            }

            .services .col-lg-4 {
                padding: 3rem;
            }
            .services .card {
                display: flex;
                flex-direction: column;
                gap: 1.2rem;
                transition: all 0.5s;
                background-color: #fff;
                border-radius: 1rem;
                border: none;
                overflow: hidden;
                padding: 2rem;
                box-shadow: 5px 10px rgba(136, 136, 136, 0.158);
            }

            .services .services__card .service__item .card:hover {
                transform: translateY(-15px);
            }

            .services .services__card .service__item .icon-content h4 {
                color: #262626;
                font-size: 25px;
                line-height: 1.5;
            }

            .services .services__card .service__item .icon-content p {
                padding: -1px 4.2rem;
            }
            /************************** END SERVICES  **************************/
        </style>
    </head>
    <body style="background-color: #e9dcdc; padding-top: 0">

        <!-- Add your content of header -->
        <jsp:include page="headerTemplate.jsp"></jsp:include>

            <div class="white-text-container background-image-container" style="background-image: url('./assets/images/img-home.jpg')">
                <div class="opacity"></div>
                <div class="container">
                    <form action="MainController" method="POST">
                        <div class="row">
                            <div class="col-md-6" >
                                <input type="text" name="txtSearch" class="input" placeholder="Search" style="width: 70%; height: 50px; font-size: 30px; border-radius: 10px">
                                <button type="submit" name="action" value="Search" style="height: 50px; width: 50px; font-size: 30px; border-radius: 10px"><i class="fa fa-search"></i></button>
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
                                <div class="detailButton" style="background-color: #d7d9d7;font-size: 25px">Detail</div>
                                <div class="dropdown-contentb">
                                    <div class="inforbox" style="background-color: #f9f9f9; font-size: 20px">
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
                                <div class="detailButton" style="background-color: #d7d9d7;font-size: 25px">Detail</div>
                                <div class="dropdown-contentb">
                                    <div class="inforbox" style="background-color: #f9f9f9; font-size: 20px">
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
                                <div class="detailButton" style="background-color: #d7d9d7;font-size: 25px">Detail</div>
                                <div class="dropdown-contentb" >
                                    <div class="inforbox" style="background-color: #f9f9f9; font-size: 20px">
                                        <h12>contact: ${requestScope.rank3.phoneNumber}</h12><br>
                                        <h113>Email: ${requestScope.rank3.email}</h113><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section-container white-text-container" style='margin-top: 45px;'>
                <div class="container">  
                    <!------------- SERVICES ------------->
                    <section
                        class="services"
                        style="
                        background-image: url(./Samar/bg2.png);
                        background-repeat: no-repeat;
                        background-position: top;
                        background-size: 100%;
                        "
                        >
                        <div class="container">
                            <div class="services__card">
                                <div class="service__item py-5">
                                    <div class="row">
                                        <c:forEach items="${requestScope.search}" var="all">
                                            <div class="col-lg-4 col-md-6">
                                                <div class="card">
                                                    <div class="icon-bx-wraper style-7 text-center">
                                                        <div class="icon-media">
                                                            <img style="width: 100px; height: 100px;" src="${all.images}" class="w-100" alt="" />
                                                        </div>
                                                        <div class="icon-content">
                                                            <h4 class="dlab-title">${all.name}</h4>
                                                            <p style="font-size: 15px;">
                                                                Gmail: ${all.email} <br/>
                                                                Phone: ${all.phoneNumber}
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!------------- END SERVICES ------------->

                </div>
            </div>

            <!--            <div class="section-container">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xs-12">
            
                                        <section class="service">
                                            <div class="service__content">
                                                <div class="service__title">
                                                   
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
                        </div>-->
        </div>

        <jsp:include page="footerTemplate.jsp"></jsp:include>
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
