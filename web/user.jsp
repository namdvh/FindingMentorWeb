<%-- 
    Document   : user
    Created on : Sep 30, 2021, 10:37:09 AM
    Author     : cunpl
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

        <!-- Style dropdown -->
        <style>
            .dropbtn {
                font-size: 16px;
                border: none;
                cursor: pointer;
            }

            .dropdown {
                position: relative;
                display: inline-block;
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
    </head>
    <body>
        <h1>User</h1>

        <!-- Add your content of header -->
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
                            <img src="./assets/images/mashuptemplate.svg" class="navbar-logo-img" alt="">
                        </a>
                    </div>

                    <div class="collapse navbar-collapse" id="navbar-collapse-uarr">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="user.jsp" title="" class="active">Home</a></li>
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

                            <!-- LOGIN LOGOUT -->


                            <!-- <li><a href="./pricing.html" title="" > Profile </a></li> -->


                            <c:if test="${sessionScope.LOGIN_USER == null}">
                                <li><a href="createUser.jsp" title="" >Đăng Ký</a></li>
                                <li><a href="MainController?action=LoginPage" title="">Đăng Nhập</a></li>

                            </c:if>
                                
                            <c:if test="${sessionScope.LOGIN_USER != null}">
                                <p>Welcome, ${sessionScope.LOGIN_USER.name}</p>
                            </c:if>
                            <li>
                                
                                <!-- comment dropdown -->
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



        <div class="white-text-container background-image-container" style="background-image: url('./assets/images/img-home.jpg')">
            <div class="opacity"></div>
            <div class="container">
                <div class="row">

                    <div class="col-md-6">

                        <input type="text" class="input" placeholder="Search" style="width: 100%;">
                    </div>

                </div>
            </div>
        </div>

        <div class="section-container border-section-container">
            <div class="container">
                <div class="col-lg-4 mb-4 col-sm-6">
                    <div class="card">
                        <img src="./assets/zua1566722846.jpg" class="card-img-top" alt="...">
                        <div class="cardx-body"> 
                            <div class="cardx-title" >Top 1</div>
                            <p class="card-text">môn học</p>
                            <div class="dropdownb">
                                <div class="detailButton">Chi tiết</div>
                                <div class="dropdown-contentb">
                                    <div class="inforbox">
                                        <h12>tên</h12><br>
                                        <h113>Financial Advisory Associate - M&A Transaction Service tại Deloitte</h113><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4 col-sm-6">
                    <div class="card">
                        <img src="./assets/zua1566722846.jpg" class="card-img-top" alt="...">
                        <div class="cardx-body"> 
                            <div class="cardx-title" >Top 1</div>
                            <p class="card-text">môn học: toán</p>
                            <div class="dropdownb">
                                <div class="detailButton">Chi tiết</div>
                                <div class="dropdown-contentb">
                                    <div class="inforbox">
                                        <h12>tên</h12><br>
                                        <h113>Financial Advisory Associate - M&A Transaction Service tại Deloitte</h113><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4 col-sm-6">
                    <div class="card">
                        <img src="./assets/zua1566722846.jpg" class="card-img-top" alt="...">
                        <div class="cardx-body"> 
                            <div class="cardx-title" >Top 1</div>
                            <p class="card-text">môn học</p>
                            <div class="dropdownb">
                                <div class="detailButton">Chi tiết</div>
                                <div class="dropdown-contentb">
                                    <div class="inforbox">
                                        <h12>tên</h12><br>
                                        <h113>Financial Advisory Associate - M&A Transaction Service tại Deloitte</h113><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="section-container">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">

                    <section class="service">
                        <div class="service__content">
                            <div class="service__title">

                                <h1>Subjects</h1>           
                            </div>

                            <div class="service__slider">
                                <div class="slick-slider">
                                    <div class="item">
                                        <i class="fa fa-dice-d6"></i>
                                        <p>
                                            APP MOBILE<br>DEVELOPMENT
                                        </p>
                                    </div>

                                    <div class="item">
                                        <i class="fab fa-autoprefixer"></i>
                                        <p>
                                            DIGITAL<br> MARKETING
                                        </p>
                                    </div>
                                    <div class="item">
                                        <i class="fab fa-500px"></i>
                                        <p>
                                            SEO &amp; CONTENT <br>WRITING
                                        </p>
                                    </div>
                                    <div class="item">
                                        <i class="fa fa-blog"></i>
                                        <p>
                                            WEBSITE<br>DEVELOPMENT
                                        </p>
                                    </div>
                                    <div class="item">
                                        <i class="fab fa-battle-net"></i>
                                        <p>
                                            SEO &amp; CONTENT <br>WRITING
                                        </p>
                                    </div>
                                    <div class="item">
                                        <i class="fa fa-memory"></i>
                                        <p>
                                            APP MOBILE<br>DEVELOPMENT
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        
                        <div class="carousel-inner" role="listbox">
                            <div class="item active" style="width: 50px; height:100px">
                                <img class="img-responsive" src="./assets/HTML5-là-gì-Ưu-diểm-nổi-bật-của-HTML5.jpg" alt="First slide" >
                            </div>
                            <div class="item" style="width: 50px; height:100px">
                                <img class="img-responsive" src="./assets/cover-a1d5b40.png" alt="Second slide" style="width: 50px; height:100px; object-fit: contain;">
                            </div>
                            <div class="item" style="width: 50px; height:100px">
                                <img class="img-responsive" src="./assets/cafedevn_css.jpg" alt="Third slide" >
                            </div>
                        </div>
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                    </div> -->


                </div>
            </div>
        </div>
    </div>


    <!-- <div class="section-container background-color-container white-text-container">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="text-center">
                        <h2>Vivamus laoreet</h2>
                        <p> Auctor augue mauris augue neque. Posuere lorem ipsum dolor sit amet consectetur adipiscing. Porta non
                            pulvinar neque laoreet. Viverra ipsum nunc aliquet bibendum. Iaculis urna id volutpat lacus. Turpis
                            egestas pretium aenean pharetra magna ac. Id cursus metus aliquam eleifend mi. </p>
                        <a href="./download.html" title="" class="btn btn-primary btn-lg">Download</a>
                    </div>
                </div>
            </div>
         </div>
     </div> -->

    <!-- <div class="section-container">
       <div class="container">
           <div class="row">                   
               <div class="col-md-7">
                   <img class="img-responsive" src="./assets/images/img-06.png" alt="">
               </div>
   
               <div class="col-md-5">
                   <ul class="features">
                       <li>
                           <h3>Dui augue</h3>
                           <p>Auctor augue mauris augue neque. Posuere lorem ipsum dolor sit amet consectetur adipiscing.
                           </p>
                       </li>
                       <li>
                           <h3>Malesuada</h3>
                           <p>Auctor augue mauris augue neque. Posuere lorem ipsum dolor sit amet consectetur adipiscing.
                           </p>
                       </li>
                       <li>
                           <h3>Bibendum</h3>
                           <p>Auctor augue mauris augue neque. Posuere lorem ipsum dolor sit amet consectetur adipiscing.
                           </p>
                       </li>
                   </ul>
               </div>
           
   
                 
               <div class="row">
                   <div class="col-md-4">
                           <img class="img-responsive page-base-image" src="./assets/images/logo-01.png" alt="">
   
                   </div>
                   <div class="col-md-4">
                           <img class="img-responsive page-base-image" src="./assets/images/logo-02.png" alt="">
                   </div>
                   <div class="col-md-4">
                           <img class="img-responsive page-base-image" src="./assets/images/logo-03.png" alt="">
                   </div>
               </div>
               
           </div>
       </div>
   </div> -->






    <!-- <footer>
        <div class="section-container footer-container">
            <div class="container">
                <div class="row">
                        <div class="col-md-4">
                            <h4>About us</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet consectetur dolor</p>
                        </div>
    
                        <div class="col-md-4">
                            <h4>Do you like ? Share this !</h4>
                            <p>
                                <a href="https://facebook.com/" class="social-round-icon white-round-icon fa-icon" title="">
                                <i class="fa fa-facebook" aria-hidden="true"></i>
                              </a>
                              <a href="https://twitter.com/" class="social-round-icon white-round-icon fa-icon" title="">
                                <i class="fa fa-twitter" aria-hidden="true"></i>
                              </a>
                              <a href="https://www.linkedin.com/" class="social-round-icon white-round-icon fa-icon" title="">
                                <i class="fa fa-linkedin" aria-hidden="true"></i>
                              </a>
                            </p>
                            <p><small>© Untitled | Website created with <a href="http://www.mashup-template.com/" class="link-like-text" title="Create website with free html template">Mashup Template</a>/<a href="http://www.unsplash.com/" class="link-like-text" title="Beautiful Free Images">Unsplash</a></small></p>    
                        </div>
    
                        <div class="col-md-4">
                            <h4>Subscribe to newsletter</h4>
                            
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control footer-input-text">
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-primary btn-newsletter ">OK</button>
                                    </div>
                                </div>
                            </div>
    
    
                        </div>
                </div>
            </div>
        </div>
    </footer> -->

    <script>
        document.addEventListener("DOMContentLoaded", function (event) {
            navActivePage();
        });
    </script>

    <!-- Google Analytics: change UA-XXXXX-X to be your site's ID 
    
    <script>
      (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
          (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date(); a = s.createElement(o),
          m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
      })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
      ga('create', 'UA-XXXXX-X', 'auto');
      ga('send', 'pageview');
    </script>
    
    -->

    <script type="text/javascript" src="./main.41beeca9.js"></script>

    <!-- JQUERY  -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
    <!-- SLICK CAROUSEL  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js" ></script>

    <!-- HANDLE SLICK CAROUSEL -->
    <script type="text/javascript">
        $(document).ready(function () {
            $('.slick-slider').slick({
                //settings
                infinite: true,
                slidesToShow: 5,
                slidesToScroll: 1,
                autoplay: true,
                dots: true,
                arrows: false,
            });
        });
    </script>

</body>
</html>
