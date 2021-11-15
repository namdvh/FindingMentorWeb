<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Instruction</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
            integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
            integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
            crossorigin="anonymous"
            />

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"
            />

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

    <body>
        <jsp:include page="headerTemplate.jsp"></jsp:include>
        <c:if test="${requestScope.search != null}">
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
                                                <th>Mentor Name</th>
                                                <th class="text-center">Rating</th>
                                                <th class="action text-right">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.search}" var="mentor">
                                                <tr class="candidates-list">
                                                    <td class="title">
                                                        <div class="thumb">
                                                            <img
                                                                class="img-fluid"
                                                                src="${mentor.images}"
                                                                alt=""
                                                                />
                                                        </div>
                                                        <div class="candidate-list-details">
                                                            <div class="candidate-list-info">
                                                                <div class="candidate-list-title">
                                                                    <h5 class="mb-0"><a href="#">${mentor.name}</a></h5>
                                                                </div>
                                                                <div class="candidate-list-option">
                                                                    <ul class="list-unstyled">
                                                                        <li>
                                                                            <i class="fas fa-filter pr-1"></i>
                                                                            Phone : ${mentor.phoneNumber} <br/>
                                                                        </li>
                                                                        <li>
                                                                            <i class="fas fa-map-marker-alt pr-1"></i
                                                                            >${mentor.address}
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="candidate-list-favourite-time text-center">
                                                        <a
                                                            class="candidate-list-favourite order-2 text-danger"
                                                            href="#"
                                                            ><img src="assets/images/star.png" width="20px" height="20px" alt="icon"/></a>
                                                        <span style="font-size: 20px" class="candidate-list-time order-1"
                                                              >${mentor.stars}</span
                                                        >
                                                    </td>
                                                    <td>
                                                        <ul
                                                            class="list-unstyled mb-0 d-flex justify-content-end"
                                                            >
                                                            <li>
                                                                <a
                                                                    href="MainController?action=LoadInfoMentor&UserID=${mentor.userID}"
                                                                    class="text-primary"
                                                                    data-toggle="tooltip"
                                                                    title=""
                                                                    data-original-title="view"
                                                                    ><i class="far fa-eye"></i
                                                                    ></a>
                                                            </li>
                                                        </ul>
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
        <c:if test="${requestScope.search == null}">
            <p style="text-align:center;font-size: 30px;color: red">No Result</p>
            <div style="text-align: center">
                <form action="MainController" method="POST">
                    <input style="height: 35px; width: 20%;" type="text" name="txtSearch" placeholder="Search mentor">
                    <button type="submit" name="action" value="Search" style="height: 40px; width: 40px; font-size: 20px; border-radius: 10px"><i class="fa fa-search"></i></button>
                </form>
            </div>
        </c:if>
        <jsp:include page="footerTemplate.jsp"></jsp:include>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

        <script src="./owlcarousel/owl.carousel.js"></script>

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
