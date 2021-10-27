<%-- 
    Document   : admin.jsp
    Created on : Sep 30, 2021, 10:36:15 AM
    Author     : cunpl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <!-- Header -->
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
                <!-- End Logo + Top Nav -->
                <!-- Main Nav -->

                <!-- End Main Nav -->
            </div>
        </div>
        <!-- End Header -->
        <!-- Container -->
        <div id="container">
            <div class="shell">

                <!-- Message OK -->

                <!-- End Message OK -->
                <!-- Message Error -->

                <!-- End Message Error -->
                <br />
                <!-- Main -->
                <div id="main">
                    <div class="cl">&nbsp;</div>
                    <!-- Content -->
                    <div id="content">
                        <!-- Box -->
                        <div class="box">
                            <!-- Box Head -->
                            <div class="box-head">
                                <h2 class="left">Current Subject</h2>
                                <div class="right">
                                    <form action="MainController">
                                        <label>Subject Name</label>
                                        <input type="text" name="searchValue" class="field small-field" value="${param.searchValue}"/>
                                        <button type="submit" class="button" name="action" value="searchSubjectAdmin">Search</button>
                                    </form>

                                </div>
                            </div>
                            <!-- End Box Head -->
                            <!-- Table -->
                            <div class="table">
                                <table class="table-striped" width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <c:if test="${sessionScope.LIST_SUBJECT == null}">
                                        <tr>
                                            <th>Nothing to search</th>
                                        </tr>
                                    </c:if>
                                    <c:if test="${sessionScope.LIST_SUBJECT != null}">
                                        <tr>
                                            <th></th>
                                            <th>Subject Name</th>
                                            <th>Images</th>
                                            <th>User Id</th>
                                            <th>Category Id</th>
                                            <th>Status</th>
                                            <th width="110" class="ac">Content Control</th>
                                        </tr>

                                        <c:forEach var="s" items="${sessionScope.LIST_SUBJECT}">
                                            <tr>
                                                <th><input type="hidden" name="subjectId" value="${s.subjectId}"></th>
                                                <th>${s.subjectName}</th>
                                                <th>
                                                    <img src="${s.images}" width="50px" height="50px" alt="alt"/>
                                                </th>
                                                <th>${s.userId}</th>
                                                <th>${s.categoryId}</th>
                                                <th>${s.status}</th>
                                                <th>
                                                    <a href="MainController?action=deleteSubjectAdmin" class="ico del">Delete</a>
                                                    <a href="MainController?action=updateSubjectPageAdmin&subjectId=${s.subjectId}" class="ico edit">Edit</a>
                                                </th>

                                            </tr>
                                        </c:forEach>
                                    </c:if>

                                </table>
                                <!-- Pagging -->

                                <!-- End Pagging -->
                            </div>
                            <!-- Table -->
                        </div>
                        <!-- End Box -->
                        <!-- Box -->
                        <div class="box">
                            <!-- Box Head -->

                            <!-- End Box Head -->
                            <form action="MainController" method="post">
                                
                                <c:if test="${requestScope.UPDATE_SUBJECT != null}">
                                    <div class="box-head">
                                        <h2>Update Subject</h2>
                                    </div>
                                    <!-- Form -->
                                    <div class="form">

                                        <p> <span class="req">max 100 symbols</span>
                                            <label>Subject Name<span>(Required Field)</span></label>
                                            <input type="text" name="subjectName" class="field size1" value="${requestScope.UPDATE_SUBJECT.subjectName}" required=""/>
                                            <input type="hidden" name="subjectId" value="${requestScope.UPDATE_SUBJECT.subjectId}">
                                        </p>
                                        <p> <span class="req">max 100 symbols</span>
                                            <label>Image<span>(Required Field)</span></label>
                                            <input type="file" name="image" class="field size1" value=""/>
                                            <input type="hidden" name="oldImage" class="field size1" value="${requestScope.UPDATE_SUBJECT.images}"/>
                                        </p>
                                        <p class="inline-field">
                                            <label>Select Mentor</label>
                                            <select class="field size5" name="userId">
                                                <option value="${requestScope.UPDATE_SUBJECT.userId}">${requestScope.UPDATE_SUBJECT.userId}</option>
                                                <c:forEach var="user" items="${sessionScope.LIST_USER}">
                                                    <option value="${user.userID}">${user.userID}</option>
                                                </c:forEach>
                                            </select>

                                        </p>
                                        <p class="inline-field">
                                            <label>Category</label>
                                            <select class="field size5" name="categoryId">
                                                <option value="${requestScope.UPDATE_SUBJECT.categoryId}">${requestScope.UPDATE_SUBJECT.categoryId}</option>

                                                <c:forEach var="cate" items="${sessionScope.LIST_CATE}">
                                                    <option value="${cate.categoryId}">${cate.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                        </p>
                                        <p class="inline-field">
                                            <label>Status</label>

                                            <select class="field size5" name="status">
                                                <option value="${requestScope.UPDATE_SUBJECT.status}">${requestScope.UPDATE_SUBJECT.status}</option>

                                                <option value="True">Active</option>
                                                <option value="False">InActive</option>
                                            </select>
                                        </p>
                                        <p> <span class="req">max 100 symbols</span>
                                            <label>Description <span>(Required Field)</span></label>
                                            <textarea name="description" class="field size1" rows="10" cols="30" required="" >${requestScope.UPDATE_SUBJECT.description}</textarea>
                                        </p>
                                    </div>
                                    <!-- End Form -->
                                    <!-- Form Buttons -->
                                    <div class="buttons">
                                        <a href="MainController?action=LoadAdminPage" class="button">Cancle</a>
                                        <input type="submit" name="action" class="button" value="UpdateSubjectAdmin" />
                                    </div>
                                    <!-- End Form Buttons -->
                                </c:if>
                            </form>
                        </div>
                        <!-- End Box -->
                    </div>
                    <!-- End Content -->
                    <!-- Sidebar -->
                    <div id="sidebar">
                        <!-- Box -->
                        <div class="box">
                            <!-- Box Head -->
                            


                           

                            <div class="list-group">
                                <a href="MainController?action=LoadAdminPage" class="list-group-item list-group-item-action active">
                                    Dashboard
                                </a>
                                <a href="MainController?action=LoadMentorPage" class="list-group-item list-group-item-action">Mentor Management</a>
                                <a href="MainController?action=LoadUserPage" class="list-group-item list-group-item-action">User Management</a>
                                <a href="MainController?action=LoadApprovePage" class="list-group-item list-group-item-action">Approve Mentor</a>
                                <a href="MainController?action=addSubjectPage" class="list-group-item list-group-item-action">Add Subject</a>
                            </div>
                            <!-- End Box Head-->
                            <div class="box-content"> 
                                <div class="cl">&nbsp;</div>
                                <!-- Sort -->
                                <div class="sort">


                                </div>

                                <!-- End Sort -->
                            </div>
                        </div>
                        <!-- End Box -->
                    </div>
                    <!-- End Sidebar -->
                    <div class="cl">&nbsp;</div>
                </div>
                <!-- Main -->
            </div>
        </div>
        <!-- End Container -->
        <!-- Footer -->
        <div id="footer">
            <div class="shell"> <span class="left">&copy; 2021 - Company Four Class</span> <span class="right"> Design by <a href="http://chocotemplates.com">Chocotemplates.com</a> </span> </div>
        </div>
        <!-- End Footer -->
    </body>
</html>
