<%-- 
    Document   : studentStudyPage
    Created on : Oct 13, 2021, 7:25:16 PM
    Author     : HuuToan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta content="IE=edge" http-equiv="X-UA-Compatible" />
        <meta content="width=device-width,initial-scale=1" name="viewport" />
        <meta content="description" name="description" />
        <meta name="google" content="notranslate" />
        <meta
            content="Mashup templates have been developped by Orson.io team"
            name="author"
            />

        <!-- Disable tap highlight on IE -->
        <meta name="msapplication-tap-highlight" content="no" />

        <link href="./assets/apple-touch-icon.png" rel="apple-touch-icon" />
        <link href="./assets/favicon.ico" rel="icon" />

        <!-- link Font Awesome -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
            integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
            crossorigin="anonymous"
            />
        <!-- boot -->
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
            />

        <title>Title page</title>

        <!-- <link href="./main.a3f694c0.css" rel="stylesheet" /> -->

        <link rel="stylesheet" href="Content/app.css" />
        <style>
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
        <div>
            <div id="top">
                <h1><a href="MainController?action=Load">Home</a></h1>

                <c:if test="${sessionScope.LOGIN_USER != null}">

                    <c:if test="${sessionScope.LOGIN_USER.roleID eq 'US'} || ${sessionScope.LOGIN_USER.roleID eq 'MT'}">
                        <div id="top-navigation"> Welcome <a>${sessionScope.LOGIN_USER.name}</a> <span>|</span> <a href="MainController?action=Logout">Log out</a> </div>
                    </c:if>
                </c:if>
            </div>

            <div class="areaStudy col-md-4">
                <div class="content" >
                    <div class="title" style="display: flex;  margin: 10px 10px;">
                        <span><h2>Lesson content</h2></span>   
                    </div>
                   
                        <c:set var="listChapter" value="${requestScope.LIST_CHAPTER}"/>
                        <c:forEach var="chapter" items="${listChapter}"> 
                            <!-- Button  Create Chapter -->
                            <div class="dropdown">
                                <button
                                    class="btn btn-secondary dropdown-toggle chapter"
                                    type="button"
                                    id="dropdownMenuButton"
                                    data-toggle="dropdown"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >
                                    ${chapter.chapterName}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

                                    <c:set var="listContent" value="${requestScope.LIST_CHAPTER.list}"/>
                                    <c:forEach var="content" items="${listContent}" varStatus="i">
                                        <a class="dropdown-item" href="#">
                                            ${content.contentName}
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div  class="video ">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/Br4xUFy9OGc" ></iframe>
                    </div>




                    <!-- <script src="./content.js"></script> -->
                    <!-- BOOTSTRAP -->
                    <script
                        src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                        crossorigin="anonymous"
                    ></script>
                    <script
                        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
                        crossorigin="anonymous"
                    ></script>

                    <script
                        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                        crossorigin="anonymous"
                    ></script>
                    <!-- Button trigger modal -->
                    <script>
                        $('#exampleModal').on('show.bs.modal', event => {
                            var button = $(event.relatedTarget);
                            var modal = $(this);
                            // Use above variables to manipulate the DOM
                        });

                    </script>
                    </body>
                    </html>