<%-- 
    Document   : createUser
    Created on : Oct 2, 2021, 7:33:51 PM
    Author     : MSI
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up Form by Colorlib</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="Create/fonts/material-icon/css/material-design-iconic-font.min.css">
        <!-- Main css -->
        <link rel="stylesheet" href="Create/css/style.css">
    </head>
    <body>
        <c:if test="${empty requestScope.USER_ERROR }">
            <h1> 
                <c:out value="${requestScope.USER_ERROR}"/>
            </h1>
        </c:if>
        <div class="main" style="padding-top: 55px; padding-left: 0; padding-right: 0; padding-bottom: 0;">

            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content" style="padding: 20px" >
                        <div class="signup-form">
                            <h2 class="form-title hide">Sign up</h2>

                            <form action="MainController" method="POST" class="register-form" id="register-form">
                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="UserID" id="name" placeholder="User Name" required/>
                                   User ID= ${requestScope.email}</br>
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="Email" id="email" placeholder="Your Email" required/>
                                  Email= ${requestScope.email}</br>
                                </div>
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="Password" id="pass" placeholder="Password" required/>
                                   passs: ${requestScope.id}</br>
                                </div>
                                <div class="form-group">
                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="password" name="ConfirmPassword" id="re_pass" placeholder="Repeat your password" required/>
                                    pass :${requestScope.id}</br>
                                </div>
                                <!-- <div class="form-group">
                                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                    <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                                </div> -->

                                <div style="margin-left: -13px;" >
                                    <div >
                                        <input name="RoleID" onclick="onInputChange()"  type="radio" name="RoleID" value="US" style="width: 10%; display: inline;" >
                                                                        <label for="html" style="position: unset"><span style="font-size: 15px;">Student</span></label><br>
                                    </div>

                                    <div >
                                        <input name="RoleID" onclick="onInputChangeBlock()"  type="radio" name="RoleID" value="MT" style="width: 10%; display: inline;">
                                                                        <label  for="html" style="position: unset"><span style="font-size: 15px;">Mentor</span></label><br>
                                    </div>
                                </div>

                                <div id="cerfiticate" class="form-group form-button" style="margin: 0; display: none;">
                                    <input type="text" name="Certificate"  
                                           style="padding: 12px 19px; background: linear-gradient(45deg, #FA5F1E, #F4939A);" 
                                           class="form-submit" placeholder="Certificate" />
                                </div>

                                <div class="form-group form-button">
                                    <input type="submit" name="action" id="signup" class="form-submit" value="Create"/>
                                </div>
                                <div class="form-group form-button">
                                    <input type="reset" name="Reset"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="Create/images/signup-image.jpg" alt="sing up image"></figure>
                            <a href="./index.html" class="signup-image-link">Home Page</a>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script>
                                            function onInputChange() {
                                                document.getElementById('cerfiticate').style.display = "none";
                                            }
                                            function onInputChangeBlock() {
                                                document.getElementById('cerfiticate').style.display = "block";
                                            }

        </script>
    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
