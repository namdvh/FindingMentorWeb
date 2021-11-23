<%-- 
    Document   : admin.jsp
    Created on : Sep 30, 2021, 10:36:15 AM
    Author     : cunpl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor Page</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>
        <div id="header">
            <div class="shell">
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
                <div id="main" >
                    <div id="content" style="width: 938px" >
                        <div class="box">
                            <c:if test="${requestScope.DELETEUSER_MSG != null}">
                                ${requestScope.DELETEUSER_MSG}
                            </c:if>
                            <div class="box-head">
                                <form action="MainController">
                                    <h2 class="left">Current Mentor</h2>
                                    <div class="right">
                                        <label>Search Mentor</label>
                                        <input type="text" name="searchValue" class="field small-field" />
                                        <button class="button" type="submit" name="action" value="searchMentor">Search</button>
                                    </div>
                                </form>
                            </div>
                            <table class="table table-striped" border="0" cellspacing="0" cellpadding="0">
                                <c:if test="${requestScope.LIST_MENTOR_ADMIN == null}">
                                    <tr>
                                        <th>Nothing to search</th>
                                    </tr>
                                </c:if>
                                <c:if test="${requestScope.LIST_MENTOR_ADMIN != null}">
                                    <tr>
                                        <th>name</th>
                                        <th>email</th>
                                        <th>status</th>
                                        <th>birthday</th>
                                        <th>images</th>
                                        <th width="110" class="ac">Content Control</th>
                                    </tr>

                                    <c:forEach var="s" items="${requestScope.LIST_MENTOR_ADMIN}">
                                        <tr>
                                            <th>${s.name}</th>
                                            <th>${s.email}</th>
                                            <th>${s.status}</th>
                                            <th>${s.birthday}</th>
                                            <th>
                                                <img src="${s.images}" width="50px" height="50px" alt="alt"/>
                                            </th>
                                            <th>
                                                <c:if test="${s.status eq 'true'}">
                                                    <a href="MainController?action=deleteMentorAdmin&userId=${s.userID}" class="ico del">Delete</a>

                                                </c:if>
                                                <c:if test="${s.status eq 'false'}">
                                                    <a href="MainController?action=ActiveMentorAdmin&userId=${s.userID}" class="ico edit">Active</a>

                                                </c:if>
                                            </th>

                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </table>
                        </div>
                    </div>
                    <span style="display: flex; justify-content: flex-end; ">
                        <div class="box" style="margin-left: 15px">
                            <div class="list-group">
                                <a href="MainController?action=LoadAdminPage" class="list-group-item list-group-item-action ">
                                    Dashboard
                                </a>
                                <a href="MainController?action=LoadMentorPage" class="list-group-item list-group-item-action  active">Mentor Management</a>
                                <a href="MainController?action=LoadUserPage" class="list-group-item list-group-item-action ">User Management</a>
                                <a href="MainController?action=LoadApprovePage" class="list-group-item list-group-item-action">Approve Mentor</a>
                                <a href="MainController?action=LoadRequestSubject" class="list-group-item list-group-item-action">Request Subject</a>
                                <a href="MainController?action=addSubjectPage" class="list-group-item list-group-item-action ">Add Subject</a>
                                <a href="MainController?action=addCategoryPage" class="list-group-item list-group-item-action">Add Category</a>
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
