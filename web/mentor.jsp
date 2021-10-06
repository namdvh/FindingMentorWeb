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

        <link href="assets/apple-touch-icon.png" rel="apple-touch-icon">
        <link href="assets/favicon.ico" rel="icon">


        <!-- link Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
              integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
              crossorigin="anonymous" />
        <!-- boot -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <title>Title page</title>  

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
    </style>
    <body>
        <form action="MainMentorController" method="POST">
            <div class="modal" id="formCreateChapter">
                <div class="modal-content">
                    <span class="close" onclick="closedX()">X</span>
                    Chapter Name: <input type="text" name="NewChapterName" value="" required=""/>
                    Description: <input type="text" name="NewDescription" value="" />
                    <input type="submit" value="Save" name="action" onclick="CloseSaveNewChapter()"/>
                </div>
            </div>
        </form>
        <c:set var="listChapter" value="${requestScope.LIST_CHAPTER}"/>
        <div class="areaStudy col-md-4">
            <div class="content ">
                <div class="title">
                    <button class="back" href="user.jsp"><a href="user.jsp">Back</a></button>
                    <span><h2>N?i dung bài h?c</h2></span> 
                    <input type="submit" value="+" name="" class="buttonPlus buttonCreate fa fa-plus" onclick="openCreateChapter()"/>
                </div>
                <c:forEach items="${listChapter}" var="item">
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle chapter" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            C ${item.chapterName}
                        </button>
                        <button id="updateChapter" onclick="openUpdateChapter()">EDIT</button>
                        <form action="MainMentorController" method="POST">
                            <div class="modal" id="formUpdateChapter">
                                <div class="modal-content">
                                    <span class="close" onclick="closedX2()">X</span>
                                    <input type="text" name="UpdateChapterID" value="${item.chapterID}" readonly="readonly" />
                                    Chapter Name: <input type="text" name="UpdateChapterName" value="${item.chapterName}" required=""/>
                                    Description: <input type="text" name="UpdateDescription" value="${item.description}" />
                                    <input type="submit" value="Update" name="action" onclick="updateNewChapter()"/>
                                </div>
                            </div>
                        </form>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">Bài 1: 2 cách chèn Javascript vào HTML</a>
                            <a class="dropdown-item" href="#">Bài 2: Tìm hi?u hàm console.log</a>
                            <a class="dropdown-item" href="#">Bài 3: Ki?n th?c v? bi?n c?n n?m</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>            
        <div class="video col-md-8">
            <iframe  src="https://www.youtube.com/embed/tgbNymZ7vqY">
            </iframe>
        </div>
        <script>
            // Get the modal
            var modal = document.getElementById("formCreateChapter");
            var modal2 = document.getElementById("formUpdateChapter");
            // When the user clicks the button, open the modal 
            function openCreateChapter() {
                modal.style.display = "block";
            }
            function openUpdateChapter() {
                modal2.style.display = "block";
            }
            // When the user clicks the button, close the modal 
            function CloseSaveNewChapter() {
                modal.style.display = "none";
            }
            function CloseUpdateNewChapter() {
                modal2style.display = "none";
            }
            // When the user clicks on <span> (x), close the modal
            function closedX() {
                modal.style.display = "none";
            }
            function closedX2() {
                modal2.style.display = "none";
            }
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                } else if (event.target == modal2) {
                    modal2.style.display = "none";
                }
            }
        </script>
        <script src="./content.js"></script>
        <!-- BOOTSTRAP -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>
