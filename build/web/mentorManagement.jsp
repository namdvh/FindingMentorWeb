<%-- 
    Document   : admin.jsp
    Created on : Sep 30, 2021, 10:36:15 AM
    Author     : cunpl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <li><a href="admin.jsp" ><span>Dashboard</span></a></li>
                        <li><a href="#"class="active"><span>Mentor Management</span></a></li>
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
                                <h2 class="left">Current Mentor</h2>
                                <div class="right">
                                    <label>search Mentor</label>
                                    <input type="text" class="field small-field" />
                                    <input type="submit" class="button" value="search" />
                                </div>
                            </div>
                            <!-- End Box Head -->
                            <!-- Table -->
                            <div class="table">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <th width="13"><input type="checkbox" class="checkbox" /></th>
                                        <th>Title</th>
                                        <th>Date</th>
                                        <th>Added by</th>
                                        <th width="110" class="ac">Content Control</th>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" class="checkbox" /></td>
                                        <td><h3><a href="#">Lorem ipsum dolor sit amet, consectetur.</a></h3></td>
                                        <td>12.05.09</td>
                                        <td><a href="#">Administrator</a></td>
                                        <td><a href="#" class="ico del">Delete</a><a href="#" class="ico edit">Edit</a></td>
                                    </tr>
                                    <tr class="odd">
                                        <td><input type="checkbox" class="checkbox" /></td>
                                        <td><h3><a href="#">Lorem ipsum dolor sit amet, consectetur.</a></h3></td>
                                        <td>12.05.09</td>
                                        <td><a href="#">Administrator</a></td>
                                        <td><a href="#" class="ico del">Delete</a><a href="#" class="ico edit">Edit</a></td>
                                    </tr>


                                </table>
                                <!-- Pagging -->
                                <div class="pagging">
                                    <div class="left">Showing 1-12 of 44</div>
                                    <div class="right"> <a href="#">Previous</a> <a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">245</a> <span>...</span> <a href="#">Next</a> <a href="#">View all</a> </div>
                                </div>
                                <!-- End Pagging -->
                            </div>
                            <!-- Table -->
                        </div>
                        <!-- End Box -->
                        <!-- Box -->

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
