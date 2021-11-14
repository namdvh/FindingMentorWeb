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
        <title>User Study</title>
        <link  href="New folder/main.a3f694c0.css" />
        <link rel="stylesheet" href="Subject/MyCourse.css" />

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
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
    <c:if test="${sessionScope.LOGIN_USER eq null}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>
    <body>
        <jsp:include page="headerTemplate.jsp"></jsp:include>
            <section class="KhuVucHoc">
                <div>
                    <h3 style="font-size: 25px"><b>Study Page</b></h3>
                </div>
                <p style="font-size: 17px">All subjects are shown in the list below.</p>
            </section>

            <section class="MyCourse" style="margin-top: 20px">
                <div class="tab">
                    <button>
                        <a href="MainController?action=ShowAll" style="font-size: 17px">All subject</a>
                    </button>
                    <button onclick="sweetalertclick()" >
                        <a href="MainController?action=ShowEnrolled" style="font-size: 17px">My Course</a>
                    </button>
                <c:if test="${sessionScope.LOGIN_USER.roleID eq 'Mentor'}">   
                    <button>
                        <a data-toggle="modal" data-target="#requestAdminCreateCourse" style="font-size: 17px;color: #007BFF">Add subject</a>
                    </button>
                </c:if>
                <div class="search-container">
                    <form action="MainController" method="POST">
                        <input type="text" placeholder="search..." name="txtSearch" />
                        <button type="submit" name="action" value="SearchCourse"><i class="fa fa-search"></i></button>
                    </form>
                </div>
            </div>
            <c:if test="${MESSAGE != null}">
                <div class="alert">
                    <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                    <strong>${MESSAGE}</strong> 
                </div>
            </c:if>  

            <div id="allCourse" class="tabcontent" style="display: block">
                <c:if test="${sessionScope.LOGIN_USER.roleID eq 'User'}" >
                    <c:forEach items="${listEnrolled}" var="list">
                        <div class="container-fluid">
                            <div>
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
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${sessionScope.LOGIN_USER.roleID eq 'Mentor'}" >   
                    <c:set var="listSubject" value="${sessionScope.LIST_MENTOR_SUBJECT}"/>
                    <c:forEach var="subject" items="${listSubject}">
                        <div class="container-fluid">
                            <div>
                                <form action="MainMentorController" method="POST">
                                    <button type="submit" class="join" style="float: right; margin-top: 30px" name="action" value="EditSubject">Edit Subject</button>
                                    <button type="submit" class="join" style="float: right; margin-top: 30px; margin-right: 10px" name="action" value="ViewListStudent">View List Student</button>
                                    <input type="hidden" name="SubjectID" value="${subject.subjectId}" />
                                    <input type="hidden" name="SubjectName" value="${subject.subjectName}" />
                                    <div  style="display: flex;">
                                        <img
                                            src="${subject.images}"
                                            alt=""
                                            style="width: 100px; height: 100px"
                                            />
                                        <ul style="margin-left: 10px">                
                                            <p style="font-size: 20px;font-weight: bold;">${subject.subjectName}</p>       
                                            <p style="font-size: 15px">${subject.description}</p>
                                        </ul>
                                    </div>
                                </form>
                            </div><hr>
                        </div>
                    </c:forEach>
                    <c:forEach items="${listEnrolled}" var="list">
                        <<div class="container-fluid">
                            <div>
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
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
            <div class="modal fade" id="requestAdminCreateCourse" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content" style="font-size: 20px">
                        <form action="RequestCreateSubjectController" method="POST" onsubmit="" enctype="multipart/form-data">
                            <input type="hidden" name="userID" value="${sessionScope.LOGIN_USER.userID}">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Request Course</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group" style="padding-bottom: 20px">
                                    <label for="fullName">Course Name:</label>
                                    <input maxlength="50" type="text" class="form-control" placeholder="max 50 letter" name="courseName"  required="">
                                </div>
                                <div class="form-group" style="padding-bottom: 20px">
                                    <label>Image<span>(Required Field)</span></label><br/>
                                    <input type="file" name="images" class="form-submit" required="" accept="image/*"/>
                                </div>
                                <div class="form-group" style="padding-bottom: 20px">
                                    <label>Category</label>
                                    <select class="" name="categoryId">
                                        <c:forEach var="cate" items="${listcate}">
                                            <option value="${cate.categoryName}">${cate.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group" style="padding-bottom: 20px">
                                    <label for="fullName">Description: </label>
                                    <textarea maxlength="100" type="text" class="form-control ckeditor"  placeholder="max 100 letter" name="Description" required=""></textarea>
                                </div>
                            </div>
                            <div class="modal-footer" style="padding-bottom: 20px">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" value="RequestSubject" name="action">Request</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="footerTemplate.jsp"></jsp:include>      
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
                        var i, tabcontent, tablinks;
                        tabcontent = document.getElementsByClassName("tabcontent");
                        for (i = 0; i < tabcontent.length; i++) {
                            tabcontent[i].style.display = "none";
                        }
                        tablinks = document.getElementsByClassName("tablinks");
                        for (i = 0; i < tablinks.length; i++) {
                            tablinks[i].className = tablinks[i].className.replace(" active", "");
                        }
                        document.getElementById(cityName).style.display = "block";
                        evt.currentTarget.className += " active";
                    }
        </script>
        <script>
            $('#exampleModal').on('show.bs.modal', event => {
                var button = $(event.relatedTarget);
                var modal = $(this);
            });
        </script>
        <script type="text/javascript" src="New folder/main.41beeca9.js"></script>

    </body>
</html>
