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
    </head>
    <body>
        <!-- Header -->
        <div id="header">
            <div class="shell">
                <!-- Logo + Top Nav -->
                <div id="top">
                    <h1><a href="#">SpringTime</a></h1>
                    <div id="top-navigation"> Welcome <a href="#"><strong>Administrator</strong></a> <span>|</span> <a href="#">Log out</a> </div>
                </div>
                <!-- End Logo + Top Nav -->
                <!-- Main Nav -->
                <div id="navigation">
                    <ul>
                        <li><a href="#" class="active"><span>Dashboard</span></a></li>
                        <li><a href="mentorManagement.jsp"><span>Mentor Management</span></a></li>
                        <li><a href="#"><span>User Management</span></a></li>
                        <li><a href="#"><span>Approve Mentor</span></a></li>
                    </ul>
                </div>
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
                                    <label>search Subject</label>
                                    <input type="text" class="field small-field" />
                                    <input type="submit" class="button" value="search" />
                                </div>
                            </div>
                            <!-- End Box Head -->
                            <!-- Table -->
                            <div class="table">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <c:if test="${sessionScope.LIST_SUBJECT == null}">
                                        Nothing to search
                                    </c:if>
                                    <c:if test="${sessionScope.LIST_SUBJECT != null}">
                                        <tr>
                                            <th>Subject Id</th>
                                            <th>Subject Name</th>
                                            <th>Images</th>
                                            <th>User Id</th>
                                            <th>Category Id</th>
                                            <th>Status</th>
                                            <th width="110" class="ac">Content Control</th>
                                        </tr>

                                        <c:forEach var="s" items="${sessionScope.LIST_SUBJECT}">
                                            <tr>
                                                <th>${s.subjectId}</th>
                                                <th>${s.subjectName}</th>
                                                <th>${s.images}</th>
                                                <th>${s.userId}</th>
                                                <th>${s.categoryId}</th>
                                                <th>${s.status}</th>
                                                <th>
                                                    <a href="#" class="ico del">Delete</a><a href="#" class="ico edit">Edit</a>

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
                            <div class="box-head">
                                <h2>Add New Subject</h2>
                            </div>
                            <!-- End Box Head -->
                            <form action="#" method="post">
                                <!-- Form -->
                                <div class="form">
                                    <p> <span class="req">max 100 symbols</span>
                                        <label>Subject Name<span>(Required Field)</span></label>
                                        <input type="text" class="field size1" />
                                    </p>
                                    <p> <span class="req">max 100 symbols</span>
                                        <label>Image<span>(Required Field)</span></label>
                                        <input type="text" class="field size1" />
                                    </p>
                                    <p class="inline-field">
                                        <label>Select Mentor</label>
                                        <select class="field size5">
                                            <c:forEach var="user" items="${sessionScope.LIST_USER}">
                                                <option value="${user.userID}">${user.userID}</option>
                                            </c:forEach>
                                        </select>

                                    </p>
                                    <p class="inline-field">
                                        <label>Category</label>
                                        <select class="field size5">
                                             <c:forEach var="cate" items="${sessionScope.LIST_CATE}">
                                                <option value="${cate.categoryId}">${cate.categoryName}</option>
                                            </c:forEach>
                                        </select>

                                    </p>
                                    <p> <span class="req">max 100 symbols</span>
                                        <label>Description <span>(Required Field)</span></label>
                                        <textarea class="field size1" rows="10" cols="30"></textarea>
                                    </p>
                                </div>
                                <!-- End Form -->
                                <!-- Form Buttons -->
                                <div class="buttons">
                                    <input type="button" class="button" value="preview" />
                                    <input type="submit" class="button" value="submit" />
                                </div>
                                <!-- End Form Buttons -->
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
                            <div class="box-head">
                                <h2>Management</h2>
                            </div>
                            <!-- End Box Head-->
                            <div class="box-content"> 
                                <div class="cl">&nbsp;</div>
                                <!-- Sort -->
                                <div class="sort">
                                    <label>Sort by</label>
                                    <a class="field" href="url">Subject</a>
                                    <a class="field" href="url">Date</a>
                                    <a class="field" href="Author">Mentor</a>
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
