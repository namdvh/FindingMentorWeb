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
        <title>Admin Page</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.min.css">
        <link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <div id="header">
            <div class="shell">
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
        <c:if test="${not empty  requestScope.UPDATE_MSG}">
            ${requestScope.UPDATE_MSG}  
        </c:if>
        <div id="container">
            <div class="shell">
                <br/>
                <div id="main">
                    <div class="cl">&nbsp;</div>
                    <div id="content" style="width: 763px">
                        <div class="box">
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
                                                    <a href="MainController?action=deleteSubjectAdmin&subjectId=${s.subjectId}" class="ico del">Delete</a>
                                                    <a href="MainController?action=updateSubjectPageAdmin&subjectId=${s.subjectId}" class="ico edit">Edit</a>
                                                </th>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </table>
                            </div>
                        </div>
                        <div class="box">
                            <form action="UpdateSubjectAdminServlet" method="post" enctype="multipart/form-data" >
                                <c:if test="${requestScope.UPDATE_SUBJECT != null}">
                                    <div class="box-head">
                                        <h2>Update Subject</h2>
                                    </div>
                                    <div class="form">
                                        <p> <span class="req">max 100 symbols</span>
                                            <label>Subject Name<span>(Required Field)</span></label>
                                            <input type="text" name="subjectName" class="field size1" value="${requestScope.UPDATE_SUBJECT.subjectName}" required=""/>
                                            <input type="hidden" name="subjectId" value="${requestScope.UPDATE_SUBJECT.subjectId}">
                                        </p>
                                        <p> <span class="req">max 100 symbols</span>
                                            <label>Image<span>(Required Field)</span></label>
                                            <input type="file" name="image" class="field size1" value="" accept="image/*"/>
                                            <input type="hidden" name="oldImage" class="field size1" value="${requestScope.UPDATE_SUBJECT.images}"/>
                                        </p>
                                        <p class="inline-field">
                                            <label>Mentor owner</label>
                                            <input type="text" name="userId" value="${requestScope.UPDATE_SUBJECT.userId}" readonly="">
                                            <!--                                            <select class="field size5" name="userId">
                                                                                            <option value="${requestScope.UPDATE_SUBJECT.userId}">${requestScope.UPDATE_SUBJECT.userId}</option>
                                            <c:forEach var="user" items="${sessionScope.LIST_USER}">
                                                <option value="${user.userID}">${user.userID}</option>
                                            </c:forEach>
                                        </select>-->

                                        </p>
                                        <p class="inline-field">
                                            <label>Category</label>
                                            <select class="field size5" name="categoryId">
                                               

                                                <c:forEach var="cate" items="${sessionScope.LIST_CATE}">
                                                    <option value="${cate.categoryId}">${cate.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                        </p>
                                        <p class="inline-field">
                                            <label>Status</label>
                                     <select class="field size5" name="status">
       
                                           <option value="${requestScope.UPDATE_SUBJECT.status}">
                                                    <c:if test="${requestScope.UPDATE_SUBJECT.status ==true}">
                                                        True
                                                    </c:if>             
                                                    <c:if test="${requestScope.UPDATE_SUBJECT.status ==false}">
                                                        False
                                                    </c:if>
                                                </option>
                                                <c:if test="${requestScope.UPDATE_SUBJECT.status ==false}">
                                                    <option value="True">True</option>
                                                </c:if>
                                                    <c:if test="${requestScope.UPDATE_SUBJECT.status ==true}">
                                                    <option value="False">False</option>
                                                </c:if>
                                                    </select>   
                                        </p>
                                        <p> <span class="req">max 100 symbols</span>
                                            <label>Description <span>(Required Field)</span></label>
                                        <div><textarea name="description" class="field size1 ckeditor" rows="10" cols="30" required="" maxlength="100">${requestScope.UPDATE_SUBJECT.description}</textarea></div>
                                        </p>
                                    </div>
                                    <div class="buttons">
                                        <a href="MainController?action=LoadAdminPage" class="button">Cancle</a>
                                        <input type="submit" name="action" class="button" value="UpdateSubjectAdmin" />
                                    </div>
                                </c:if>
                            </form>
                        </div>
                    </div>
                    <div id="sidebar">
                        <div class="box" style="margin-left: 15px">
                            <div class="list-group">
                                <a href="MainController?action=LoadAdminPage" class="list-group-item list-group-item-action active">
                                    Dashboard
                                </a>
                                <a href="MainController?action=LoadMentorPage" class="list-group-item list-group-item-action">Mentor Management</a>
                                <a href="MainController?action=LoadUserPage" class="list-group-item list-group-item-action">User Management</a>
                                <a href="MainController?action=LoadApprovePage" class="list-group-item list-group-item-action">Approve Mentor</a>
                                <a href="MainController?action=LoadRequestSubject" class="list-group-item list-group-item-action">Request Subject</a>
                                <a href="MainController?action=addSubjectPage" class="list-group-item list-group-item-action">Add Subject</a>
                                <a href="MainController?action=addCategoryPage" class="list-group-item list-group-item-action">Add Category</a>
                            </div>
                            <div class="box-content"> 
                                <div class="cl">&nbsp;</div>
                                <!-- Sort -->
                                <div class="sort">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cl">&nbsp;</div>
                </div>
            </div>
        </div>
        <div id="footer">
            <div class="shell"> <span class="left">&copy; 2021 - Company Four Class</span> <span class="right"> Design by C4 Team </span> </div>
        </div>
        <script src="ckeditor_4.16.2_basic/ckeditor/ckeditor.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="sweetalert2.all.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
        <c:if test="${not empty sessionScope.Update_False}">
            <script>
                window.onload = function sweetalertclick() {
                    Swal({
                        text: 'False , please try again !!!',
                        type: 'warning',
                        confirmButtonText: 'Ok'
                    })
                }
            </script>
        </c:if>
        <c:if test="${not empty sessionScope.Update_Success}">
            <script>
                window.onload = function sweetalertclick() {
                    Swal({
                        text: 'Update succesful',
                        type: 'success',
                        confirmButtonText: 'Ok'
                    })
                }
            </script>
        </c:if>
    </body>

</html>
