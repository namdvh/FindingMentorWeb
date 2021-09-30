<%-- 
    Document   : createUser
    Created on : Sep 30, 2021, 10:36:25 AM
    Author     : cunpl
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <c:if test="${empty requestScope.USER_ERROR }">
                <h1> 
                    <c:out value="${requestScope.USER_ERROR}"/>
                </h1>
            </c:if>
        <form action="MainController" method="POST">
            UserID<input type="text" name="UserID" requied="" />
            ${requestScope.USER_ERROR.getUserIDError()}</br>
            Email<input type="text" name="Email" requied="" />
            ${requestScope.USER_ERROR.getEmailError()}</br>
            Role ID:
            Student <input type="checkbox" name="RoleID" value="US" requied="" </br>
            Mentor<input type="checkbox" name="RoleID" value="MT" requied="" </br>
            Certificate <input type="text" name="Certificate" requied="" </br>
            Password<input type="password" name="Password" requied="" </br>
            ${requestScope.USER_ERROR.getPasswordError()}</br>
            Confirm Password<input type="password" name="ConfirmPassword" requied="" />
            ${requestScope.USER_ERROR.getConfirmPasswordError()}</br>
            <input type="submit" name="action" value="Create"/>
            <input type="reset" name="Reset" />
        </form>
    </body>
</html>
