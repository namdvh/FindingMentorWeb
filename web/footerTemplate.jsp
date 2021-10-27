<%-- 
    Document   : footerTemplate
    Created on : Oct 26, 2021, 8:13:27 PM
    Author     : HuuToan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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

        <style>
            /******************************* END INSTRUCTION__INFORMATION *******************************/
      .instruction__information {
        padding: 6rem 0;
      }

      .instruction__information h3 {
        font-size: 24px;
        color: #ff4f81;
        position: relative;
        margin-bottom: 1.5em;
        font-weight: 600;
        letter-spacing: 1px;
      }

      .instruction__information p {
        color: #8b8b96;
        line-height: 2.7rem;
        margin-bottom: 2em;
      }

      .instruction__information li {
        list-style-type: none;
        display: block;
        margin-bottom: 2rem;
        color: #8b8b96;
      }

      .instruction__information .list i {
        color: #ff4f81;
        padding-right: 2rem;
      }

      .instruction__information a {
        text-decoration: none;
        color: #8b8b96;
        transition: all 0.5s;
      }

      .instruction__information a:hover {
        color: #fff;
      }

      .instruction__information .addess i {
        margin-right: 2rem;
        color: #fff;
        width: 32px;
        height: 32px;
        text-align: center;
        line-height: 30px;
        border: 1px solid #4b4b50;
      }

      .instruction__information .addess span {
        display: block;
        margin-left: 4.4rem;
        letter-spacing: 1px;
        font-size: 14.4px;
      }

      .instruction__information .post {
        display: flex;
      }

      .instruction__information .post form {
        display: contents;
      }

      .instruction__information .post input[type="email"] {
        height: 45px;
        outline: none;
        padding: 14px;
        background: #fff;
        font-size: 1rem;
        color: #888;
        width: 70%;
        margin-right: 1em;
        border: none;
        letter-spacing: 2px;
      }

      .instruction__information .post input[type="submit"] {
        height: 45px;
        outline: none;
        padding: 12px 0;
        background: #ff4f81;
        font-size: 1em;
        color: #fff;
        width: 20%;
        border: none;
        text-transform: uppercase;
        letter-spacing: 1px;
        transition: all 0.5s;
      }

      .instruction__information .post input[type="submit"]:hover {
        background: #ec1955;
      }

      /******************************* END INSTRUCTION__INFORMATION *******************************/
      /******************************* FOOTER *******************************/
      footer {
        text-align: center;
        padding: 1.5rem 0;
      }

      footer p {
        color: #fff;
        font-size: 14px;
        letter-spacing: 1px;
      }

      footer .footer__content a {
        text-decoration: none;
        color: #ff4f81;
        transition: all 0.5s;
      }

      footer a:hover {
        color: #fff;
      }
      /******************************* END INSTRUCTION__FOOTER *******************************/

            
        </style>
    </head>
    <body>
      <!--********************* INSTRUCTION__INFORMATION *********************-->
    <section class="instruction__information" style="background-color: #141415">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <h3>About Us</h3>
            <p style="font-size: 16px">
              Learning every day. Training your skill, make it easy and try your best!
            </p>
          </div>
          <div class="col-lg-4">
            <h3>Latest News</h3>
            <ul class="list">
              <li>
                <i class="fas fa-long-arrow-alt-right"></i>
                <a href=""> Lorem ipsum neque vulputate</a>
              </li>
              <li>
                <i class="fas fa-long-arrow-alt-right"></i>
                <a href=""> Dolor amet sed quam vitae</a>
              </li>
              <li>
                <i class="fas fa-long-arrow-alt-right"></i>
                <a href=""> Lorem ipsum neque, vulputate</a>
              </li>
              <li>
                <i class="fas fa-long-arrow-alt-right"></i>
                <a href=""> Dolor amet sed quam vitae</a>
              </li>
              <li>
                <i class="fas fa-long-arrow-alt-right"></i>
                <a href="">Lorem ipsum neque, vulputate</a>
              </li>
            </ul>
          </div>
          <div class="col-lg-4">
            <h3>Contact Info</h3>
            <ul class="addess">
              <li>
                  <a style="font-size: 14px" href="https://www.google.com/maps/place/Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+FPT+TP.+HCM/@10.84068,106.809585,18z/data=!4m5!3m4!1s0x0:0xb752b24b379bae5e!8m2!3d10.8414846!4d106.8100464?hl=vi">
                       <i class="fas fa-map-marker-alt"></i>
                             Block E2a-7, D1 street, High-tech Zone, Long Thanh My, Thu Duc City, Ho Chi Minh City.
                  </a>
               
              </li>

              <li>
                <i class="fas fa-envelope"></i>
                <a style="font-size: 18px" href="mailto:toannhse140397@fpt.edu.vn">toannhse140397@fpt.edu.vn</a>
              </li>

              <li style="font-size: 18px" >
                  <i  class="fas fa-phone-alt"></i>
                028.73005585
              </li>
            </ul>
          </div>
        </div>

        <div class="row pt-5">
         
          <div class="col-12 col-lg-8 post">
                      </div>
        </div>
      </div>
    </section>

    <!--********************* END INSTRUCTION__INFORMATION *********************-->
    <footer style="background-color: #0f0f10">
      <div class="container">
        <div class="footer__content">
          <p>
            © 2021 Copyright. All rights reserved | Design by C4 Team
           
          </p>
        </div>
      </div>
    </footer>

    </body>
</html>
