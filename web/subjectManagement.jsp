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
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
            />
        <title>User Study</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.min.css">
        <link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
        <link href="New folder/main.a3f694c0.css" />
        <link rel="stylesheet" href="Subject/AllCourse.css" />

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
    <c:if test="${empty sessionScope.LOGIN_USER_NAME}">
        <c:redirect url="MainController?action=LoadInfor"></c:redirect>
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
                        <a href="MainController?action=ShowAll" style="font-size: 17px">All Subject</a>
                    </button>
                    <button>
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
                <c:forEach items="${allSubject}" var="load">
                    <div class="container-fluid" id="jar">
                        <div class="row mx-auto content">
                            <div class="col">
                                <button  style="float: right ; margin-top: 30px" type="button" class="btn btn-primary btn-lg">   
                                    <a style="color: white" href="MainController?action=Enroll&subjectId=${load.subjectId}&SubjectName=${load.subjectName}">  Join class  </a>                          
                                </button> 
                                <button  style="float: right ; margin-top: 30px; margin-right: 10px;" type="button" class="btn btn-primary btn-lg">                          
                                    <a style="color: white" href="MainController?action=LoadSubjectPage&subjectId=${load.subjectId}">  Detail  </a>
                                </button>
                                <div style="display: flex">
                                    <img
                                        src="${load.images}"
                                        alt=""
                                        style="width: 100px; height: 100px;padding-bottom: 10px"
                                        />
                                    <ul style="margin-left: 10px">                
                                        <p style="font-size: 20px;font-weight: bold;">${load.subjectName}</p>                         
                                        <p style="font-size: 15px">${load.description}</p>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
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
                                    <label for="courseName">Course Name:</label>
                                    <input maxlength="50" type="text" class="form-control" placeholder="max 50 letter" name="courseName"  required="">
                                </div>
                                <div class="form-group" style="padding-bottom: 20px">
                                    <label>Image</label><br/>
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
                                    <label for="courseName">Description: </label>
                                    <textarea type="text" class="form-control ckeditor" name="Description" required=""></textarea>
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
        <nav style="font-size: 18px" >
            <ul class="pagination justify-content-center" ></ul>
        </nav>
        <c:if test="${not empty requestScope.MSG_NO_STUDENT}">
            <script>
                window.onload = function sweetalertclick() {
                    Swal({
                        title: 'THERE ARE NO STUDENTS IN THIS COURSE',
                        confirmButtonText: 'Ok'
                    })
                }
            </script>
        </c:if>
        <c:if test="${not empty requestScope.MESS_SUCCESS}">
            <script>

                window.onload = function sweetalertclick() {
                    Swal({
                        title: 'Success',
                        text: 'Your request has been sent',
                        type: 'success',
                        confirmButtonText: 'Ok'
                    })
                }
            </script>
        </c:if>
        <c:if test="${not empty requestScope.duplicate}">
            <script>

                window.onload = function sweetalertclick() {
                    Swal({
                        text: 'Your accout already have this course',
                        type: 'warning',
                        confirmButtonText: 'Ok'
                    })
                }
            </script>
        </c:if>
        <c:if test="${not empty requestScope.duplicate_request}">
            <script>

                window.onload = function sweetalertclick() {
                    Swal({
                        text: 'This request already have in list',
                        type: 'warning',
                        confirmButtonText: 'Ok'
                    })
                }
            </script>
        </c:if>
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
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="sweetalert2.all.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

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
        <script src="ckeditor_4.16.2_basic/ckeditor/ckeditor.js"></script>
        <script>
                $('#exampleModal').on('show.bs.modal', event => {
                    var button = $(event.relatedTarget);
                    var modal = $(this);
                });
        </script>
        <script type="text/javascript" src="New folder/main.41beeca9.js"></script>
        <script>
                function getPageList(totalPages, page, maxLength) {
                    if (maxLength < 5)
                        throw "maxLength must be at least 5";

                    function range(start, end) {
                        return Array.from(Array(end - start + 1), (_, i) => i + start);
                    }

                    var sideWidth = maxLength < 9 ? 1 : 2;
                    var leftWidth = (maxLength - sideWidth * 2 - 3) >> 1;
                    var rightWidth = (maxLength - sideWidth * 2 - 2) >> 1;
                    if (totalPages <= maxLength) {
                        // no breaks in list
                        return range(1, totalPages);
                    }
                    if (page <= maxLength - sideWidth - 1 - rightWidth) {
                        // no break on left of page
                        return range(1, maxLength - sideWidth - 1)
                                .concat([0])
                                .concat(range(totalPages - sideWidth + 1, totalPages));
                    }
                    if (page >= totalPages - sideWidth - 1 - rightWidth) {
                        // no break on right of page
                        return range(1, sideWidth)
                                .concat([0])
                                .concat(
                                        range(
                                                totalPages - sideWidth - 1 - rightWidth - leftWidth,
                                                totalPages
                                                )
                                        );
                    }
                    // Breaks on both sides
                    return range(1, sideWidth)
                            .concat([0])
                            .concat(range(page - leftWidth, page + rightWidth))
                            .concat([0])
                            .concat(range(totalPages - sideWidth + 1, totalPages));
                }

                $(function () {
                    // Number of items and limits the number of items per page
                    var numberOfItems = $("#jar .content").length;
                    var limitPerPage = 5;
                    // Total pages rounded upwards
                    var totalPages = Math.ceil(numberOfItems / limitPerPage);
                    // Number of buttons at the top, not counting prev/next,
                    // but including the dotted buttons.
                    // Must be at least 5:
                    var paginationSize = 7;
                    var currentPage;

                    function showPage(whichPage) {
                        if (whichPage < 1 || whichPage > totalPages)
                            return false;
                        currentPage = whichPage;
                        $("#jar .content")
                                .hide()
                                .slice((currentPage - 1) * limitPerPage, currentPage * limitPerPage)
                                .show();
                        // Replace the navigation items (not prev/next):
                        $(".pagination li").slice(1, -1).remove();
                        getPageList(totalPages, currentPage, paginationSize).forEach(
                                (item) => {
                            $("<li>")
                                    .addClass(
                                            "page-item " +
                                            (item ? "current-page " : "") +
                                            (item === currentPage ? "active " : "")
                                            )
                                    .append(
                                            $("<a>")
                                            .addClass("page-link")
                                            .attr({
                                                href: "javascript:void(0)",
                                            })
                                            .text(item || "...")
                                            )
                                    .insertBefore("#next-page");
                        }
                        );
                        return true;
                    }

                    // Include the prev/next buttons:
                    $(".pagination").append(
                            $("<li>")
                            .addClass("page-item")
                            .attr({id: "previous-page"})
                            .append(
                                    $("<a>")
                                    .addClass("page-link")
                                    .attr({
                                        href: "javascript:void(0)",
                                    })
                                    .text("Prev")
                                    ),
                            $("<li>")
                            .addClass("page-item")
                            .attr({id: "next-page"})
                            .append(
                                    $("<a>")
                                    .addClass("page-link")
                                    .attr({
                                        href: "javascript:void(0)",
                                    })
                                    .text("Next")
                                    )
                            );
                    // Show the page links
                    $("#jar").show();
                    showPage(1);

                    // Use event delegation, as these items are recreated later
                    $(document).on(
                            "click",
                            ".pagination li.current-page:not(.active)",
                            function () {
                                return showPage(+$(this).text());
                            }
                    );
                    $("#next-page").on("click", function () {
                        return showPage(currentPage + 1);
                    });

                    $("#previous-page").on("click", function () {
                        return showPage(currentPage - 1);
                    });
                    $(".pagination").on("click", function () {
                        $("html,body").animate({scrollTop: 0}, 0);
                    });
                });
        </script>
    </body>
</html>
