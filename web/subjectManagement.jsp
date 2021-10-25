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
            .vertical-menu {
                width: 200px; /* Set a width if you like */
            }

            .vertical-menu a {
                background-color: #eee; /* Grey background color */
                color: black; /* Black text color */
                display: block; /* Make the links appear below each other */
                padding: 12px; /* Add some padding */
                text-decoration: none; /* Remove underline from links */
            }

            .vertical-menu a:hover {
                background-color: #ccc; /* Dark grey background on mouse-over */
            }

            .vertical-menu a.active {
                background-color: #04aa6d; /* Add a green color to the "active/current" link */
                color: white;
            }
        </style>
    </head>

    <body>
        <!-- Add your content of header -->
        <nav
            style="background: #f5f6fa"
            class="navbar navbar-expand-lg navbar-light bg-light"
            >
            <a style="margin-left: 75px"  href="user.jsp">
                <img src="assets/images/icon.jpg" height="50px" width="50px" >
            </a>
            <button
                class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#navbarNav"
                aria-controls="navbarNav"
                aria-expanded="false"
                aria-label="Toggle navigation"
                >
                <span class="navbar-toggler-icon"></span>
            </button>

            <div
                style="display: flex; margin-right: 28px;  justify-content: flex-end"
                class="collapse navbar-collapse"
                id="navbarNav"
                >
                <!--                <ul style="justify-content: flex-end" class="navbar-nav">                    -->
                <a
                    style="color: #888; margin-left: 12px; text-decoration: none"
                    href="user.jsp"
                    title=""
                    class="active"
                    >Home</a
                >                                    
                <a
                    href="subjectManagement.jsp"
                    title=""
                    style="color: #888; margin-left: 12px; text-decoration: none"
                    >
                    Subject</a
                >
            </div>                                 


            <div class="dropdown" style="float:left; margin-right: 100px">
                <button class="dropbtn" style="background-color: #fff;">
                    <a href="updateUser.jsp">
                        <i>
                            <img style="border-radius: 30px; width: 60px; height: 60px; font-size: 30px; margin-top: 15px" src="${sessionScope.LOGIN_USER.images}" alt="photo2">
                        </i>      
                    </a>
                </button>
                <div class="dropdown-content" style="left:0px; width: 150px">
                    <a   class="choose">${sessionScope.LOGIN_USER.name}</a>
                    <a  href="updateUser.jsp" class="choose">Profile</a>
                    <a  href="MainController?action=Logout"  class="choose">Log out</a>
                </div>
            </div>



        </nav>

        <section class="KhuVucHoc">
            <div>
                <h3><b>Khu vực học tập</b></h3>
            </div>
            <p>Khóa học, tài liệu mà bạn đăng ký sẽ được hiển thị dưới đây.</p>
        </section>

        <section class="MyCourse" style="margin-top: 20px">
            <div class="tab">
                <button class="tablinks" onclick="openCity(event, 'allCourse')">
                    <b>Tất cả khóa học</b>
                </button>
                <c:if test="${sessionScope.LOGIN_USER != null}">
                    <button class="tablinks" onclick="openCity(event, 'myCourse')">
                        <b>Của tôi</b>
                    </button>
                </c:if> 
                <!-- <button class="tablinks" onclick="openCity(event, 'addCourse')"><b>Tạo mới khóa học</b></button> -->

                <div class="search-container">
                    <form action="/action_page.php">
                        <input type="text" placeholder="Search.." name="search" />
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>
            </div>

            <!-- Tab content -->


            <c:if test="${MESSAGE != null}">
                 <div class="alert">
                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                <strong>${MESSAGE}</strong> 
                 </div>
            </c:if>  

            <div id="allCourse" class="tabcontent">
                <c:forEach items="${allSubject}" var="load">
                    <div>
                        <!--button join class-->
                         <button  style="float: right ; margin-top: 30px" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelIdDetail">   
                            <a style="color: white" href="MainController?action=Enroll&subjectId=${load.subjectId}">  Join class  </a>                          
                         </button> 
                        <!--button Detail-->
                        </br>
                        <button  style="float: right ; margin-top: 30px" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelIdDetail">                          
                            <a style="color: white" href="MainController?action=LoadSubjectPage&subjectId=${load.subjectId}">  Detail  </a>
                        </button>

                        <!-- Modal -->
                        <div style="display: flex;">
                            <img
                                src="${load.images}"
                                alt=""
                                style="width: 100px; height: 100px"

                                />
                            <ul style="margin-left: 10px">                
                                <p>${load.subjectName}</p>                         
                                <p>${load.description}</p>
                            </ul>

                        </div>
                    </div> <hr>
                </c:forEach>
            </div> 




            <!-- tu cho nay tro di la phan cua My course-->  
            <div id="myCourse" class="tabcontent">
                <c:forEach items="${listEnrolled}" var="list">
                    <div>
                        <!--button Detail-->
                        <button  style="float: right ; margin-top: 30px" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelIdDetail">   
                            
                            <a style="color: white" href="MainController?action=Enroll&subjectId=${list.subjectId}">  Join class  </a>
                        </button>

                        <!-- Modal -->
                        <div style="display: flex;">
                            <img
                                src="${list.images}"
                                alt=""
                                style="width: 100px; height: 100px"
                                />
                            <ul style="margin-left: 10px">                
                                <p>${list.subjectName}</p>                         
                                <p>${list.description}</p>
                            </ul>

                        </div>
                    </div> <hr>
                </c:forEach>
            </div> 

            <!--            <div id="myCourse" class="tabcontent">
                          
                                <div>
                                    <a
                                        class="join"
                                        href="studentStudyPage.jsp"
                                        style="float: right; margin-top: 30px"
            
                                        >Join Class</a
                                    >
                                    <img
                                        src="/assets/showcase_img_1.webp"
                                        alt=""
                                        style="width: 100px; height: 100px"
                                        />
                                    <span>dầu gội đầu</span>
                                    <hr/>
                                </div>
                              
                        </div>-->


        </section>

        <script src="MyCourse.js"></script>

        <!--        <script
                    src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                    crossorigin="anonymous"
                ></script>
                <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                    crossorigin="anonymous"
                ></script>
                <script
                    src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                    crossorigin="anonymous"
                ></script>-->
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
