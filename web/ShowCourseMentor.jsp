<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Instruction</title>

        <!-- FONT AEWSOME -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
            integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />

        <!-- BOOTSTRAP -->
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
            integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
            crossorigin="anonymous"
            />

        <!-- SLICK -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"
            />
        <!-- OWL CAROUSEL -->
        <link rel="stylesheet" href="./owlcarousel/assets/owl.carousel.css" />
        <link rel="stylesheet" href="./owlcarousel/assets/owl.theme.default.css" />
        <!--  -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
            integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA="
            crossorigin="anonymous"
            />

        <!-- CSS -->
        <link rel="stylesheet" href="css/app.css" />
    </head>
    <jsp:include page="headerTemplate.jsp"></jsp:include>
        <body>
            <!--********************* HEADER *********************-->

            <!--********************* INSTRUCTION__MENU *********************-->
        <c:if test="${sessionScope.LOGIN_USER eq null}">

            <section>
                <div class="container mt-3 mb-4">
                    <div class="col-lg-9 mt-4 mt-lg-0">
                        <div class="row">
                            <div class="col-md-12">
                                <div
                                    class="
                                    user-dashboard-info-box
                                    table-responsive
                                    mb-0
                                    bg-white
                                    p-4
                                    shadow-sm
                                    "
                                    >
                                    <table class="table manage-candidates-top mb-0">
                                        <thead>
                                            <tr>
                                                <th>Course Name</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${ListCourseMentor}" var="list">
                                                <tr class="candidates-list">
                                                    <td class="title" style="max-width: 1000px">
                                                        <div class="thumb">
                                                            <img
                                                                class="img-fluid"
                                                                src="${list.images}"
                                                                alt=""
                                                                />
                                                        </div>
                                                        <div class="candidate-list-details">
                                                            <div class="candidate-list-info">
                                                                <div class="candidate-list-title">
                                                                    <h5 class="mb-0"><a href="#">${list.subjectName}</a></h5>
                                                                    <p class="fas fa-filter pr-1">Description ${list.description}</p>
                                                                </div>
                                                                <div class="candidate-list-option">
                                                                    <button  style="float: right;margin-top: 30p;" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelIdDetail">   
                                                                        <a style="color: white" href="MainController?action=Enroll&subjectId=${list.subjectId}">  Join class  </a>                          
                                                                    </button> 
                                                                    <!--button Detail-->
                                                                    <button  style="float: right;margin-top: 30px;" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelIdDetail">                          
                                                                        <a style="color: white" href="MainController?action=LoadSubjectPage&subjectId=${list.subjectId}">  Detail  </a>
                                                                    </button>          
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>      
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </c:if>
        <c:if test="${sessionScope.LOGIN_USER ne null}">
            <section>
                <div class="container mt-3 mb-4">
                    <div class="col-lg-9 mt-4 mt-lg-0">
                        <div class="row">
                            <div class="col-md-12">
                                <div
                                    class="
                                    user-dashboard-info-box
                                    table-responsive
                                    mb-0
                                    bg-white
                                    p-4
                                    shadow-sm
                                    "
                                    >
                                    <table class="table manage-candidates-top mb-0">
                                        <thead>
                                            <tr>
                                                <th>Course Name</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${ListCourseMentor}" var="list">
                                                <tr class="candidates-list ">
                                                    <td class=" title">
                                                        <div class="thumb" style="position: relative">
                                                            <img
                                                                class="img-fluid"
                                                                src="${list.images}"
                                                                alt=""
                                                               style="float: left"
                                                                />
                                                          <span style="float: right" ><a href="#">${list.subjectName}</a></span>   
                                                          <span  class="fas fa-filter" style="position: absolute;left: 5rem;display: flex;top: 2rem;white-space: nowrap; width: 350px; overflow: hidden; text-overflow: ellipsis;">Description: ${list.description} </span>     
                                                         
                                                        </div>
                                                          <div style="margin-left: 25rem" >
                                                            
                                                            
                                                             <button  style="float: right; margin-top: 30px" type="button" class="btn btn-primary">   
                                                                        <a style="color: white" href="MainController?action=Enroll&subjectId=${list.subjectId}">  Join class  </a>                          
                                                                    </button> 
                                                                    
                                                                    <button  style="float: right ; margin-top: 30px; margin-right: 10px;" class="btn btn-primary" type="button" >                          
                                                                        <a style="color: white" href="MainController?action=LoadSubjectPage&subjectId=${list.subjectId}">Detail</a>
                                                                    </button>
<!--                                                                <div class="candidate-list-title">
                                                                  
                                                                   
                                                                </div>
                                                                <div class="candidate-list-option">

                                                                    

                                                                </div>-->

                                                       
                                                        </div>
                                                          </td>          
                                                </tr>      
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </c:if>
        <jsp:include page="footerTemplate.jsp"></jsp:include>

        <!-- JQUERY -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- SLICK CAROUSEL -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

        <!-- OWL CAROUSEL -->
        <script src="./owlcarousel/owl.carousel.js"></script>

        <!-- BOOTSTRAP -->
        <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
            integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
            crossorigin="anonymous"
        ></script>

        <script>
            // $(document).ready(function () {
            //     $(".owl-carousel").owlCarousel();
            // });
            $(".owl-carousel").owlCarousel({
                loop: true,
                margin: 10,
                responsiveClass: true,
                dots: true,
                responsive: {
                    0: {
                        items: 2,
                    },
                    600: {
                        items: 2,
                    },
                    1000: {
                        items: 3,

                        loop: false,
                    },
                },
            });
        </script>
    </body>
</html>
