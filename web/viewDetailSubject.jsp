<%-- 
    Document   : subjectManagement
    Created on : Oct 13, 2021, 8:16:33 PM
    Author     : HuuToan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
            rel="stylesheet"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw=="
            crossorigin="anonymous"
            />

        <!--bootstrap-->
        <!--        <link
                    rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous"
                    />-->

        <!-- link Font Awesome -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
            integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
            />
        <title>Title page</title>
        <link  href="New folder/main.a3f694c0.css" />
        <link rel="stylesheet" href="Subject/MyCourse.css" />

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

            .dropdown:hover .dropbtn .user {
                color: #5876fc;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                right: 0;
                background-color: #f9f9f9;
                min-width: 90px;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
            }

            .dropdown-content .choose {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content .choose:hover {
                background-color: #5876fc;
                transition: all 0.5s;
                color: #ffff;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }
            /*            .vertical-menu {
                            width: 200px;  Set a width if you like 
                        }
            
                        .vertical-menu a {
                            background-color: #eee;  Grey background color 
                            color: black;  Black text color 
                            display: block;  Make the links appear below each other 
                            padding: 12px;  Add some padding 
                            text-decoration: none;  Remove underline from links 
                        }
            
                        .vertical-menu a:hover {
                            background-color: #ccc;  Dark grey background on mouse-over 
                        }
            
                        .vertical-menu a.active {
                            background-color: #04aa6d;  Add a green color to the "active/current" link 
                            color: white;
                        }*/


        </style>
    </head>

    <body>
        <jsp:include page="headerTemplate.jsp"></jsp:include>

            <!--        <section class="MyCourse" style="margin-top: 20px">
            
                         Tab content 
                        <div>               
                            <div style="padding: 20px; border: solid 1px black">
                                button Detail
                                <button  type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelIdDetail">   
            
                                    <a style="color: white" href="MainController?action=Enroll&subjectId=${ViewPage.subjectId}">  Register  </a>
                                </button>
            
                                 Modal 
                                <div>
                                    <img
                                        src="${ViewPage.images}"
                                        alt=""
                                        style="width: 100px; height: 100px"
            
                                        />
                                    <ul style="margin-left: 10px">                
                                        <p>${ViewPage.subjectName}</p>                         
                                        <p>${ViewPage.description}</p>
                                    </ul>
            
                                </div>
                            </div>              
                        </div> 
                    </section>--><div class="card" style="width: 18rem; margin-left: 40%">
            <img class="card-img-top-detail" style="width: 450px; height: 150px;" src="${ViewPage.images}" />
            <div class="card-body" >
                <h5 class="card-title"></h5>           
                <h6>
                    <ul style="margin-left: 10px">                
                        <p>${ViewPage.subjectName}</p>                         
                        <p>${ViewPage.description}</p>
                        <p>Mentor Name: ${LoadMentor.name}</p>
                    </ul>
                </h6>
                <button  type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelIdDetail">   
                    <a style="color: white" href="MainController?action=Enroll&subjectId=${ViewPage.subjectId}">  Register  </a>
                </button>

                <!--            <a href="#" class="btn btn-primary">Go somewhere</a>-->
            </div>
        </div>

        <!--start of footer-->
        <jsp:include page="footerTemplate.jsp"></jsp:include>
        <!--end off footer-->        
        <script src="MyCourse.js"></script>


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

        <script type="text/javascript"  src="Subject/MyCourse.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function (event) {
                navActivePage();
            });
        </script>
        <script>
            $('#exampleModal').on('show.bs.modal', event => {
                var button = $(event.relatedTarget);
                var modal = $(this);
                // Use above variables to manipulate the DOM

            });
        </script>
        <script type="text/javascript" src="New folder/main.41beeca9.js"></script>
    </body>
</html>
