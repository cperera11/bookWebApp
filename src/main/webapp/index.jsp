

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Web Application</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <h3>Pick a Task</h3>
        <ul>
            <li><a href="authorController?action=displayList">View all Authors</a></li>
            <li><a href="bookController?action=displayList">View all Books</a></li>
            
            
        </ul>
    </body>
</html>
