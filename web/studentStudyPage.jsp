<%-- 
    Document   : studentStudyPage
    Created on : Oct 13, 2021, 7:25:16 PM
    Author     : HuuToan
--%>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta content="IE=edge" http-equiv="X-UA-Compatible" />
    <meta content="width=device-width,initial-scale=1" name="viewport" />
    <meta content="description" name="description" />
    <meta name="google" content="notranslate" />
    <meta
      content="Mashup templates have been developped by Orson.io team"
      name="author"
    />

    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no" />

    <link href="./assets/apple-touch-icon.png" rel="apple-touch-icon" />
    <link href="./assets/favicon.ico" rel="icon" />

    <!-- link Font Awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
      integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
      crossorigin="anonymous"
    />
    <!-- boot -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />

    <title>Title page</title>

    <!-- <link href="./main.a3f694c0.css" rel="stylesheet" /> -->

    <link rel="stylesheet" href="Content/app.css" />
  </head>
  <body>
      
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
      
    <div class="areaStudy col-md-4">
      <div class="content" >
        <div class="title" style="display: flex;  margin: 10px 10px;">
          <a class="back" href="/Subject/MyCourse.html">Back</a>
          <span><h2>N?i dung bài h?c</h2></span>   

             <!-- Button  Create Chapter -->
<!--        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#createChapter" >
            Creater Chapter
          </button>-->

<!-- Modal -->

          
        
       
        </div>
               <!-- Button  Create Chapter -->
        <div class="dropdown">
          <button
            class="btn btn-secondary dropdown-toggle chapter"
            type="button"
            id="dropdownMenuButton"
            data-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false"
          >
            Ch??ng 1: Bi?n và các ki?u d? li?u th??ng g?p
          </button>
           <!-- Button Plus Create Content -->
           
   <!-- Button Plus Create Content -->
         
           <!-- Update Chapte -->


<!-- Modal -->

            <!-- Update Chapte -->


          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="#"
                  >Bài 1: 2 cách chèn Javascript vào HTML
                  <!-- Button trigger modal -->
                  
                  <!-- Edit Bài h?c -->
                  
        </div>
      </div>
    </div>
       <!-- Edit Bài h?c -->
    <div  class="video ">
      <iframe width="560" height="315" src="https://www.youtube.com/embed/Br4xUFy9OGc" ></iframe>
    </div>

    <!-- <script src="./content.js"></script> -->
    <!-- BOOTSTRAP -->
    <script
    src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"
  ></script>
  <script
    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"
  ></script>

  <script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"
  ></script>
    <!-- Button trigger modal -->
    <script>
      $('#exampleModal').on('show.bs.modal', event => {
        var button = $(event.relatedTarget);
        var modal = $(this);
        // Use above variables to manipulate the DOM
      });

    </script>
  </body>
</html>