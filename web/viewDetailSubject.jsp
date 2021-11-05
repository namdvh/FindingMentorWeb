<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <head>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Subject Detail</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
        <style>
            /*****************globals*************/
            body {
                font-family: 'Open Sans', sans-serif;
                overflow-x: hidden; }

            img {
                max-width: 100%; }

            .preview {
                display: -webkit-box;
                display: -webkit-flex;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                -webkit-flex-direction: column;
                -ms-flex-direction: column;
                flex-direction: column; }
            @media screen and (max-width: 996px) {
                .preview {
                    margin-bottom: 20px; } }

            .preview-pic {
                -webkit-box-flex: 1;
                -webkit-flex-grow: 1;
                -ms-flex-positive: 1;
                flex-grow: 1; }

            .preview-thumbnail.nav-tabs {
                border: none;
                margin-top: 15px; }
            .preview-thumbnail.nav-tabs li {
                width: 18%;
                margin-right: 2.5%; }
            .preview-thumbnail.nav-tabs li img {
                max-width: 100%;
                display: block; }
            .preview-thumbnail.nav-tabs li a {
                padding: 0;
                margin: 0; }
            .preview-thumbnail.nav-tabs li:last-of-type {
                margin-right: 0; }

            .tab-content {
                overflow: hidden; }
            .tab-content img {
                width: 100%;
                -webkit-animation-name: opacity;
                animation-name: opacity;
                -webkit-animation-duration: .3s;
                animation-duration: .3s; }

            .card {
                margin-top: 50px;
                background-color:#FFFACD	;
                background: #eee;
                padding: 3em;
                line-height: 1.5em; }

            @media screen and (min-width: 997px) {
                .wrapper {
                    display: -webkit-box;
                    display: -webkit-flex;
                    display: -ms-flexbox;
                    display: flex; } }

            .details {
                display: -webkit-box;
                display: -webkit-flex;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                -webkit-flex-direction: column;
                -ms-flex-direction: column;
                flex-direction: column; }

            .colors {
                -webkit-box-flex: 1;
                -webkit-flex-grow: 1;
                -ms-flex-positive: 1;
                flex-grow: 1; }

            .product-title, .price, .sizes, .colors {

                font-weight: bold; }

            .checked, .price span {
                color: #ff9f1a; }

            .product-title, .rating, .product-description, .price, .vote, .sizes {
                margin-bottom: 15px; }

            .product-title {
                margin-top: 0; }

            .size {
                margin-right: 10px; }
            .size:first-of-type {
                margin-left: 40px; }

            .color {
                display: inline-block;
                vertical-align: middle;
                margin-right: 10px;
                height: 2em;
                width: 2em;
                border-radius: 2px; }
            .color:first-of-type {
                margin-left: 20px; }

            .add-to-cart, .like {
                background: #ff9f1a;
                padding: 1.2em 1.5em;
                border: none;
                text-transform: UPPERCASE;
                font-weight: bold;
                color: #fff;
                -webkit-transition: background .3s ease;
                transition: background .3s ease; }
            .add-to-cart:hover, .like:hover {
                background: #b36800;
                color: #fff; }

            .not-available {
                text-align: center;
                line-height: 2em; }
            .not-available:before {
                font-family: fontawesome;
                content: "\f00d";
                color: #fff; }

            .orange {
                background: #ff9f1a; }

            .green {
                background: #85ad00; }

            .blue {
                background: #0076ad; }

            .tooltip-inner {
                padding: 1.3em; }

            @-webkit-keyframes opacity {
                0% {
                    opacity: 0;
                    -webkit-transform: scale(3);
                    transform: scale(3); }
                100% {
                    opacity: 1;
                    -webkit-transform: scale(1);
                    transform: scale(1); } }

            @keyframes opacity {
                0% {
                    opacity: 0;
                    -webkit-transform: scale(3);
                    transform: scale(3); }
                100% {
                    opacity: 1;
                    -webkit-transform: scale(1);
                    transform: scale(1); } }

            /*# sourceMappingURL=style.css.map */
        </style>
    </head>
    <c:if test="${sessionScope.LOGIN_USER eq null}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>
    <body style="font-family: 'Open Sans', sans-serif;">
        <jsp:include page="headerTemplate.jsp"></jsp:include>
            <div class="container">
                <div class="card" style="background-color: #FFFACD">
                    <div class="container-fliud">
                        <div class="wrapper row">
                            <div class="preview col-md-6">

                                <div class="preview-pic tab-content">
                                    <div class="tab-pane active" id="pic-1"><img style="width: 80%" src="${ViewPage.images}" /></div>
                            </div>

                        </div>
                        <div style="margin-top: 15px; margin-left: -70px" class="details col-md-3">
                            <h3 class="product-title" style="font-size: 17px">Subject Name: ${ViewPage.subjectName}</h3>
                            <p style="font-size: 12px; margin-top: 10px;text-align: left" class="product-description">${ViewPage.description}</p>
                            <p style="font-size: 15px; margin-top: 10px" class="price">Mentor Name: ${LoadMentor.name}</p>
                            <p style="font-size: 20px; margin-top: 10px" class="stars">Total <img src="assets/images/star.png" width="17px" height="17px" alt="icon"/>
                                : ${LoadMentor.stars}</p>

                        </div>
                        <div class="action col-md-3" style="
                             align-items: center;
                             margin-top: 45px;
                             ">
                            <h2 style="line-height: 6rem;
                                display: flex;
                                justify-content: center;
                                align-items: center;
                                font-weight: bold;
                                margin-left: 90px;">Free Course</h2>
                            <button style="margin-left: 100px; font-size: 25px " 
                                    class="add-to-cart btn btn-success" 
                                    style="font-size:25px; font-style: inherit"
                                    type="submit" >
                                <a style="color: white" href="MainController?action=Enroll&subjectId=${ViewPage.subjectId}">  Register </a>


                            </button>

                        </div>
                    </div>
                </div>
            </div>
    </body>
</div><jsp:include page="footerTemplate.jsp"></jsp:include>
</html>