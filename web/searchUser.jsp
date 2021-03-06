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

        <meta name="msapplication-tap-highlight" content="no">

        <link href="assets/apple-touch-icon.png" rel="apple-touch-icon">
        <link href="assets/favicon.ico" rel="icon">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
              integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
              crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" />

        <title>Find Mentor</title>  

        <link href="New folder/main.a3f694c0.css" rel="stylesheet">
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
            /*Ranking*/

            .card {
                background: linear-gradient(to left, #92FE9D, #00C9FF);
                margin-left: 35px;
                margin: 50px 0;
                width: 230px;
                height: 150px;
                border: none;
                border-radius: 15px;
                background-color: #888;
            }

            .card .card_image {
                transition: 0.5s all ease-in-out;
                position: relative;
                background: #7844e9;
                z-index: 1;
                transform: translateY(100px);
                border-radius: 15px;
            }

            .card:hover .card_image {
                transform: translateY(0px);
            }

            .card img {
                width: 100%;
                background-size: cover;
                height: 100%;
                opacity: 0.8;
            }

            .card .content img:hover {
                opacity: 0.5;
            }

            .card .content {
                transition: 0.5s all ease-in-out;

                position: relative;
                background: #fff;
                padding: 20px;
                box-sizing: border-box;
                box-shadow: 0 20px 50px rgba(0, 0, 0, 0.8);
                transform: translateY(-100px);
            }

            .card:hover .content {
                transform: translateY(0);
            }

            .card .content p {
                margin: 0;
                padding: 0;
                text-align: center;
                color: #414141;
            }

            .card .content h3 {
                margin: 0 0 10px 0;
                padding: 0;
                color: #fff;
                font-size: 24px;
                text-align: center;
                color: #414141;
            }

        </style>
    </head>
    <body style=" background: linear-gradient(to left, #92FE9D, #00C9FF);; padding-top: 0">
        <jsp:include page="headerTemplate.jsp"></jsp:include>
            <div class="white-text-container background-image-container" style="background-image: url('./assets/images/img-home.jpg')">
                <div class="opacity"></div>
                <div class="container">
                    <form action="MainController" method="POST">
                        <div class="row">
                            <div class="col-md-6" >
                                <input type="text" name="txtSearch" class="input" placeholder="Search" style="width: 70%; height: 50px; font-size: 30px; border-radius: 10px">
                                <button type="submit" name="action" value="Search" style="height: 50px; width: 50px; font-size: 30px; border-radius: 10px"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="section-container white-text-container" style='margin-top: 45px;'>
                <div class="container">  
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
            </div>
        </div>
    </div>

    <jsp:include page="footerTemplate.jsp"></jsp:include>
    <script>
        document.addEventListener("DOMContentLoaded", function (event) {
            navActivePage();
        });
    </script>
    <script type="text/javascript" src="./main.41beeca9.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js" ></script>
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
    <script>
        var card = document.querySelector(".card");
        card.addEventListener("click", function () {
            card.classList.toggle("is-flipped");
        });
    </script>
</body>
</html>
