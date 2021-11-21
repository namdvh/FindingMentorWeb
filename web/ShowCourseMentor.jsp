<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="headerTemplate.jsp"></jsp:include>
            <div class="container">  
            <c:forEach items="${ListCourseMentor}" var="list">
                <table class="table table-striped">
                    <tbody>
                        <!--subject name-->

                        <tr> 
                            <td style="display: flex; gap:15px"> 
                                <img src="${list.images}" style="width: 80px; height: 80px; border-radius: 50%" > 
                                <div style="display: flex; flex-direction: column; justify-content: center; align-items: left">
                                    <h3>
                                        ${list.subjectName}
                                    </h3>
                                    <span style="text-align: center; 
                                          vertical-align: middle;"> 
                                        <p>${list.description}</p>          
                                    </span>
                                </div>
                            </td>
                            <!--Detail button-->
                            <td style="text-align: end; 
                                vertical-align: middle;">
                                <button class="btn btn-primary" style="padding: 10px; background-color: #007bff;
                                        border: none;
                                        color: white;
                                        padding: 10px 10px;
                                        text-align: center;
                                        text-decoration: none;
                                        display: inline-block;
                                        font-size: 16px;
                                        margin: 4px 2px;
                                        cursor: pointer;
                                        border-radius: 5px; text-decoration: none"
                                        ><a style="color: white"  href="MainController?action=LoadSubjectPage&subjectId=${list.subjectId}">Detail</a>
                                </button>

                                <button class="btn btn-primary" style="padding: 10px; background-color: #007bff;
                                        border: none;
                                        color: white;
                                        padding: 10px 10px;
                                        text-align: center;
                                        text-decoration: none;
                                        display: inline-block;
                                        font-size: 16px;
                                        margin: 4px 2px;
                                        cursor: pointer;
                                        border-radius: 5px; text-decoration: none"
                                        ><a style="color: white"  href="MainController?action=Enroll&subjectId=${list.subjectId}">Join Class</a>
                                </button>
                            </td>
                        </tr>  
                    </tbody>
                </table>
            </c:forEach>
        </div>
        <jsp:include page="footerTemplate.jsp"></jsp:include>
    </body>
</html>