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
        <!-- pagination -->
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
            />
    </head>
    <body>
        <jsp:include page="headerTemplate.jsp"></jsp:include>
        <c:forEach items="${ListCourseMentor}" var="list">
            <div class="container" id="jar">  
                <div class="row mx-auto content">
                    <div class="col">
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
                    </div>
                </div>
            </div>
        </c:forEach>
        <nav>
            <ul class="pagination justify-content-center pagination-sm"></ul>
        </nav>
        <jsp:include page="footerTemplate.jsp"></jsp:include>
        <script>
            function getPageList(totalPages, page, maxLength) {
                if (maxLength < 5)
                    throw "maxLength must be at least 5";

                function range(start, end) {
                    return Array.from(Array(end - start + 1), (_, i) => i + start);
                }

                var sideWidth = maxLength < 9 ? 1 : 2;
                var leftWidth = (maxLength - sideWidth * 2 - 3) >> 1;
                var rightWidth = (maxLength - sideWidth * 2 - 2) >> 1;
                if (totalPages <= maxLength) {
                    // no breaks in list
                    return range(1, totalPages);
                }
                if (page <= maxLength - sideWidth - 1 - rightWidth) {
                    // no break on left of page
                    return range(1, maxLength - sideWidth - 1)
                            .concat([0])
                            .concat(range(totalPages - sideWidth + 1, totalPages));
                }
                if (page >= totalPages - sideWidth - 1 - rightWidth) {
                    // no break on right of page
                    return range(1, sideWidth)
                            .concat([0])
                            .concat(
                                    range(
                                            totalPages - sideWidth - 1 - rightWidth - leftWidth,
                                            totalPages
                                            )
                                    );
                }
                // Breaks on both sides
                return range(1, sideWidth)
                        .concat([0])
                        .concat(range(page - leftWidth, page + rightWidth))
                        .concat([0])
                        .concat(range(totalPages - sideWidth + 1, totalPages));
            }

            $(function () {
                // Number of items and limits the number of items per page
                var numberOfItems = $("#jar .content").length;
                var limitPerPage = 5;
                // Total pages rounded upwards
                var totalPages = Math.ceil(numberOfItems / limitPerPage);
                // Number of buttons at the top, not counting prev/next,
                // but including the dotted buttons.
                // Must be at least 5:
                var paginationSize = 7;
                var currentPage;

                function showPage(whichPage) {
                    if (whichPage < 1 || whichPage > totalPages)
                        return false;
                    currentPage = whichPage;
                    $("#jar .content")
                            .hide()
                            .slice((currentPage - 1) * limitPerPage, currentPage * limitPerPage)
                            .show();
                    // Replace the navigation items (not prev/next):
                    $(".pagination li").slice(1, -1).remove();
                    getPageList(totalPages, currentPage, paginationSize).forEach(
                            (item) => {
                        $("<li>")
                                .addClass(
                                        "page-item " +
                                        (item ? "current-page " : "") +
                                        (item === currentPage ? "active " : "")
                                        )
                                .append(
                                        $("<a>")
                                        .addClass("page-link")
                                        .attr({
                                            href: "javascript:void(0)",
                                        })
                                        .text(item || "...")
                                        )
                                .insertBefore("#next-page");
                    }
                    );
                    return true;
                }

                // Include the prev/next buttons:
                $(".pagination").append(
                        $("<li>")
                        .addClass("page-item")
                        .attr({id: "previous-page"})
                        .append(
                                $("<a>")
                                .addClass("page-link")
                                .attr({
                                    href: "javascript:void(0)",
                                })
                                .text("Prev")
                                ),
                        $("<li>")
                        .addClass("page-item")
                        .attr({id: "next-page"})
                        .append(
                                $("<a>")
                                .addClass("page-link")
                                .attr({
                                    href: "javascript:void(0)",
                                })
                                .text("Next")
                                )
                        );
                // Show the page links
                $("#jar").show();
                showPage(1);

                // Use event delegation, as these items are recreated later
                $(document).on(
                        "click",
                        ".pagination li.current-page:not(.active)",
                        function () {
                            return showPage(+$(this).text());
                        }
                );
                $("#next-page").on("click", function () {
                    return showPage(currentPage + 1);
                });

                $("#previous-page").on("click", function () {
                    return showPage(currentPage - 1);
                });
                $(".pagination").on("click", function () {
                    $("html,body").animate({scrollTop: 0}, 0);
                });
            });
        </script>
    </body>
</html>