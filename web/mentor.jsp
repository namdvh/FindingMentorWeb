<%-- 
    Document   : mentor
    Created on : Sep 30, 2021, 10:36:54 AM
    Author     : cunpl
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta content="IE=edge" http-equiv="X-UA-Compatible">
        <meta content="width=device-width,initial-scale=1" name="viewport">
        <meta content="description" name="description">
        <meta name="google" content="notranslate" />
        <meta content="Mashup templates have been developped by Orson.io team" name="author">

        <!-- Disable tap highlight on IE -->
        <meta name="msapplication-tap-highlight" content="no">

        <link href="./assets/apple-touch-icon.png" rel="apple-touch-icon">
        <link href="./assets/favicon.ico" rel="icon">

        <!-- link Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
              integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
              crossorigin="anonymous" />
        <!-- SLICK CAROUSEL  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" />

        <title>Find Mentor</title>  

        <link href="New folder/main.a3f694c0.css" rel="stylesheet">
        <link rel="stylesheet" href="Content/app.css">
    </head>
    <style>
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
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
        .dropbtn {
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

        .dropdown {
            position: relative;
            /*display: inline-block;*/
            display: flex;
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
    </style>
    <body>
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
                        <a class="navbar-brand" href="./index.html" title="">
                            <img src="./assets/6ade1740a96760393976.jpg" class="navbar-logo-img" alt="">
                        </a>
                    </div>

                    <div class="collapse navbar-collapse" id="navbar-collapse-uarr">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="./index.html" title="" class="active">Home</a></li>
                            <li>
                                <div class="dropdown" style="float:right;margin-top: 26px;">
                                    <a href="./Subject/MyCourse.html " title="" style="color: #888;"> Subject</a>
                                    <!-- <div class="dropdown-content" style="left:-20px;">
                                      <a href="./MyCourse.html" class="choose" style="padding: 10px 0 7px 10px;">My Course</a>
                                      <a href="#" class="choose" style="padding: 10px 0 7px 10px;">All Couse</a>
                                      <a href="#" class="choose" style="padding: 10px 0 7px 10px;">Add Couse</a>
                                    </div> -->
                                </div>
                            </li>
                            <!-- <li><a href="./pricing.html" title="" > Profile </a></li> -->
                            <li><a href="./Create/index..html" title="" >Đăng Ký</a></li>
                            <li><a href="./LoginUser/Login/index.html" title="">Đăng Nhập</a></li>
                            <li>
                                <div class="dropdown" style="float:right;">
                                    <button class="dropbtn" style="background-color: #fff;">
                                        <a href="./Profile/index.html">
                                            <i class="fas fa-user-circle user" 
                                               style="font-size: 30px;
                                               padding-top: 24px;
                                               padding-left: 8px;
                                               ">
                                            </i>
                                        </a>
                                    </button>
                                    <div class="dropdown-content" style="left:-12px;">
                                        <a href="/Profile/index.html" class="choose">Profile</a>
                                        <a href="#" class="choose">Log out</a>
                                    </div>
                                </div>
                            </li>

                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <form action="MainMentorController" method="POST">
            <div class="modal" id="CreateChapter">
                <div class="modal-content">
                    <span class="close" onclick="closedX('CreateChapter')">X</span><br>
                    Chapter Name: <input type="text" name="NewChapterName" value="" required=""/><br>
                    Description: <input type="text" name="NewDescription" value="" /><br>
                    <input type="submit" value="CreateChapter" name="action" onclick="closeForm('CreateChapter')"/>
                </div>
            </div>
        </form>

        <c:set var="listChapter" value="${requestScope.LIST_CHAPTER}"/>
        <div class="areaStudy col-md-4">
            <div class="content ">
                <div class="title">
                    <a style="height: 45px; margin-top: 25px; margin-left: 15px;" class="back" href="user.jsp">Back</a>
                    <span><h2>Noi dung bai hoc</h2></span> 
                    <input style="height: 45px; margin-top: 25px; margin-left: 15px;" type="submit" value="+" name="" class="buttonPlus buttonCreate fa fa-plus" onclick="openForm('CreateChapter')"/>
                </div>
                <c:forEach var="chapter" items="${listChapter}" varStatus="counter">
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle chapter" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Chương ${counter.count}: ${chapter.chapterName}
                        </button>
                        <button onclick="openForm('updateChapter${chapter.chapterID}')">EDIT</button>
                        <button onclick="openForm('createContent${chapter.chapterID}')">+</button>
                        <form action="MainMentorController" method="POST">
                            <div class="modal" id="updateChapter${chapter.chapterID}">
                                <div class="modal-content">
                                    <span class="close" onclick="closedX('updateChapter${chapter.chapterID}')">X</span><br>
                                    <input type="hidden" name="UpdateChapterID" value="${chapter.chapterID}" readonly="readonly" /><br>
                                    Chapter Name: <input type="text" name="UpdateChapterName" value="${chapter.chapterName}" required=""/><br>
                                    Description: <input type="text" name="UpdateDescription" value="${chapter.description}" /><br>
                                    <input type="submit" value="UpdateChapter" name="action" onclick="closeForm('updateChapter${chapter.chapterID}')"/>
                                </div>
                            </div>
                        </form>
                        <form action="MainMentorController" method="POST">
                            <div class="modal" id="createContent${counter.count}">
                                <div class="modal-content">
                                    <span class="close" onclick="closedX('createContent${counter.count}')">X</span>
                                    <input type="text" name="NewContentChapterID" value="${chapter.chapterID}" readonly="readonly" /><br>
                                    Content Name: <input type="text" name="contentName" value="" required=""/><br>
                                    Video URL: <input type="text" name="videoURL" value="" required=""/><br>
                                    Blog: <input type="text" name="blog" value="" required=""/><br>
                                    <input type="submit" value="CreateContent" name="action" onclick="closeForm('createContent${chapter.chapterID}')"/>
                                </div>
                            </div>
                        </form>  
                        <c:set var="listContent" value="${chapter.list}"/>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" >
                            <c:forEach var="itemContent" items="${listContent}" varStatus="i">
                                <a class="dropdown-item" href="#" onclick="loadVideoURL('${itemContent.videoURL}')">Bai ${i.count}: ${itemContent.contentName}</a>
                                <button class="buttonEdit" onclick="openForm('updateContent${itemContent.contentID}')">EDIT CONTENT</button>
                                <form action="MainMentorController" method="POST">
                                    <div class="modal" id="updateContent${itemContent.contentID}">
                                        <div class="modal-content">
                                            <span class="close" onclick="closedX('updateContent${itemContent.contentID}')">X</span>
                                            <input type="hidden" name="UpdateContentID" value="${itemContent.contentID}" readonly="readonly" /><br>
                                            Content Name: <input type="text" name="UpdateContentName" value="${itemContent.contentName}" required=""/><br>
                                            Video URL: <input type="text" name="UpdateVideoURL" value="${itemContent.videoURL}" required=""/><br>
                                            Blog: <input type="text" name="UpdateBlog" value="${itemContent.blog}" required=""/><br>
                                            <input type="submit" value="UpdateContent" name="action" onclick="closeForm('updateContent${itemContent.contentID}')"/>
                                        </div>
                                    </div>
                                </form>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="video col-md-8">
            <iframe  id="loadVideo" src="" frameborder="0" allowfullscreen style="border: solid 4px #37474F">
            </iframe>
        </div>          
        <script>
            var player;
            // When the user clicks the button, open the modal 
            function openForm(id) {
                var modal = document.getElementById(id);
                modal.style.display = "block";
            }
            // When the user clicks the button, close the modal 
            function closeForm(id) {
                var modal = document.getElementById(id);
                modal.style.display = "none";
            }
            // When the user clicks on <span> (x), close the modal
            function closedX(id) {
                var modal = document.getElementById(id);
                modal.style.display = "none";
            }
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                var modal = document.getElementById(id);
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            };
            function loadVideoURL(url) {
                var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
                var match = url.match(regExp);
                if (match && match[7].length === 11) {
                    var id = match[7];
                    let urlpath = "https://www.youtube.com/embed/";
                    let urlpath2 = "?enablejsapi=1";
                    var videoURL = urlpath.concat(id, urlpath2);
                    document.getElementById("loadVideo").src = videoURL;
                } else {
                    alert("Url incorrect");
                }
            }
            function onYouTubeAPIReady(URL) {
                player = new YT.Player('loadVideo', {
                    events: {
                        'onReady': onPlayerReady,
                        'onStateChange': onPlayerStateChange
                    }
                });
            }
            function onPlayerReady(event) {
                event.target.setVolume(100);
                event.target.playVideo();
                document.getElementById('loadVideo').style.borderColor = '#FF6D00';
            }
            function changeBorderColor(playerStatus) {
                var color;
                if (playerStatus === -1) {
                    color = "#37474F"; // unstarted = gray
                } else if (playerStatus === 0) {
                    color = "#FFFF00"; // ended = yellow
                } else if (playerStatus === 1) {
                    color = "#33691E"; // playing = green
                } else if (playerStatus === 2) {
                    color = "#DD2C00"; // paused = red
                } else if (playerStatus === 3) {
                    color = "#AA00FF"; // buffering = purple
                } else if (playerStatus === 5) {
                    color = "#FF6DOO"; // video cued = orange
                }
                if (color) {
                    document.getElementById('loadVideo').style.borderColor = color;
                }
            }
            function onPlayerStateChange(event) {
                changeBorderColor(event.data);
            }



            //

        </script>
        <script src="Content/content.js"></script>

        <!-- BOOTSTRAP -->

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>
