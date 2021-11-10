<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Finding Mentor</title>

        <!-- FONT AEWSOME -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
              integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- BOOTSTRAP -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
              integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />

        <!-- SLICK -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" />

        <link rel="stylesheet" href="css/owlcarousel/assets/owl.carousel.css">
        <link rel="stylesheet" href="css/owlcarousel/assets/owl.theme.default.css">

        <!-- CSS -->
        <link rel="stylesheet" href="css/StyleHome.css" />
    </head>

    <body>
        <jsp:include page="headerTemplate.jsp"></jsp:include>

            <div id="introduceCarousel" class="carousel slide introduce-carousel" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#introduceCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#introduceCarousel" data-slide-to="1"></li>
                    <li data-target="#introduceCarousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="assets/images/banner1.jpg" alt="First slide" />
                        <div class="carousel-content text-center text-white">
                            <h1>Graphic Work <span>Designing</span></h1>
                            <p>
                                Any successful career starts with good education. Together with us you will have deeper
                                knowledge of the subjects
                            </p>
                            <form action="MainController" method="POST">
                                <input style="height: 35px; width: 20%;" type="text" name="txtSearch" placeholder="Search mentor">
                                <button type="submit" name="action" value="Search" style="height: 40px; width: 40px; font-size: 20px; border-radius: 10px"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="assets/images/banner2.jpg" alt="Second slide" />
                        <div class="carousel-content text-center text-white">
                            <h1>Financial Analyst <span>Course.</span></h1>
                            <p>
                                Any successful career starts with good education. Together with us you will have deeper
                                knowledge of the subjects
                            </p>
                            <form action="MainController" method="POST">
                                <input style="height: 35px; width: 20%;" type="text" name="txtSearch" placeholder="Search mentor">
                                <button type="submit" name="action" value="Search" style="height: 40px; width: 40px; font-size: 20px; border-radius: 10px"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="assets/images/banner3.jpg" alt="Third slide" />
                        <div class="carousel-content text-center text-white">
                            <h1>Digital Marketing <span>Course.</span></h1>
                            <p>
                                Any successful career starts with good education. Together with us you will have deeper
                                knowledge of the subjects
                            </p>
                            <form action="MainController" method="POST">

                                <input style="height: 35px; width: 20%;" type="text" name="txtSearch" placeholder="Search mentor">
                                <button type="submit" name="action" value="Search" style="height: 40px; width: 40px; font-size: 20px; border-radius: 10px"><i class="fa fa-search"></i></button>

                            </form>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#introduceCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#introduceCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <section class="ranking">
                <h2 style="display: flex;
                    justify-content: center;
                    align-item: center; 
                    margin-top: 30px;
                    font-size: 60px;
                    font">
                    TOP RANKING
                </h2>
                <div class="container" style="background-color: whitesmoke">
                    <div class="row" style="margin-bottom: 150px">
                        <div class="card md-4">
                            <a href="MainController?action=LoadInfoMentor&UserID=${rank1.userID}">
                            <div class="card_image" style="width: 200px; height: 300px;">
                                <img src="${rank1.images}" alt="">
                            </div>
                            <div class="content">
                                <p style="font-size: 20px; text-decoration: none;
                                   word-wrap:break-word;
                                   text-align: center;"> ${rank1.name}</p>
                                <p><img src="assets/images/star.png" style="width: 18px;height: 18px;">${rank1.stars}</p>
                            </div>
                        </a>
                    </div>
                    <div class="card md-4">
                        <a href="MainController?action=LoadInfoMentor&UserID=${rank2.userID}">
                            <div class="card_image" style="width: 200px; height: 300px;">
                                <img src="${rank2.images}" alt="">
                            </div>
                            <div class="content">
                                <p style="font-size: 20px; text-decoration: none;
                                   word-wrap:break-word;
                                   text-align: center;"> ${rank2.name}</p>
                                <p><img src="assets/images/star.png" style="width: 18px;height: 18px;">${rank2.stars}</p>
                            </div>
                        </a>
                    </div>
                    <div class="card md-4">
                        <a href="MainController?action=LoadInfoMentor&UserID=${rank3.userID}">
                            <div class="card_image" style="width: 200px; height: 300px;">
                                <img src="${rank3.images}" alt="">
                            </div>
                            <div class="content">
                                <p style="font-size: 20px; text-decoration: none;
                                   word-wrap:break-word;
                                   text-align: center;"> ${rank3.name}</p>
                                <p><img src="assets/images/star.png" style="width: 18px;height: 18px;">${rank3.stars}</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="card md-4" >
                        <a href="MainController?action=LoadInfoMentor&UserID=${rank4.userID}">
                            <div class="card_image" style="width: 200px; height: 300px;">
                                <img src="${rank4.images}" alt="">
                            </div>
                            <div class="content">
                                <p style="font-size: 20px; text-decoration: none;
                                   word-wrap:break-word;
                                   text-align: center;"> ${rank4.name}</p>
                                <p><img src="assets/images/star.png" style="width: 18px;height: 18px;">${rank4.stars}</p>
                            </div>
                        </a>
                    </div>
                    <div class="card md-4">
                        <a href="MainController?action=LoadInfoMentor&UserID=${rank5.userID}">
                            <div class="card_image" style="width: 200px; height: 300px;">
                                <img src="${rank5.images}" alt="">
                            </div>
                            <div class="content">
                                <p style="font-size: 20px; text-decoration: none;
                                   word-wrap:break-word;
                                   text-align: center;"> ${rank5.name}</p>
                                <p><img src="assets/images/star.png" style="width: 18px;height: 18px;">${rank5.stars}</p>
                            </div>
                        </a>
                    </div>
                    <div class="card md-4">
                        <a href="MainController?action=LoadInfoMentor&UserID=${rank6.userID}">
                            <div class="card_image" style="width: 200px; height: 300px;">
                                <img src="${rank6.images}" alt="">
                            </div>
                            <div class="content">
                                <p style="font-size: 20px; text-decoration: none;
                                   word-wrap:break-word;
                                   text-align: center;"> ${rank6.name}</p>
                                <p><img src="assets/images/star.png" style="width: 18px;height: 18px;">${rank6.stars}</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <section class="instruction__stats w-100 h-100" style="
                 background: url(assets/images/banner2.jpg);
                 background-repeat: no-repeat;
                 background-size: cover;
                 background-attachment: fixed;
                 background-position: center;
                 ">
            .
            <div class="container">
                <div class="stats__header educate__title">
                    <h3 class="heading-agileinfo">OUR STATS</h3>
                    <span>When Climbing The Carrer Ladder</span>
                </div>

                <div class="stats__number">
                    <div class="row">
                        <div class="col-12 col-sm-6 col-lg-3 stats__content">
                            <i class="fas fa-graduation-cap"></i>
                            <h3>Graduates</h3>
                            <p class="counter">45</p>
                        </div>
                        <div class="col-12 col-sm-6 col-lg-3 stats__content">
                            <i class="fas fa-user"></i>
                            <h3>Certified Staff</h3>
                            <p class="counter">165</p>
                        </div>
                        <div class="col-12 col-sm-6 col-lg-3 stats__content">
                            <i class="fas fa-users"></i>
                            <h3>Student</h3>
                            <p class="counter">563</p>
                        </div>
                        <div class="col-12 col-sm-6 col-lg-3 stats__content">
                            <i class="fas fa-trophy"></i>
                            <h3>Awards</h3>
                            <p class="counter">245</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="instruction__offer">
            <div class="container">
                <div class="offer__header educate__title">
                    <h3 class="heading-agileinfo">WHAT WE OFFER</h3>
                    <span>When Climbing The Carrer Ladder</span>
                </div>

                <div class="offer__card pt-5">
                    <div class="offer__top">
                        <div class="row">
                            <div class="col-lg-4 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                                        <h4>Undergraduate Study</h4>
                                        <p>
                                            Lorem ipsum dolor sit amet, Sed ut
                                            perspiciatis unde omnis iste natus
                                            error sit voluptatem
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <i class="fa fa-book" aria-hidden="true"></i>
                                        <h4>Professional Study</h4>
                                        <p>
                                            Lorem ipsum dolor sit amet, Sed ut
                                            perspiciatis unde omnis iste natus
                                            error sit voluptatem
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <i class="fa fa-tasks" aria-hidden="true"></i>
                                        <h4>Programs</h4>
                                        <p>
                                            Lorem ipsum dolor sit amet, Sed ut
                                            perspiciatis unde omnis iste natus
                                            error sit voluptatem
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="offer__bottom">
                        <div class="row">
                            <div class="col-lg-4 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <i class="far fa-comment"></i>
                                        <h4>Online Learning</h4>
                                        <p>
                                            Lorem ipsum dolor sit amet, Sed ut
                                            perspiciatis unde omnis iste natus
                                            error sit voluptatem
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <i class="far fa-bookmark"></i>
                                        <h4>Summer Session</h4>
                                        <p>
                                            Lorem ipsum dolor sit amet, Sed ut
                                            perspiciatis unde omnis iste natus
                                            error sit voluptatem
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <i class="fa fa-globe" aria-hidden="true"></i>
                                        <h4>Global Education</h4>
                                        <p>
                                            Lorem ipsum dolor sit amet, Sed ut
                                            perspiciatis unde omnis iste natus
                                            error sit voluptatem
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="instruction__testimonials" id="instruction__testimonials" style="
                 background-image: url(assets/images/banner3.jpg);
                 background-repeat: no-repeat;
                 background-size: cover;
                 background-attachment: fixed;
                 background-position: center;
                 ">
            <div class="container">
                <div class="offer__header educate__title pb-4">
                    <h3 class="heading-agileinfo">TESTIMONIALS</h3>
                    <span>When Climbing The Carrer Ladder</span>
                </div>

                <div class="owl-carousel">

                    <div class="testimonials__item ">

                        <div class="tetstimonials__card">
                            <div class="testimonials__content">
                                <p>
                                    Sed semper leo metus, a lacinia eros semper
                                    at. Etiam sodales orci sit amet vehicula
                                    pellentesque.
                                </p>
                            </div>

                            <div class="testimonials__picture">
                                <div class="img">
                                    <img src="${rank1.images}" alt="" />
                                </div>

                                <div class="infor">
                                    <h5>${rank1.name}</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="testimonials__item">

                        <div class="tetstimonials__card">
                            <div class="testimonials__content">
                                <p>
                                    Sed semper leo metus, a lacinia eros semper
                                    at. Etiam sodales orci sit amet vehicula
                                    pellentesque.
                                </p>
                            </div>

                            <div class="testimonials__picture">
                                <div class="img">
                                    <img src="${rank2.images}" alt="" />
                                </div>

                                <div class="infor">
                                    <h5>${rank2.name}</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="testimonials__item">

                        <div class="tetstimonials__card">
                            <div class="testimonials__content">
                                <p>
                                    Sed semper leo metus, a lacinia eros semper
                                    at. Etiam sodales orci sit amet vehicula
                                    pellentesque.
                                </p>
                            </div>

                            <div class="testimonials__picture">
                                <div class="img">
                                    <img src="${rank3.images}" alt="" />
                                </div>

                                <div class="infor">
                                    <h5>${rank3.name}</h5>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="testimonials__item">

                        <div class="tetstimonials__card">
                            <div class="testimonials__content">
                                <p>
                                    Sed semper leo metus, a lacinia eros semper
                                    at. Etiam sodales orci sit amet vehicula
                                    pellentesque.
                                </p>
                            </div>

                            <div class="testimonials__picture">
                                <div class="img">
                                    <img src="${rank4.images}" alt="" />
                                </div>

                                <div class="infor">
                                    <h5>${rank4.name}</h5>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="testimonials__item">

                        <div class="tetstimonials__card">
                            <div class="testimonials__content">
                                <p>
                                    Sed semper leo metus, a lacinia eros semper
                                    at. Etiam sodales orci sit amet vehicula
                                    pellentesque.
                                </p>
                            </div>

                            <div class="testimonials__picture">
                                <div class="img">
                                    <img src="${rank5.images}" alt="" />
                                </div>

                                <div class="infor">
                                    <h5>${rank5.name}</h5>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="testimonials__item">

                        <div class="tetstimonials__card">
                            <div class="testimonials__content">
                                <p>
                                    Sed semper leo metus, a lacinia eros semper
                                    at. Etiam sodales orci sit amet vehicula
                                    pellentesque.
                                </p>
                            </div>

                            <div class="testimonials__picture">
                                <div class="img">
                                    <img src="${rank6.images}" alt="" />
                                </div>

                                <div class="infor">
                                    <h5>${rank6.name}</h5>
                                </div>
                            </div>
                        </div>
                    </div>




                </div>
        </section>

        <!--********************* END INSTRUCTION__TESTIMONIALS *********************-->

        <!--********************* INSTRUCTION__NEWS *********************-->
        <section class="instruction__news">
            <div class="container">
                <div class="news__header educate__title pb-4">
                    <h3 class="heading-agileinfo">NEWS & EVENTS</h3>
                    <span>Exclusive Holidays For Any Travelers</span>
                </div>

                <div class="news__sit mb-5">
                    <div class="row">
                        <div class="col-12 col-md-5">
                            <img src="assets/images/g7.jpg" alt="" />
                        </div>
                        <div class="col-12 col-md-7 pl-3 pl-md-4 mt-4 mt-md-0">
                            <h5>
                                <a href="#" data-toggle="modal" data-target="#myModal">Sit amet justo vitae</a>
                            </h5>
                            <h6>3/01/2018</h6>
                            <p>
                                Proin euismod vehicula vestibulum. Fusce
                                ullamcorper aliquet dolor id egestas. Nulla leo
                                purus, facilisis non cursus ut, egestas sed
                                ipsum.Fusce ullamcorper aliquet dolor id
                                egestas. Nulla leo purus, facilisis non cursus
                                ut, egestas sed ipsum.Fusce ullamcorper aliquet
                                dolor id egestas. Nulla leo purus, facilisis non
                                cursus ut, egestas sed ipsum.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="news__fusce">
                    <div class="row">
                        <div class="col-12 col-md-7 pl-3 pl-md-4 mb-4 mb-md-0">
                            <h5>
                                <a href="#" data-toggle="modal" data-target="#myModal">Fusce scelerisque</a>
                            </h5>
                            <h6>5/01/2018</h6>
                            <p>
                                Proin euismod vehicula vestibulum. Fusce
                                ullamcorper aliquet dolor id egestas. Nulla leo
                                purus, facilisis non cursus ut, egestas sed
                                ipsum.Fusce ullamcorper aliquet dolor id
                                egestas. Nulla leo purus, facilisis non cursus
                                ut, egestas sed ipsum.Fusce ullamcorper aliquet
                                dolor id egestas. Nulla leo purus, facilisis non
                                cursus ut, egestas sed ipsum.
                            </p>
                        </div>

                        <div class="col-12 col-md-5">
                            <img src="assets/images/g10.jpg" alt="" />
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="footerTemplate.jsp"></jsp:include>

        <footer style="background-color: #0f0f10">
            <div class="container">
                <div class="footer__content">
                    <p>
                        © 2018 Instruction. All rights reserved | Design by
                        <a href="http://w3layouts.com">W3layouts</a>
                    </p>
                </div>
            </div>
        </footer>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- SLICK CAROUSEL -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

        <!-- OWL CAROUSEL -->
        <script src="css/owlcarousel/owl.carousel.js"></script>

        <!-- BOOTSTRAP -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
                integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
        crossorigin="anonymous"></script>

        <!-- Counter-Up -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.js"
                integrity="sha512-ZKNVEa7gi0Dz4Rq9jXcySgcPiK+5f01CqW+ZoKLLKr9VMXuCsw3RjWiv8ZpIOa0hxO79np7Ec8DDWALM0bDOaQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Counter-Up/1.0.0/jquery.counterup.js"
                integrity="sha512-+/4Q+xH9jXbMNJzNt2eMrYv/Zs2rzr4Bu2thfvzlshZBvH1g+VGP55W8b6xfku0c0KknE7qlbBPhDPrHFbgK4g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script type="text/javascript">
            $('.counter').counterUp({
                delay: 10,
                time: 1200,
            });
        </script>

        <script>
            // $(document).ready(function () {
            //     $(".owl-carousel").owlCarousel();
            // });
            $('.owl-carousel').owlCarousel({
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

                        loop: false
                    }
                }
            })
        </script>
    </body>
</html>