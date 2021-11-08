<%-- 
    Document   : addSubject
    Created on : Oct 26, 2021, 10:06:48 PM
    Author     : Fangl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>

        <div id="header">
            <div class="shell">
                <!-- Logo + Top Nav -->
                <div id="top">
                    <h1><a href="#">SpringTime</a></h1>
                    <c:if test="${sessionScope.LOGIN_USER == null}">
                        <c:redirect url="user.jsp"/>
                    </c:if>
                    <c:if test="${sessionScope.LOGIN_USER != null}">
                        <c:if test="${sessionScope.LOGIN_USER.roleID ne 'AD'}">
                            <c:redirect url="user.jsp"/>
                        </c:if>
                        <c:if test="${sessionScope.LOGIN_USER.roleID eq 'AD'}">
                            <div id="top-navigation"> Welcome <a href="#"><strong>Administrator</strong></a> <span>|</span> <a href="MainController?action=Logout">Log out</a> </div>
                        </c:if>
                    </c:if>


                </div>

            </div>
        </div>


        <div class="container">
            <div class="row">
                <div id="main">
                    <div id="content">
                        <div class="box">
                            <form action="MainController" method="POST">
                                <div class="box-head">
                                    <h2>Add New Category</h2>
                                </div>
                                <div class="form">
                                    <p> <span class="req">max 100 symbols</span>
                                        <label>Category ID<span>(Required Field)</span></label>
                                        <input type="text" name="categoryID" class="field size1" value="${requestScope.UPDATE_SUBJECT.subjectName}" required=""/>
                                    </p>
                                    <p> <span class="req">max 100 symbols</span>
                                        <label>Category Name<span>(Required Field)</span></label>
                                        <input type="text" name="categoryName" class="field size1" value="${requestScope.UPDATE_SUBJECT.subjectName}" required=""/>
                                    </p>
                                </div>
                                <div class="buttons">
                                    <input type="submit" name="action" class="button" value="AddCategoryAdmin" />
                                </div>
                            </form>
                        </div>
                    </div>
                    <span style="display: flex; justify-content: flex-end; ">
                        <div class="box" style="margin-left: 15px">
                            <div class="list-group">
                                <a href="MainController?action=LoadAdminPage" class="list-group-item list-group-item-action ">
                                    Dashboard
                                </a>
                                <a href="MainController?action=LoadMentorPage" class="list-group-item list-group-item-action">Mentor Management</a>
                                <a href="MainController?action=LoadUserPage" class="list-group-item list-group-item-action">User Management</a>
                                <a href="MainController?action=LoadApprovePage" class="list-group-item list-group-item-action">Approve Mentor</a>
                                <a href="MainController?action=addSubjectPage" class="list-group-item list-group-item-action">Add Subject</a>
                                <a href="MainController?action=addCategoryPage" class="list-group-item list-group-item-action active">Add Category</a>
                            </div>
                        </div>
                    </span>
                </div>
            </div>
        </div>
        <div id="footer">
            <div class="shell"> <span class="left">&copy; 2021 - Company Four Class</span> <span class="right"> Design by <a href="http://chocotemplates.com">Chocotemplates.com</a> </span> </div>
        </div>


    </body>
</html>
