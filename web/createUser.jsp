<%-- 
    Document   : createUser
    Created on : Oct 2, 2021, 7:33:51 PM
    Author     : MSI
--%>

<%@page import="c4.fm.user.UserError"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
       

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

                            <form action="CreateController" method="POST" class="register-form" id="register-form" enctype="multipart/form-data"> 
                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="UserID" id="name" placeholder="User Name" required value="${requestScope.UserID}"/>
                                    <a style="color: red" > ${requestScope.USER_ERROR.getUserIDError()} </a></br>
                                </div>
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="Password" id="pass" placeholder="Password" required/>
                                    <a style="color: red"> ${requestScope.USER_ERROR.getPasswordError()}</a>
                                </div>
                                <div class="form-group">
                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="password" name="ConfirmPassword" id="re_pass" placeholder="Repeat your password" required/>
                                    <a style="color: red"> ${requestScope.USER_ERROR.getConfirmPasswordError()}</a>
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
                                    <input type="file" name="Certificate"  
                                           style="padding: 12px 19px; background: linear-gradient(45deg, #FA5F1E, #F4939A);" 
                                           class="form-submit" placeholder="Certificate" />
                                </div>

                                <div class="form-group form-button">                                 
                                    <input type="submit" name="action" id="signup" class="form-submit" value="Create"/>
                                    <input type="reset" name="action" id="signup" class="form-submit" value="Reset"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="Create/images/signup-image.jpg" alt="sing up image"></figure>
                            <a style="text-decoration: none; font-weight: bold" href="MainController?action=Load" class="signup-image-link">Home Page</a>
                            <div class="social-login" style="margin-top: 10px; margin-left: 75px;" >
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li><a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/FindingMentor/LoginGoogleHandler&response_type=code
                                       &client_id=380967411552-jeldl8hjr9a2ou8e3jkbvpcrinb3an5m.apps.googleusercontent.com&approval_prompt=force"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>
                        </div>
<!--                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">

                                <li><a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/FindingMentor/LoginGoogleHandler&response_type=code
                                       &client_id=380967411552-jeldl8hjr9a2ou8e3jkbvpcrinb3an5m.apps.googleusercontent.com&approval_prompt=force"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>-->
                                
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
