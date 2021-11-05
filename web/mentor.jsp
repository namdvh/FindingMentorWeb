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
        <meta content="Mashup templates have been developped by Orson.io team" name="author"/>
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
    </head>
    <body>
        <jsp:include page="headerTemplate.jsp"></jsp:include>
        <c:if test="${sessionScope.LOGIN_USER eq null || sessionScope.LOGIN_USER.roleID ne 'MT'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <c:set var="listChapter" value="${requestScope.LIST_CHAPTER}"/>
        <c:forEach var="chapter" items="${listChapter}"> 
            <c:set var="listContent" value="${chapter.list}"/>
            <c:forEach var="itemContent" items="${listContent}" varStatus="i">
                <div class="modal fade" id="editContent${itemContent.contentID}" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <form action="MainMentorController" method="POST">
                                <input type="hidden" name="SubjectID" value="${sessionScope.SUBJECT_ID}" />
                                <input type="hidden" name="SubjectName" value="${sessionScope.SUBJECT_NAME}" />
                                <input type="hidden" name="UpdateContentID" value="${itemContent.contentID}" readonly="readonly" /><br>
                                <div class="modal-header">
                                    <h5 class="modal-title">Edit Content</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        <div class="form-group">
                                            <label for="fullName">Content Name:</label>
                                            <input type="text" class="form-control" id="fullName" placeholder="Content Name" name="UpdateContentName" value="${itemContent.contentName}" required="">
                                        </div>
                                        <div class="form-group">
                                            <label for="fullName">Video Url:</label>
                                            <input type="text" class="form-control" id="fullName" placeholder="Video Url" name="UpdateVideoURL" value="${itemContent.videoURL}" required="">
                                        </div>
                                        <div class="form-group">
                                            <label for="fullName">Blog:</label>
                                            <textarea type="text" class="form-control" id="fullName" placeholder="Blog" name="UpdateBlog" value="${itemContent.blog}" style="height: 240px">${itemContent.blog}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" value="UpdateContent" name="action">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:forEach>
        <c:set var="listChapter" value="${requestScope.LIST_CHAPTER}"/>
        <div class="">
            <div class="row">
                <div class="col-md-4">
                    <div class="d-flex justify-content-between mb-3">
                        <a  class="btn btn-success btn-sm rounded-0" href="user.jsp">Back</a>
                        <span><h2>Lesson content</h2></span>   
                        <button  type="button" class="btn btn-success btn-sm rounded-0" data-toggle="modal" data-target="#createChapter" >
                            Creater Chapter
                        </button>
                    </div>
                    <div class="modal fade" id="createChapter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <form action="MainMentorController" method="POST" onsubmit="">
                                    <input type="hidden" name="SubjectID" value="${sessionScope.SUBJECT_ID}" />
                                    <input type="hidden" name="SubjectName" value="${sessionScope.SUBJECT_NAME}" />
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLongTitle">Create Chapter</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="fullName">Subject Name</label>
                                            <input type="text" class="form-control" id="fullName" value="${sessionScope.SUBJECT_NAME}" readonly="">
                                        </div>
                                        <div class="form-group">
                                            <label for="fullName">Chapter Name:</label>
                                            <input type="text" class="form-control" id="fullName" placeholder="Chapter Name" name="NewChapterName" value="" required="">
                                        </div>
                                        <div class="form-group">
                                            <label for="fullName">Description:</label>
                                            <input type="text" class="form-control" id="fullName" placeholder="Description" name="NewDescription" value="">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary" value="CreateChapter" name="action">Create</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div style="height : 476px; overflow-y: auto; overflow-x: hidden">
                        <div class="list-group">
                            <div>
                                <c:forEach var="chapter" items="${listChapter}" varStatus="counter">
                                    <div class=" list-group-item list-group-item-action d-flex" data-toggle="collapse" href="#multiCollapseExample1_${counter.count}" role="button" aria-expanded="false" aria-controls="multiCollapseExample1_${counter.count}">
                                        <a style="text-decoration: none; color: black" class="align-self-center mr-auto font-weight-bold" >Chapter ${counter.count}: ${chapter.chapterName}</a>
                                        <button type="button" class="btn btn-danger btn-sm mr-2" data-toggle="modal" data-target="#createContent${counter.count}">+</button>
                                        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#updateChapter${counter.count}">
                                            Edit
                                        </button>
                                    </div>
                                    <div class="modal fade" id="createContent${counter.count}" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <form action="MainMentorController" method="POST" onsubmit="">
                                                    <input type="hidden" name="SubjectID" value="${sessionScope.SUBJECT_ID}" />
                                                    <input type="hidden" name="SubjectName" value="${sessionScope.SUBJECT_NAME}" />
                                                    <input type="hidden" name="NewContentChapterID" value="${chapter.chapterID}" readonly="readonly" /><br>
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Create Content</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="container-fluid">
                                                            <div class="form-group">
                                                                <label for="fullName">Content Name:</label>
                                                                <input type="text" class="form-control" id="fullName" placeholder="Content Name" name="contentName" value="" required="">
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="fullName">Video Url:</label>
                                                                <input type="url" class="form-control" id="fullName" placeholder="Video Url" name="videoURL" value="" required="">
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="fullName">Blog:</label>
                                                                <textarea type="text" class="form-control" id="fullName" name="blog" value="" placeholder="Blog" style="height: 240px"></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary" value="CreateContent" name="action">Create</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal fade" id="updateChapter${counter.count}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <form action="MainMentorController" method="POST" onsubmit="">
                                                    <input type="hidden" name="SubjectID" value="${sessionScope.SUBJECT_ID}" />
                                                    <input type="hidden" name="SubjectName" value="${sessionScope.SUBJECT_NAME}" />
                                                    <input type="hidden" name="UpdateChapterID" value="${chapter.chapterID}" readonly="readonly" /><br>
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">Update Chapter</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <label for="fullName">Chapter Name:</label>
                                                            <input type="text" class="form-control" id="fullName" placeholder="Chapter Name" name="UpdateChapterName" value="${chapter.chapterName}" required="">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="fullName">Description:</label>
                                                            <input type="text" class="form-control" id="fullName" placeholder="Description" name="UpdateDescription" value="${chapter.description}">
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary" value="UpdateChapter" name="action">Save</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="collapse multi-collapse pl-4 mt-1 " id="multiCollapseExample1_${counter.count}">
                                        <c:set var="listContent" value="${chapter.list}"/>
                                        <c:forEach var="itemContent" items="${listContent}" varStatus="i">
                                            <div style="border-radius: 0rem;" class=" m-0 pb-1 card card-body border-bottom ">
                                                <a style="text-decoration: none; color: black" href="#" onclick="loadVideoURL('${itemContent.videoURL}', '${itemContent.blog}')">
                                                    Lesson ${i.count}: ${itemContent.contentName}
                                                </a>
                                                <p class="card-text"><a href="#" class="badge badge-warning" data-toggle="modal" data-target="#editContent${itemContent.contentID}">Edit</a></p>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:forEach>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="video col-md-8">
                    <iframe  id="loadVideo" src="" frameborder="0" allowfullscreen style=" border: solid 4px #37474F">
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
                            <div class="form-control card" id="exampleFormControlTextarea4" style="width: 852px; height: auto"></div>
                        </div>
                    </div>
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
            function loadVideoURL(url, blog) {
                var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
                var match = url.match(regExp);
                if (match && match[7].length === 11) {
                    var id = match[7];
                    let urlpath = "https://www.youtube.com/embed/";
                    let urlpath2 = "?enablejsapi=1";
                    var videoURL = urlpath.concat(id, urlpath2);
                    document.getElementById("loadVideo").src = videoURL;
                    document.getElementById("exampleFormControlTextarea4").textContent = blog;
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

