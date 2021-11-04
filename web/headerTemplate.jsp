<%-- 
    Document   : headerTemplate
    Created on : Oct 26, 2021, 8:17:00 PM
    Author     : HuuToan
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- FONT AEWSOME -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
              integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- BOOTSTRAP -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
              integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />

    </head>
    <body style="padding-top: 0;">

        <style>

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: "Work Sans", sans-serif;
            }
            /******************************* INSTRUCTION__MENU *******************************/
            .instruction__menu {
                background-color: #fff;
            }

            .instruction__menu .navbar-brand {
                font-weight: 700;
                padding: 0.5rem 0;
            }

            /* .instruction__menu .navbar-brand a {
                color: #282828;
                font-weight: 700;
                font-size: 36px;
            } */

            .instruction__menu .navbar-brand label {
                color: #ff4f81;
                display: block;
                font-size: 10.4px;
                text-align: center;
                letter-spacing: 3px;
            }

            .carousel-caption {
                top: 55%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 75%;
            }

            .button__rm {
                position: relative;
            }

            .navbar-nav > li {
                margin: 0 15px;
            }

            .instruction__menu .navbar-nav .nav-item.active .nav-link {
                color: #ff4f81;
            }

            .instruction__menu .navbar-nav .nav-item.active::after {
                content: '';
                width: 100%;
                height: 2.5px;
                background-color: #ff4f81;
                display: block;
            }

            .instruction__menu .navbar-nav .nav-item::after {
                content: '';
                width: 0;
                height: 2.5px;
                background-color: #ff4f81;
                display: block;
                transition: all 0.5s;
            }

            .instruction__menu .navbar-nav .nav-item:hover::after {
                width: 100%;
                color: #ff4f81;
            }

            .instruction__menu .navbar-nav .nav-item .nav-link {
                transition: all 0.5s;
            }

            .instruction__menu .navbar-nav .nav-item:hover .nav-link {
                color: #ff4f81;
            }

            .instruction__menu .navbar-nav > li > a {
                color: #282828;
                font-size: 14.4px;
                letter-spacing: 1px;
                font-weight: 600;
                text-transform: uppercase;
                padding: 14px 8px;
            }

            .navbar-light .navbar-nav .nav-item .nav-link {
                color: #282828;
            }

            .instruction__menu .dropdown-menu {
                background-color: rgba(0, 0, 0, 0.65);
                border-radius: 0.3rem;
            }

            .instruction__menu .dropdown-menu a {
                color: #fff;
                font-size: 14px;
                text-align: center;
                height: 3rem;
                width: 11rem;
                z-index: 10;
            }

            .instruction__menu .dropdown-menu a:hover {
                color: #ff4f81;
            }

            .dropdown-item:focus,
            .dropdown-item:hover {
                color: #fff;
                background-color: rgba(0, 0, 0, 0);
            }
            /******************************* END INSTRUCTION__MENU *******************************/
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
        <!--********************* INSTRUCTION__MENU *********************-->
        <c:if test="${sessionScope.LOGIN_USER != null}">
            <section class="instruction__menu container-fluid ">
                <nav class="navbar navbar-expand-lg navbar-light px-0">
                    <a class="navbar-brand" href="MainController?action=Load" style="font-size: 25px">
                        <i class="fa fa-book"></i>
                        INSTRUCTION
                        <label>EDUCATION</label>
                    </a>
                    <button
                        class="navbar-toggler"
                        type="button"
                        data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                        >
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="MainController?action=Load"
                                   >HOME <span class="sr-only">(current)</span></a
                                >
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="MainController?action=ShowAll">Subject</a>
                            </li>
                            <c:if test="${sessionScope.LOGIN_USER == null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="createUser.jsp">Register</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="login.jsp">Login</a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_USER != null}">                           
                                <li>
                                    <div class="dropdown" style="float:right;">
                                        <button class="dropbtn" style="background-color: #fff; border: none;">
                                            <a href="MainController?action=LoadInfor">
                                                <i>
                                                    <img style="border-radius: 50%; width: 45px; height: 45px; font-size: 30px; margin-top: 15px; margin-left: 15px;" src="${sessionScope.LOGIN_USER.images}" alt="photo2">
                                                </i>       
                                            </a>
                                        </button>
                                        <div class="dropdown-content" style="left:-12px;">
                                            <a class="choose">${sessionScope.LOGIN_USER.name}</a>
                                            <a href="MainController?action=LoadInfor" class="choose">Profile</a>
                                            <a href="MainController?action=Logout" class="choose">Log out</a>
                                        </div>
                                    </div>
                                </li>       
                            </c:if>
                        </ul>
                    </div>
                </nav>
            </section>
        </c:if>
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <section class="instruction__menu container-fluid ">
                <nav class="navbar navbar-expand-lg navbar-light px-0">
                    <a class="navbar-brand" href="MainController?action=Load" style="font-size: 25px">
                        <i class="fa fa-book"></i>
                        INSTRUCTION
                        <label>EDUCATION</label>
                    </a>
                    <button
                        class="navbar-toggler"
                        type="button"
                        data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                        >
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="MainController?action=Load"
                                   >HOME <span class="sr-only">(current)</span></a
                                >
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="login.jsp">Subject</a>
                            </li>
                            <c:if test="${sessionScope.LOGIN_USER == null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="createUser.jsp">Register</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="login.jsp">Login</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </nav>
            </section>
        </c:if>
        <!--********************* END INSTRUCTION__MENU *********************-->
        <!-- JQUERY -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- BOOTSTRAP -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
                integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
        crossorigin="anonymous"></script>
    </body>
</html>
