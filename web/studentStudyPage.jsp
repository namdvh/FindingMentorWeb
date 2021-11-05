<%-- 
    Document   : mentor1
    Created on : Oct 12, 2021, 7:07:09 PM
    Author     : hoang
--%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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

        <title>Find Mentor</title>  

        <!--<link href="New folder/main.a3f694c0.css" rel="stylesheet">-->
        <link rel="stylesheet" href="Content-after/app.css">

        <style>
            @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
            #rating {
                border: none;
                float: left;
            }
            #rating > input {
                display: none;
            } /*?n input radio - vì chúng ta ?ã có label là GUI*/
            #rating > label:before {
                margin: 5px;
                font-size: 1.25em;
                font-family: FontAwesome;
                display: inline-block;
                content: "\f005";
            } /*1 ngôi sao*/
            #rating > .half:before {
                content: "\f089";
                position: absolute;
            } /*0.5 ngôi sao*/
            #rating > label {
                color: #ddd;
                float: right;
            } /*float:right ?? l?t ng??c các ngôi sao l?i ?úng theo th? t? trong th?c t?*/
            /*thêm màu cho sao ?ã ch?n và các ngôi sao phía tr??c*/
            #rating > input:checked ~ label,
            #rating:not(:checked) > label:hover,
            #rating:not(:checked) > label:hover ~ label {
                color: #ffd700;
            }
            /* Hover vào các sao phía tr??c ngôi sao ?ã ch?n*/
            #rating > input:checked + label:hover,
            #rating > input:checked ~ label:hover,
            #rating > label:hover ~ input:checked ~ label,
            #rating > input:checked ~ label:hover ~ label {
                color: #ffed85;
            }

        </style>
    </head>
    <body>
        <jsp:include page="headerTemplate.jsp"></jsp:include>

        <c:if test="${sessionScope.LOGIN_USER eq null}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
        <c:set var="listChapter" value="${requestScope.LIST_CHAPTER}"/>
        <div class="">
            <div class="row">
                <div class="col-md-4">
                    <div class="d-flex justify-content-between mb-3">
                        <a  class="btn btn-success btn-sm rounded-0" href="MainController?action=ShowAll">Back</a>
                        <span><h2>Lesson Content</h2></span>   
                    </div>
                    <div style="height : 476px; overflow-y: auto; overflow-x: hidden">
                        <div class="list-group">
                            <div>
                                <c:forEach var="chapter" items="${listChapter}" varStatus="counter">
                                    <div class=" list-group-item list-group-item-action d-flex" data-toggle="collapse" href="#multiCollapseExample1_${counter.count}" role="button" aria-expanded="false" aria-controls="multiCollapseExample1_${counter.count}">
                                        <a style="text-decoration: none; color: black" class="align-self-center mr-auto font-weight-bold" >Chapter ${counter.count}: ${chapter.chapterName}</a>
                                    </div>
                                    <div class="collapse multi-collapse pl-4 mt-1 " id="multiCollapseExample1_${counter.count}">
                                        <c:set var="listContent" value="${chapter.list}"/>
                                        <c:forEach var="itemContent" items="${listContent}" varStatus="i">
                                            <div style="border-radius: 0rem;" class=" m-0 pb-1 card card-body border-bottom ">
                                                <a style="text-decoration: none; color: black" href="#" onclick="loadVideoURL('${itemContent.videoURL}')">
                                                    Lesson ${i.count}: ${itemContent.contentName}
                                                </a>
                                                <p>${itemContent.blog}</p>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:forEach>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="video col-md-8">
                    <iframe  id="loadVideo" src="" frameborder="0" allowfullscreen style=" border: solid 4px #37474F; width: 1200px; height: 650px">
                    </iframe>
                    <div style=".purple-border textarea {
                             border: 1px solid #ba68c8;
                         }
                         .purple-border .form-control:focus {
                             border: 1px solid #ba68c8;
                             box-shadow: 0 0 0 0.2rem rgba(186, 104, 200, .25);
                         }

                         .green-border-focus .form-control:focus {
                             border: 1px solid #8bc34a;
                             box-shadow: 0 0 0 0.2rem rgba(139, 195, 74, .25);
                         }">
                        <div class="form-group purple-border" style="width: 1200px">
                            <label for="exampleFormControlTextarea4">Blog</label>
                            <textarea class="form-control" id="exampleFormControlTextarea4" rows="3"> </textarea>
                        </div>
                    </div>
                    <button
                        type="button"
                        class="btn btn-primary btn-lg"
                        data-toggle="modal"
                        data-target="#modelRating"
                        style="display: flex; justify-content: space-evenly"
                        >
                        Feedback
                    </button>
                    <!-- Modal -->
                    <div
                        class="modal fade"
                        id="modelRating"
                        tabindex="-1"
                        role="dialog"
                        aria-labelledby="modelTitleId"
                        aria-hidden="true"
                        >
                        <form action="MainController" method="POST">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Feedback</h5>
                                        <button
                                            type="button"
                                            class="close"
                                            data-dismiss="modal"
                                            aria-label="Close"
                                            >
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="fullName">Mentor Name: ${UserID}</label>
                                        </div>
                                        <div id="rating">
                                            <input type="radio" id="star5" name="rating" value="5" />
                                            <label
                                                class="full"
                                                for="star5"
                                                title="Awesome - 5 stars"
                                                ></label>

                                            <input type="radio" id="star4" name="rating" value="4" />
                                            <label
                                                class="full"
                                                for="star4"
                                                title="Pretty good - 4 stars"
                                                ></label>

                                            <input type="radio" id="star3" name="rating" value="3" />
                                            <label class="full" for="star3" title="Meh - 3 stars"></label>

                                            <input type="radio" id="star2" name="rating" value="2" />
                                            <label
                                                class="full"
                                                for="star2"
                                                title="Kinda bad - 2 stars"
                                                ></label>

                                            <input type="radio" id="star1" name="rating" value="1" />
                                            <label
                                                class="full"
                                                for="star1"
                                                title="Sucks big time - 1 star"
                                                ></label>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button
                                            type="button"
                                            class="btn btn-secondary"
                                            data-dismiss="modal"
                                            >
                                            Close
                                        </button>
                                        <input type="hidden" name="subjectId" value="${subject}" />
                                        <input type="hidden" name="MentorName" value="${UserID}" />
                                        <input type="submit" name="action" value="Rating" class="btn btn-primary">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div> 
                </div>
            </div>
            <jsp:include page="footerTemplate.jsp"></jsp:include>
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
            <!-- Button trigger modal -->
            <script>
                                                    $('#exampleModal').on('show.bs.modal', event => {
                                                        var button = $(event.relatedTarget);
                                                        var modal = $(this);
                                                        // Use above variables to manipulate the DOM
                                                    });
            </script>
            <!--load video-->
            <script>
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
            </script>
    </body>
</html>

