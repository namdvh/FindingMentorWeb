
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Subject</title>

        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>

        <div id="header">
            <div class="shell">
                <!-- Logo + Top Nav -->
                <div id="top">
                    <h1><a href="MainController?action=LoadAdminPage">Administrator</a></h1>
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
                            <form action="AddSubjectAdminServlet" method="post" enctype="multipart/form-data">
                                <div class="box-head">
                                    <h2>Add New Subject</h2>
                                </div>
                                <div class="form">
                                    <p> 
                                        <c:if test="${requestScope.ADDSUBJECT_MSG != null}">
                                            <label style="color: red">${requestScope.ADDSUBJECT_MSG}</label>
                                        </c:if>
                                        <c:if test="${requestScope.UPDATE_MSG != null}">
                                            <label style="color: red">${requestScope.UPDATE_MSG}</label>
                                        </c:if>
                                    </p>
                                    <p> <span class="req">max 100 symbols</span>
                                        <label>Subject Name<span>(Required Field)</span></label>
                                        <input type="text" name="subjectName" class="field size1" required=""/>
                                    </p>
                                    <p> <span class="req">max 100 symbols</span>
                                        <label>Image<span>(Required Field)</span></label>
                                        <input type="file" name="image" class="field size1" required="" accept="image/*"/>
                                    </p>
                                    <p class="inline-field">
                                        <label>Select Mentor</label>
                                        <select class="" name="userId">
                                            <c:forEach var="user" items="${sessionScope.LIST_USER}">
                                                <option value="${user.userID}">${user.userID}</option>
                                            </c:forEach>
                                        </select>

                                    </p>
                                    <p class="inline-field">
                                        <label>Category</label>
                                        <select class="" name="categoryId">
                                            <c:forEach var="cate" items="${sessionScope.LIST_CATE}">
                                                <option value="${cate.categoryId}">${cate.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </p>
                                    <p class="inline-field">
                                        <label>Status</label>
                                        <select class="field size5" name="status">
                                            <option value="True">Active</option>
                                            <option value="False">InActive</option>
                                        </select>
                                    </p>
                                    <p> <span class="req">max 100 symbols</span>
                                        <label>Description <span>(Required Field)</span></label>
                                        <textarea name="description" class="field size1 ckeditor" rows="10" cols="30" required="" maxlength="100"></textarea>
                                    </p>
                                </div>
                                <div class="buttons">
                                    <input type="submit" name="action" class="button" value="AddSubjectAdmin" />
                                </div>
                            </form>
                        </div>
                    </div>
                    <c:if test="${requestScope.UPDATE_SUBJECT != null}">
                        <div class="box-head">
                            <h2>Update Subject</h2>
                            <form action="UpdateSubjectAdminServlet" method="post" enctype="multipart/form-data">  
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
                                    <div><textarea maxlength="100" name="description" class="field size1 ckeditor" rows="10" cols="30" required="" >${requestScope.UPDATE_SUBJECT.description}</textarea></div>
                                    </p>
                                </div>
                                <div class="buttons">
                                    <a href="MainController?action=LoadAdminPage" class="button">Cancle</a>
                                    <input type="submit" name="action" class="button" value="UpdateSubjectAdmin" />
                                </div>
                            </c:if>
                        </form>
                        <span style="display: flex; justify-content: flex-end; ">
                            <div class="box" style="margin-left: 15px">
                                <div class="list-group">
                                    <a href="MainController?action=LoadAdminPage" class="list-group-item list-group-item-action ">
                                        Dashboard
                                    </a>
                                    <a href="MainController?action=LoadMentorPage" class="list-group-item list-group-item-action">Mentor Management</a>
                                    <a href="MainController?action=LoadUserPage" class="list-group-item list-group-item-action">User Management</a>
                                    <a href="MainController?action=LoadApprovePage" class="list-group-item list-group-item-action">Approve Mentor</a>
                                    <a href="MainController?action=LoadRequestSubject" class="list-group-item list-group-item-action">Request Subject</a>
                                    <a href="MainController?action=addSubjectPage" class="list-group-item list-group-item-action active">Add Subject</a>
                                    <a href="MainController?action=addCategoryPage" class="list-group-item list-group-item-action">Add Category</a>
                                </div>
                            </div>
                        </span>
                    </div>
                </div>
            </div>
            <script src="ckeditor_4.16.2_basic/ckeditor/ckeditor.js"></script>
    </body>
     
</html>
