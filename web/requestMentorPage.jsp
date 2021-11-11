<%-- 
    Document   : admin.jsp
    Created on : Sep 30, 2021, 10:36:15 AM
    Author     : cunpl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <style>
            #myImg {
                border-radius: 5px;
                cursor: pointer;
                transition: 0.3s;
            }

            #myImg:hover {opacity: 0.7;}

            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
            }

            /* Modal Content (image) */
            .modal-content {
                margin: auto;
                display: block;
                width: 100%;
                max-width: 800px;
            }

            /* Caption of Modal Image */
            #caption {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
                text-align: center;
                color: #ccc;
                padding: 10px 0;
                height: 150px;
            }

            /* Add Animation */
            .modal-content, #caption {  
                -webkit-animation-name: zoom;
                -webkit-animation-duration: 0.6s;
                animation-name: zoom;
                animation-duration: 0.6s;
            }

            @-webkit-keyframes zoom {
                from {-webkit-transform:scale(0)} 
                to {-webkit-transform:scale(1)}
            }

            @keyframes zoom {
                from {transform:scale(0)} 
                to {transform:scale(1)}
            }

            /* The Close Button */
            .close {
                position: absolute;
                top: 15px;
                right: 35px;
                color: #f1f1f1;
                font-size: 40px;
                font-weight: bold;
                transition: 0.3s;
            }

            .close:hover,
            .close:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
            }

            /* 100% Image Width on Smaller Screens */
            @media only screen and (max-width: 700px){
                .modal-content {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <div id="header">
            <div class="shell">
                <div id="top">
                    <h1><a href="#">SpringTime</a></h1>
                    <c:if test="${sessionScope.LOGIN_USER == null}">
                        <c:redirect url="user.jsp"/>
                    </c:if>
                    <c:if test="${sessionScope.LOGIN_USER != null}">
                        <c:if test="${sessionScope.LOGIN_USER.roleID ne 'AD'}">
                            <c:redirect url="user.jsp"/>
                        </c:if>
                        <c:if test="${sessionScope.LOGIN_USER.roleID eq 'AD'}">
                            <div id="top-navigation"> Welcome <a href="#"><strong>Administrator</strong></a> <span>|</span> <a href="MainController?action=Logout">Log out</a> </div>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div id="main">
                    <div class="cl">&nbsp;</div>
                    <div id="content" style="width: 992px">
                        <div class="box">
                            <c:if test="${requestScope.APPROVE_MSG != null}">
                                ${requestScope.APPROVE_MSG}
                            </c:if>
                            <div class="box-head">
                                <form action="MainController">
                                    <h2 class="left">Current Request</h2>
                                    <div class="right">
                                        <label>Search Request</label>
                                        <input type="text" name ="searchValue" class="field small-field" />
                                        <input type="submit" class="button" name="action" value="SearchRequest" />
                                    </div>
                                </form>
                            </div>
                            <div class="table">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <c:if test="${requestScope.LISTREQUEST_ADMIN == null}">
                                        <tr>
                                            <th>Nothing to search</th>
                                        </tr>
                                    </c:if>
                                    <c:if test="${requestScope.LISTREQUEST_ADMIN != null}">
                                        <tr>
                                            <th></th>
                                            <th>User ID</th>
                                            <th>Name</th>
                                            <th>Certificate</th>
                                            <th>Description</th>
                                            <th>Status</th>
                                            <th width="110" class="ac">Content Control</th>
                                        </tr>
                                        <c:forEach var="s" items="${requestScope.LISTREQUEST_ADMIN}">
                                            <tr>
                                                <th>
                                                    <input type="hidden" name="requestId" value="${s.requestId}" />
                                                </th>
                                                <th>${s.userId}</th>
                                                <th>${s.name}</th>
                                                <!--<th> <img src="${s.certificate}" width="150px"> </th>-->
                                                <th> <img src="${s.certificate}" id="myImg" src="img_snow.jpg" style="width:100%;max-width:150px"></th>
                                                <th>${s.description}</th>
                                                <th>${s.status}</th>
                                                <th>
                                                    <c:if test="${s.status eq 'true'}">
                                                        <a href="MainController?action=ApproveRequest&requestId=${s.requestId}&userId=${s.userId}" class="ico del">Approve</a>
                                                        <a href="MainController?action=DenailRequest&requestId=${s.requestId}&userId=${s.userId}" class="ico edit">Denial</a>

                                                    </c:if>
                                                </th>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <!-- The Modal -->
                                    <div id="myModal" class="modal">
                                        <span class="close">&times;</span>
                                        <img class="modal-content" id="img01">
                                        <div id="caption"></div>
                                    </div>

                                </table>
                            </div>
                        </div>
                    </div>
                    <span style="display: flex; justify-content: flex-end; ">
                        <div class="box" style="margin-left: 25px">
                            <div class="list-group">
                                <a href="MainController?action=LoadAdminPage" class="list-group-item list-group-item-action ">
                                    Dashboard
                                </a>
                                <a href="MainController?action=LoadMentorPage" class="list-group-item list-group-item-action">Mentor Management</a>
                                <a href="MainController?action=LoadUserPage" class="list-group-item list-group-item-action ">User Management</a>
                                <a href="MainController?action=LoadApprovePage" class="list-group-item list-group-item-action active">Approve Mentor</a>
                                <a href="MainController?action=addSubjectPage" class="list-group-item list-group-item-action ">Add Subject</a>
                                <a href="MainController?action=addCategoryPage" class="list-group-item list-group-item-action">Add Category</a>
                            </div>
                        </div>
                    </span>
                </div>
            </div>
        </div>
        <div id="footer">
            <div class="shell"> <span class="left">&copy; 2021 - Company Four Class</span> <span class="right"> Design by <a href="http://chocotemplates.com">Chocotemplates.com</a> </span> </div>
        </div>
        <script>
// Get the modal
            var modal = document.getElementById("myModal");

// Get the image and insert it inside the modal - use its "alt" text as a caption
            var img = document.getElementById("myImg");
            var modalImg = document.getElementById("img01");
            var captionText = document.getElementById("caption");
            img.onclick = function () {
                modal.style.display = "block";
                modalImg.src = this.src;
                captionText.innerHTML = this.alt;
            }

// Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            }
        </script>
    </body>
</html>