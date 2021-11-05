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
            body{
                margin-top:20px;
                background:#FAFAFA;    
            }
            /*==================================================
              Nearby People CSS
              ==================================================*/
            .people-nearby .google-maps{
                background: #f8f8f8;
                border-radius: 4px;
                border: 1px solid #f1f2f2;
                padding: 20px;
                margin-bottom: 20px;
            }

            .people-nearby .google-maps .map{
                height: 300px;
                width: 100%;
                border: none;
            }

            .people-nearby .nearby-user{
                padding: 20px 0;
                border-top: 1px solid #f1f2f2;
                border-bottom: 1px solid #f1f2f2;
                margin-bottom: 20px;
            }

            img.profile-photo-lg{
                height: 80px;
                width: 80px;
                border-radius: 50%;
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
        <jsp:include page="headerTemplate.jsp"></jsp:include>

            <section class="KhuVucHoc">
                <div>
                    <h3 style="font-size: 25px"><b>Study page</b></h3>
                </div>
                <p style="font-size: 17px">All subjects are shown in the list below.</p>

            </section>

            <section class="MyCourse" style="margin-top: 20px">
                <div class="tab">
                    <form action="MainMentorController" method="POST">
                        <button class="tablinks" onclick="openCity(event, 'allCourse')" name="action" value="ShowAllSubjectController">
                            <b style="font-size: 17px">All Subject</b>
                        </button>
                    </form>    
                    <button class="tablinks" onclick="openCity(event, 'myCourse')" >
                        <b style="font-size: 17px">My course</b>
                    </button>
                </div>
                <!-- Tab content -->
            <c:if test="${MESSAGE != null}">
                <div class="alert">
                    <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                    <strong>${MESSAGE}</strong> 
                </div>
            </c:if>  
            <div id="allCourse" class="tabcontent" style="display: block">
                <c:if test="${sessionScope.LOGIN_USER.roleID eq 'MT'}" >   
                    <c:set var="listStudent" value="${LIST_STUDENT_ENROLL_SUBJECT.list}"/>
                    <c:forEach var="student" items="${listStudent}">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="people-nearby">
                                        <div class="nearby-user">
                                            <div class="row">
                                                <div class="col-md-2 col-sm-2">
                                                    <img src="${student.images}" alt="user" class="profile-photo-lg">
                                                </div>
                                                <div class="col-md-7 col-sm-7">
                                                    <h5>Name: <a href="#" class="profile-link">${student.name}</a></h5>
                                                    <p>Email: ${student.email}</p>
                                                    <p class="text-muted"> Address: ${student.address}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </c:forEach>
                </c:if>
            </div> 
            <div id="myCourse" class="tabcontent">
                <c:if test="${sessionScope.LOGIN_USER.roleID eq 'US'}" >
                    <c:forEach items="${listEnrolled}" var="list">
                        <div>
                            <!--button Detail-->
                            <button  style="float: right ; margin-top: 30px" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelIdDetail">   
                                <a style="color: white" href="MainController?action=Enroll&subjectId=${list.subjectId}">  Join class  </a>
                            </button>
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
                </c:if>
                <c:if test="${sessionScope.LOGIN_USER.roleID eq 'MT'}" >   
                    <c:set var="listSubject" value="${sessionScope.LIST_MENTOR_SUBJECT}"/>
                    <c:forEach var="subject" items="${listSubject}">
                        <div>
                            <form action="MainMentorController" method="POST">
                                <button type="submit" class="join" style="float: right; margin-top: 30px" name="action" value="EditSubject">Edit Subject</button>
                                <button type="submit" class="join" style="float: right; margin-top: 30px" name="action" value="ViewListStudent">View List Student</button>
                                <input type="hidden" name="SubjectID" value="${subject.subjectId}" />
                                <input type="hidden" name="SubjectName" value="${subject.subjectName}" />
                                <img src="${subject.images}" alt="" style="width: 100px; height: 100px"/>
                                <span>${subject.subjectName}</span>
                            </form>
                        </div>
                    </c:forEach>
                    <c:forEach items="${listEnrolled}" var="list">
                        <div>
                            <!--button Detail-->
                            <button  style="float: right ; margin-top: 30px" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelIdDetail">   
                                <a style="color: white" href="MainController?action=Enroll&subjectId=${list.subjectId}">  Join class  </a>
                            </button>
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
                </c:if>
            </div>
        </section>
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
                        function openCity(evt, cityName) {
                            // Declare all variables
                            var i, tabcontent, tablinks;

                            // Get all elements with class="tabcontent" and hide them
                            tabcontent = document.getElementsByClassName("tabcontent");
                            for (i = 0; i < tabcontent.length; i++) {
                                tabcontent[i].style.display = "none";
                            }

                            // Get all elements with class="tablinks" and remove the class "active"
                            tablinks = document.getElementsByClassName("tablinks");
                            for (i = 0; i < tablinks.length; i++) {
                                tablinks[i].className = tablinks[i].className.replace(" active", "");
                            }

                            // Show the current tab, and add an "active" class to the button that opened the tab
                            document.getElementById(cityName).style.display = "block";
                            evt.currentTarget.className += " active";
                        }
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
