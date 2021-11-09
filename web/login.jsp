<%-- 
    Document   : login
    Created on : Oct 30, 2021, 8:34:22 PM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up Form by Colorlib</title>

        <link rel="stylesheet" href="LoginUser/Login/fonts/material-icon/css/material-design-iconic-font.min.css">

        <link rel="stylesheet" href="LoginUser/Login/css/style.css">
    </head>
    <body>
        <div class="main" style="padding: 35px 0;">
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="LoginUser/Login/images/signin-image.jpg" alt="sing up image"></figure>
                            <a href="MainController?action=CreatePage" class="signup-image-link">Create an account</a>
                              <a style="text-decoration: none; font-weight: bold" href="MainController?action=Load" class="signup-image-link">Home Page</a>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Sign up</h2>
                            <form method="POST" class="register-form" id="login-form" action="MainController">
                                <div class="form-group">
                                    <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="your_name" id="your_name" placeholder="Your Name" required/>
                                </div>
                                <div class="form-group">
                                    <label for="your_pass"><i class="zmdi zmdi-lock"></i>   <i class="fa fa-eye toggle"></i></label>
                                    <input type="password" name="your_pass" id="your_pass" placeholder="Password" required />      
                                </div>
                                <c:if test="${sessionScope.ERROR_MESSAGE_LOGIN !=null}">
                                    <a style="color: red"> ${sessionScope.ERROR_MESSAGE_LOGIN} </a>
                                </c:if>
                                <div class="form-group">
                                    <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                    <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="action" id="signin" class="form-submit" value="Login"/>
                                </div>

                            </form>
                            <div class="social-login" >
                               
                                <span class="social-label">Or login with</span>
                                <ul class="socials">

                                    <li><a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://c4findingmentor.xyz/FindingMentor/LoginGoogleHandler&response_type=code
                                           &client_id=380967411552-jeldl8hjr9a2ou8e3jkbvpcrinb3an5m.apps.googleusercontent.com&approval_prompt=force"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <!-- JS -->
        <script src="LoginUser/Login/vendor/jquery/jquery.min.js"></script>
        <script src="LoginUser/Login/js/main.js"></script>
    </body>
</html>
