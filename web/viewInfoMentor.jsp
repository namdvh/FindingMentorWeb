<%-- 
    Document   : viewInfoMentor
    Created on : Nov 6, 2021, 1:41:23 PM
    Author     : Khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta content="IE=edge" http-equiv="X-UA-Compatible">
        <meta content="width=device-width,initial-scale=1" name="viewport">
        <meta content="description" name="description">
        <meta name="google" content="notranslate" />
        <meta content="Mashup templates have been developped by Orson.io team" name="author">

        <!-- Disable tap highlight on IE -->
        <meta name="msapplication-tap-highlight" content="no">

        <link href="assets/apple-touch-icon.png" rel="apple-touch-icon">
        <link href="assets/favicon.ico" rel="icon">

        <!-- link Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
              integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
              crossorigin="anonymous" />

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Update Page</title>  

        <link href="Profile/mentorInfo.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <jsp:include page="headerTemplate.jsp"></jsp:include>
        <body>
            <div class="container">
                <div class="row gutters">
                    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12" style="padding-top: 20%">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="account-settings">
                                    <div class="user-profile">
                                        <div class="user-avatar">
                                            <img src="${requestScope.MentorInfo.images}" alt="photo2">
                                    </div>
                                    <h3 class="user-name" style="">${requestScope.MentorInfo.name}</h3>
                                    <h6 class="user-email" style="font-size: 13px;">${requestScope.MentorInfo.email}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12" style="padding-top: 20%">
                    <div class="card h-100">
                        <div class="card-body" style="font-size: 18px">
                            <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">                                        
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="fullName">Full Name</label>
                                        <input name="Name" value="${requestScope.MentorInfo.name}" type="text" readonly="" class="form-control" id="fullName" placeholder="Enter full name" >
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="eMail">Email</label>
                                        <input name="Email" value="${requestScope.MentorInfo.email}" type="email" readonly="" class="form-control" id="email" placeholder="Enter email ID">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="phone">Phone</label>
                                        <input type="tel" value="${requestScope.MentorInfo.phoneNumber}" id="phone" readonly="" pattern="[0-9]{10,10}" class="form-control" name="phone" placeholder="0123456789"  required>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="website">Birthday</label>
                                        <input name="BirthDay" value="${requestScope.MentorInfo.birthday}" type="date" readonly="" class="form-control" id="website" placeholder="Birthday">
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="website">Job</label>
                                        <input name="roleName" value="${requestScope.MentorInfo.roleID}" type="text" readonly="" class="form-control" id="website" placeholder="">
                                    </div>
                                </div>
                            </div>
                            <div class="row gutters">
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="Street">Address</label>
                                        <input name="Address" value="${requestScope.MentorInfo.address}" type="name" readonly="" class="form-control" id="Street" placeholder="Enter Address">
                                    </div>
                                </div>                               
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="text-right">                                
                                    <form action="MainController" method="POST">
                                        <input type="hidden" name="MentorID" value="${requestScope.MentorInfo.userID}">
                                        <button type="submit" class="btn btn-success" name="action" value="ViewCourseOfMentor">
                                            View Course
                                        </button>       
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="footerTemplate.jsp"></jsp:include>

</html>
